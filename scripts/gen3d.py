#!/usr/bin/env python3
"""
SAFENAV CAVITE - 3D Model Generator
Generates GLB files and metadata JSON from earist_cavite_campus.json
Uses pygltflib for GLB generation with Draco compression.
"""

import json
import math
import hashlib
from pathlib import Path
from typing import Dict, List, Tuple, Any, Optional
from dataclasses import dataclass, field
import numpy as np

# Try to import pygltflib
try:
    from pygltflib import (
        GLTF2, Scene, Node, Mesh, Primitive, Accessor, BufferView, Buffer,
        Attributes, Material, PbrMetallicRoughness, Texture, Image, Sampler,
        TextureInfo, Animation, AnimationChannel, AnimationSampler,
        VEC3, VEC2, FLOAT, UNSIGNED_SHORT, UNSIGNED_INT,
        SCALAR, TRIANGLES, VEC4,
        ARRAY_BUFFER, ELEMENT_ARRAY_BUFFER
    )
    # WebGL buffer targets (standard constants)
    STATIC_DRAW = 35044
    DYNAMIC_DRAW = 35048
    PYGLTFLIB_AVAILABLE = True
except ImportError as e:
    PYGLTFLIB_AVAILABLE = False
    print(f"Warning: pygltflib import failed: {e}")
    print("Install with: pip install pygltflib")
    print("For Draco compression: pip install pygltflib[draco]")


@dataclass
class Vector3:
    x: float
    y: float
    z: float

    def __add__(self, other):
        return Vector3(self.x + other.x, self.y + other.y, self.z + other.z)

    def __sub__(self, other):
        return Vector3(self.x - other.x, self.y - other.y, self.z - other.z)

    def __mul__(self, scalar):
        return Vector3(self.x * scalar, self.y * scalar, self.z * scalar)

    def to_list(self):
        return [self.x, self.y, self.z]

    @staticmethod
    def from_list(lst):
        return Vector3(lst[0], lst[1], lst[2])


@dataclass
class RoomPolygon:
    room_id: str
    name: str
    number: str
    category: str
    floor_index: int
    polygon_2d: List[Vector3]  # Normalized coordinates (0-1)
    properties: Dict[str, Any] = field(default_factory=dict)


@dataclass
class Building3DData:
    building_id: str
    name: str
    display_name: str
    floors: List[List[RoomPolygon]]  # floors[floor_index] = list of rooms
    floor_height: float = 3.5
    building_width_meters: float = 50.0
    building_height_meters: float = 50.0


def load_campus_data(json_path: str) -> Dict[str, Building3DData]:
    """Load and parse the campus JSON data into Building3DData objects."""
    with open(json_path, 'r') as f:
        data = json.load(f)

    buildings = {}

    for building_json in data.get('buildings', []):
        building_id = building_json['building_id']
        building_name = building_json['building_name']
        display_name = building_json.get('display_name', building_name)

        floors = []
        floor_height = building_json.get('floor_height', 3.5)

        for floor_json in building_json.get('floors', []):
            floor_rooms = []
            for room_json in floor_json.get('rooms', []):
                # Extract normalized polygon
                geom = room_json.get('geometry', {})
                polygon_data = geom.get('polygon', geom.get('coordinates', []))

                polygon_2d = []
                if polygon_data and isinstance(polygon_data[0], list):
                    # Handle coordinates format: [[[x,y], [x,y], ...]]
                    for ring in polygon_data:
                        for coord in ring:
                            if len(coord) >= 2:
                                polygon_2d.append(Vector3(coord[0], coord[1], 0))
                elif polygon_data and isinstance(polygon_data[0], (int, float)):
                    # Handle flat polygon format: [x, y, x, y, ...] or [[x,y], [x,y], ...]
                    if len(polygon_data) > 0 and isinstance(polygon_data[0], list):
                        for coord in polygon_data:
                            if len(coord) >= 2:
                                polygon_2d.append(Vector3(coord[0], coord[1], 0))

                # If no polygon, create from bbox
                if not polygon_2d:
                    x = geom.get('x', 0)
                    y = geom.get('y', 0)
                    w = geom.get('width', 0.05)
                    h = geom.get('height', 0.05)
                    polygon_2d = [
                        Vector3(x, y, 0),
                        Vector3(x + w, y, 0),
                        Vector3(x + w, y + h, 0),
                        Vector3(x, y + h, 0),
                    ]

                room = RoomPolygon(
                    room_id=room_json['id'],
                    name=room_json.get('name', 'Unknown'),
                    number=room_json.get('room_number', room_json.get('original_label', '')),
                    category=room_json.get('category', 'other'),
                    floor_index=len(floors),
                    polygon_2d=polygon_2d,
                    properties=room_json
                )
                floor_rooms.append(room)

            floors.append(floor_rooms)

        # Calculate building dimensions from room extents
        all_coords = []
        for floor_rooms in floors:
            for room in floor_rooms:
                for v in room.polygon_2d:
                    all_coords.append(v)

        if all_coords:
            min_x = min(v.x for v in all_coords)
            max_x = max(v.x for v in all_coords)
            min_y = min(v.y for v in all_coords)
            max_y = max(v.y for v in all_coords)
            width_norm = max_x - min_x
            height_norm = max_y - min_y
            # Scale to reasonable meters (assume campus is ~200m wide)
            scale = 200.0 / max(width_norm, height_norm)
            building_width = width_norm * scale
            building_height = height_norm * scale
        else:
            building_width = 50.0
            building_height = 50.0
            scale = 1.0

        buildings[building_id] = Building3DData(
            building_id=building_id,
            name=building_name,
            display_name=display_name,
            floors=floors,
            floor_height=floor_height,
            building_width_meters=building_width,
            building_height_meters=building_height
        )

    return buildings


def transform_to_local_coords(
    polygon_2d: List[Vector3],
    building_width: float,
    building_height: float,
    floor_index: int,
    floor_height: float,
    origin_offset_x: float = 0,
    origin_offset_y: float = 0
) -> List[Vector3]:
    """Transform normalized (0-1) coordinates to local Cartesian meters."""
    result = []
    for v in polygon_2d:
        # Normalized (0-1) with origin at top-left, Y down
        # Convert to local Cartesian with origin at center, Y up
        x = (v.x - 0.5) * building_width
        y = -(v.y - 0.5) * building_height  # Flip Y
        z = floor_index * floor_height
        result.append(Vector3(x + origin_offset_x, y + origin_offset_y, z))
    return result


def extrude_polygon(polygon_2d: List[Vector3], height: float) -> Tuple[List[Vector3], List[int]]:
    """
    Extrude a 2D polygon to 3D (walls).
    Returns (vertices, indices) for the wall mesh.
    """
    if len(polygon_2d) < 3:
        return [], []

    vertices = []
    indices = []

    n = len(polygon_2d)
    # Create bottom and top vertices
    for v in polygon_2d:
        vertices.append(Vector3(v.x, v.y, v.z))  # Bottom
    for v in polygon_2d:
        vertices.append(Vector3(v.x, v.y, v.z + height))  # Top

    # Wall quads (two triangles each)
    for i in range(n):
        next_i = (i + 1) % n
        # Bottom left, bottom right, top right, top left
        bl = i
        br = next_i
        tr = next_i + n
        tl = i + n

        # Triangle 1
        indices.extend([bl, br, tr])
        # Triangle 2
        indices.extend([bl, tr, tl])

    return vertices, indices


def create_floor_ceiling_mesh(
    polygon_2d: List[Vector3],
    z: float,
    is_ceiling: bool = False
) -> Tuple[List[Vector3], List[int], List[Vector3]]:
    """
    Create floor or ceiling mesh from polygon (triangulation).
    Returns (vertices, indices, normals).
    Uses simple ear-clipping triangulation for convex polygons.
    """
    if len(polygon_2d) < 3:
        return [], [], []

    vertices = []
    normals = []

    for v in polygon_2d:
        vertices.append(Vector3(v.x, v.y, z))
        normals.append(Vector3(0, 0, 1 if is_ceiling else -1))

    # Simple triangulation (fan from first vertex) - works for convex polygons
    indices = []
    for i in range(1, len(polygon_2d) - 1):
        if is_ceiling:
            indices.extend([0, i, i + 1])
        else:
            indices.extend([0, i + 1, i])  # Flip winding for floor

    return vertices, indices, normals


def compute_polygon_area(polygon: List[Vector3]) -> float:
    """Compute signed area of 2D polygon."""
    area = 0
    n = len(polygon)
    for i in range(n):
        j = (i + 1) % n
        area += polygon[i].x * polygon[j].y
        area -= polygon[j].x * polygon[i].y
    return area / 2


def is_polygon_clockwise(polygon: List[Vector3]) -> bool:
    """Check if polygon vertices are in clockwise order."""
    return compute_polygon_area(polygon) < 0


def ensure_ccw(polygon: List[Vector3]) -> List[Vector3]:
    """Ensure polygon is counter-clockwise."""
    if is_polygon_clockwise(polygon):
        return list(reversed(polygon))
    return polygon


class GLBBuilder:
    """Builds a GLB file using pygltflib."""

    def __init__(self):
        if not PYGLTFLIB_AVAILABLE:
            raise RuntimeError("pygltflib is required. Install with: pip install pygltflib")

        self.gltf = GLTF2()
        self.gltf.scenes = [Scene(nodes=[])]
        self.gltf.scene = 0
        self.gltf.nodes = []
        self.gltf.meshes = []
        self.gltf.mesh_names = []  # Track mesh names
        self.gltf.materials = []
        self.gltf.material_names = []  # Track material names
        self.gltf.accessors = []
        self.gltf.bufferViews = []
        self.gltf.buffers = [Buffer(byteLength=0)]  # Will update later
        self.gltf.asset = {
            "version": "2.0",
            "generator": "SAFENAV 3D Model Generator"
        }

        # Binary data buffer
        self.buffer_data = bytearray()
        self.buffer_offset = 0

        # Default materials
        self._create_default_materials()

    def _create_default_materials(self):
        """Create default materials for different surface types."""
        # Wall material
        wall_mat = Material(
            name="wall",
            pbrMetallicRoughness=PbrMetallicRoughness(
                baseColorFactor=[0.6, 0.6, 0.7, 1.0],
                metallicFactor=0.0,
                roughnessFactor=0.7
            ),
            doubleSided=True
        )
        self.gltf.materials.append(wall_mat)
        self.gltf.material_names.append("wall")
        self.wall_material_index = 0

        # Floor material
        floor_mat = Material(
            name="floor",
            pbrMetallicRoughness=PbrMetallicRoughness(
                baseColorFactor=[0.3, 0.3, 0.35, 1.0],
                metallicFactor=0.0,
                roughnessFactor=0.9
            ),
            doubleSided=False
        )
        self.gltf.materials.append(floor_mat)
        self.gltf.material_names.append("floor")
        self.floor_material_index = 1

        # Ceiling material
        ceiling_mat = Material(
            name="ceiling",
            pbrMetallicRoughness=PbrMetallicRoughness(
                baseColorFactor=[0.8, 0.8, 0.85, 1.0],
                metallicFactor=0.0,
                roughnessFactor=0.5
            ),
            doubleSided=True
        )
        self.gltf.materials.append(ceiling_mat)
        self.gltf.material_names.append("ceiling")
        self.ceiling_material_index = 2

        # Highlight material (for selected rooms)
        highlight_mat = Material(
            name="highlight",
            pbrMetallicRoughness=PbrMetallicRoughness(
                baseColorFactor=[1.0, 0.6, 0.0, 0.9],
                metallicFactor=0.0,
                roughnessFactor=0.3
            ),
            emissiveFactor=[1.0, 0.6, 0.0],
            doubleSided=True,
            alphaMode="BLEND"
        )
        self.gltf.materials.append(highlight_mat)
        self.gltf.material_names.append("highlight")
        self.highlight_material_index = 3

        # Room-type specific materials
        self.category_materials = {}
        category_colors = {
            'classroom': [0.26, 0.65, 0.96, 1.0],      # Blue
            'laboratory': [0.67, 0.28, 0.74, 1.0],     # Purple
            'office': [0.40, 0.73, 0.42, 1.0],         # Green
            'library': [1.0, 0.65, 0.15, 1.0],         # Orange
            'auditorium': [0.94, 0.33, 0.31, 1.0],     # Red
            'gymnasium': [0.15, 0.78, 0.85, 1.0],      # Cyan
            'cafeteria': [1.0, 0.79, 0.16, 1.0],       # Yellow
            'restroom': [0.62, 0.62, 0.62, 1.0],       # Grey
            'corridor': [0.74, 0.74, 0.74, 1.0],       # Light Grey
            'stairs': [0.55, 0.43, 0.39, 1.0],         # Brown
            'elevator': [0.47, 0.56, 0.61, 1.0],       # Blue Grey
            'utility': [0.63, 0.53, 0.50, 1.0],        # Light Brown
            'storage': [0.56, 0.64, 0.68, 1.0],        # Blue Grey Light
        }

        for cat, color in category_colors.items():
            mat = Material(
                name=f"room_{cat}",
                pbrMetallicRoughness=PbrMetallicRoughness(
                    baseColorFactor=color,
                    metallicFactor=0.0,
                    roughnessFactor=0.6
                ),
                doubleSided=True
            )
            self.gltf.materials.append(mat)
            self.gltf.material_names.append(f"room_{cat}")
            self.category_materials[cat] = len(self.gltf.materials) - 1

    def _add_buffer_data(self, data: bytes) -> Tuple[int, int]:
        """Add data to buffer and return (buffer_view_index, accessor_index)."""
        start = self.buffer_offset
        self.buffer_data.extend(data)
        self.buffer_offset += len(data)
        return start, len(data)

    def _create_accessor(self, buffer_view: int, component_type: int, count: int, type: str,
                         min_vals: List[float] = None, max_vals: List[float] = None) -> int:
        """Create an accessor for buffer data."""
        accessor = Accessor(
            bufferView=buffer_view,
            componentType=component_type,
            count=count,
            type=type,
            min=min_vals,
            max=max_vals
        )
        self.gltf.accessors.append(accessor)
        return len(self.gltf.accessors) - 1

    def _create_buffer_view(self, byte_offset: int, byte_length: int, target: int = ARRAY_BUFFER) -> int:
        """Create a buffer view."""
        bv = BufferView(
            buffer=0,
            byteOffset=byte_offset,
            byteLength=byte_length,
            target=target
        )
        self.gltf.bufferViews.append(bv)
        return len(self.gltf.bufferViews) - 1

    def add_mesh(self, name: str, vertices: List[Vector3], indices: List[int],
                 normals: List[Vector3] = None, uvs: List[Vector3] = None,
                 material_index: int = 0) -> int:
        """Add a mesh to the GLB."""
        if not vertices:
            return -1

        # Convert to numpy arrays for efficient binary packing
        verts_np = np.array([v.to_list() for v in vertices], dtype=np.float32)
        idx_np = np.array(indices, dtype=np.uint16 if len(vertices) < 65535 else np.uint32)

        # Vertex positions
        vert_bytes = verts_np.tobytes()
        vert_offset, vert_len = self._add_buffer_data(vert_bytes)
        vert_bv = self._create_buffer_view(vert_offset, vert_len, ARRAY_BUFFER)
        vert_accessor = self._create_accessor(
            vert_bv, FLOAT, len(vertices), VEC3,
            min_vals=np.min(verts_np, axis=0).tolist(),
            max_vals=np.max(verts_np, axis=0).tolist()
        )

        # Indices
        idx_bytes = idx_np.tobytes()
        idx_offset, idx_len = self._add_buffer_data(idx_bytes)
        idx_bv = self._create_buffer_view(idx_offset, idx_len, ELEMENT_ARRAY_BUFFER)
        idx_accessor = self._create_accessor(
            idx_bv, UNSIGNED_SHORT if idx_np.dtype == np.uint16 else UNSIGNED_INT,
            len(indices), SCALAR
        )

        # Normals
        normal_accessor = None
        if normals:
            norms_np = np.array([n.to_list() for n in normals], dtype=np.float32)
            norm_bytes = norms_np.tobytes()
            norm_offset, norm_len = self._add_buffer_data(norm_bytes)
            norm_bv = self._create_buffer_view(norm_offset, norm_len, ARRAY_BUFFER)
            normal_accessor = self._create_accessor(
                norm_bv, FLOAT, len(normals), VEC3
            )

        # UVs
        uv_accessor = None
        if uvs:
            uvs_np = np.array([uv.to_list()[:2] for uv in uvs], dtype=np.float32)
            uv_bytes = uvs_np.tobytes()
            uv_offset, uv_len = self._add_buffer_data(uv_bytes)
            uv_bv = self._create_buffer_view(uv_offset, uv_len, ARRAY_BUFFER)
            uv_accessor = self._create_accessor(
                uv_bv, FLOAT, len(uvs), VEC2
            )

        # Create primitive
        attributes = Attribute(POSITION=vert_accessor)
        if normal_accessor is not None:
            attributes.NORMAL = normal_accessor
        if uv_accessor is not None:
            attributes.TEXCOORD_0 = uv_accessor

        primitive = Primitive(
            attributes=attributes,
            indices=idx_accessor,
            material=material_index,
            mode=TRIANGLES
        )

        # Create mesh
        mesh = Mesh(primitives=[primitive], name=name)
        self.gltf.meshes.append(mesh)
        self.gltf.mesh_names.append(name)

        return len(self.gltf.meshes) - 1

    def add_node(self, name: str, mesh_index: int = -1,
                 translation: Vector3 = None, rotation: List[float] = None,
                 scale: Vector3 = None, children: List[int] = None) -> int:
        """Add a node to the scene graph."""
        node = Node(name=name)
        if mesh_index >= 0:
            node.mesh = mesh_index
        if translation:
            node.translation = translation.to_list()
        if rotation:
            node.rotation = rotation
        if scale:
            node.scale = scale.to_list()
        if children:
            node.children = children

        self.gltf.nodes.append(node)
        return len(self.gltf.nodes) - 1

    def build_building(self, building: Building3DData) -> Tuple[Dict, Dict]:
        """Build the complete building GLB and metadata."""
        print(f"Building 3D model for {building.building_id}...")

        # Create root node for building
        building_node = self.add_node(building.building_id)
        self.gltf.scenes[0].nodes = [building_node]

        floor_nodes = []
        metadata_rooms = {}
        metadata_floors = {}

        for floor_idx, floor_rooms in enumerate(building.floors):
            if not floor_rooms:
                continue

            print(f"  Floor {floor_idx} ({len(floor_rooms)} rooms)")

            # Create floor group node
            floor_name = self._floor_index_to_string(floor_idx)
            floor_group = self.add_node(f"floor_{floor_idx}")

            room_nodes = []
            floor_min_x = float('inf')
            floor_min_y = float('inf')
            floor_max_x = -float('inf')
            floor_max_y = -float('inf')
            floor_room_count = 0

            for room in floor_rooms:
                # Transform polygon to local coordinates
                local_polygon = transform_to_local_coords(
                    room.polygon_2d,
                    building.building_width_meters,
                    building.building_height_meters,
                    floor_idx,
                    building.floor_height
                )

                # Ensure CCW winding
                local_polygon = ensure_ccw(local_polygon)

                # Compute bounds
                min_x = min(v.x for v in local_polygon)
                max_x = max(v.x for v in local_polygon)
                min_y = min(v.y for v in local_polygon)
                max_y = max(v.y for v in local_polygon)
                min_z = floor_idx * building.floor_height
                max_z = min_z + building.floor_height

                floor_min_x = min(floor_min_x, min_x)
                floor_max_x = max(floor_max_x, max_x)
                floor_min_y = min(floor_min_y, min_y)
                floor_max_y = max(floor_max_y, max_y)

                # Get material for room category
                mat_index = self.category_materials.get(room.category, self.wall_material_index)

                # Create room mesh name (must match Three.js expectation)
                mesh_name = f"room_{building.building_id}_{floor_name}_room_{room.number or room.room_id}"

                # Create room geometry
                room_node = self._create_room_mesh(
                    room, local_polygon, building.floor_height, mesh_name, mat_index
                )

                if room_node >= 0:
                    room_nodes.append(room_node)
                    floor_room_count += 1

                # Compute centroid for metadata
                centroid_x = sum(v.x for v in local_polygon) / len(local_polygon)
                centroid_y = sum(v.y for v in local_polygon) / len(local_polygon)
                centroid_z = min_z + building.floor_height / 2

                # Store metadata
                metadata_rooms[room.room_id] = {
                    "roomId": room.room_id,
                    "meshName": mesh_name,
                    "floorIndex": floor_idx,
                    "name": room.name,
                    "number": room.number,
                    "category": room.category,
                    "bounds": {
                        "minX": min_x, "minY": min_y, "minZ": min_z,
                        "maxX": max_x, "maxY": max_y, "maxZ": max_z
                    },
                    "centroid": {"x": centroid_x, "y": centroid_y, "z": centroid_z},
                    "polygon": [[v.x, v.y, v.z] for v in local_polygon],
                    "properties": room.properties
                }

            # Add floor/ceiling for the entire floor
            if floor_rooms:
                # Create combined floor polygon (union of all rooms - simplified to bounding box)
                floor_polygon = [
                    Vector3(floor_min_x, floor_min_y, 0),
                    Vector3(floor_max_x, floor_min_y, 0),
                    Vector3(floor_max_x, floor_max_y, 0),
                    Vector3(floor_min_x, floor_max_y, 0),
                ]
                floor_polygon = ensure_ccw(floor_polygon)

                floor_z = floor_idx * building.floor_height
                ceiling_z = floor_z + building.floor_height

                # Floor mesh
                floor_verts, floor_indices, floor_normals = create_floor_ceiling_mesh(
                    floor_polygon, floor_z, is_ceiling=False
                )
                if floor_verts:
                    floor_mesh_idx = self.add_mesh(
                        f"floor_{floor_idx}",
                        floor_verts, floor_indices, floor_normals,
                        material_index=self.floor_material_index
                    )
                    floor_mesh_node = self.add_node(f"floor_mesh_{floor_idx}", floor_mesh_idx)
                    room_nodes.append(floor_mesh_node)

                # Ceiling mesh
                ceil_verts, ceil_indices, ceil_normals = create_floor_ceiling_mesh(
                    floor_polygon, ceiling_z, is_ceiling=True
                )
                if ceil_verts:
                    ceil_mesh_idx = self.add_mesh(
                        f"ceiling_{floor_idx}",
                        ceil_verts, ceil_indices, ceil_normals,
                        material_index=self.ceiling_material_index
                    )
                    ceil_mesh_node = self.add_node(f"ceiling_mesh_{floor_idx}", ceil_mesh_idx)
                    room_nodes.append(ceil_mesh_node)

            # Create floor group node with all room nodes as children
            floor_group_node = self.add_node(f"floor_{floor_idx}", children=room_nodes)
            floor_nodes.append(floor_group_node)

            # Floor metadata
            metadata_floors[floor_idx] = {
                "index": floor_idx,
                "name": floor_name,
                "elevation": floor_idx * building.floor_height,
                "height": building.floor_height,
                "bounds": {
                    "minX": floor_min_x, "minY": floor_min_y,
                    "maxX": floor_max_x, "maxY": floor_max_y,
                    "minZ": floor_idx * building.floor_height,
                    "maxZ": (floor_idx + 1) * building.floor_height
                },
                "nodeName": f"floor_{floor_idx}",
                "roomCount": floor_room_count
            }

        # Set building node children
        building_node_obj = self.gltf.nodes[building_node]
        building_node_obj.children = floor_nodes

        # Compute building bounds
        all_min_x = min(v for floor in metadata_floors.values() for v in [floor['bounds']['minX']])
        all_max_x = max(v for floor in metadata_floors.values() for v in [floor['bounds']['maxX']])
        all_min_y = min(v for floor in metadata_floors.values() for v in [floor['bounds']['minY']])
        all_max_y = max(v for floor in metadata_floors.values() for v in [floor['bounds']['maxY']])

        # Update buffer byteLength
        self.gltf.buffers[0].byteLength = len(self.buffer_data)

        # Generate metadata
        metadata = self._generate_metadata(building, metadata_rooms, metadata_floors,
                                          all_min_x, all_min_y, all_max_x, all_max_y)

        return self.gltf, metadata

    def _create_room_mesh(self, room: RoomPolygon, local_polygon: List[Vector3],
                          floor_height: float, mesh_name: str, material_index: int) -> int:
        """Create 3D mesh for a single room (walls only)."""
        # Extrude walls
        wall_vertices, wall_indices = extrude_polygon(local_polygon, floor_height)

        if not wall_vertices:
            return -1

        # Compute normals for walls (pointing outward)
        normals = []
        n = len(local_polygon)
        for i in range(n):
            next_i = (i + 1) % n
            # Edge vector
            edge_x = local_polygon[next_i].x - local_polygon[i].x
            edge_y = local_polygon[next_i].y - local_polygon[i].y
            # Outward normal (perpendicular to edge, pointing outward)
            length = math.hypot(edge_x, edge_y)
            if length > 0:
                nx = edge_y / length
                ny = -edge_x / length
            else:
                nx, ny = 0, 0

            # Each wall quad has 4 vertices (2 triangles = 6 indices)
            # Bottom edge normal
            normals.extend([
                Vector3(nx, ny, 0),  # bottom left
                Vector3(nx, ny, 0),  # bottom right
                Vector3(nx, ny, 0),  # top right
                Vector3(nx, ny, 0),  # top right (again)
                Vector3(nx, ny, 0),  # top left
                Vector3(nx, ny, 0),  # bottom left (again)
            ])

        # Generate UVs for walls
        uvs = []
        for i in range(n):
            next_i = (i + 1) % n
            edge_len = math.hypot(
                local_polygon[next_i].x - local_polygon[i].x,
                local_polygon[next_i].y - local_polygon[i].y
            )
            uvs.extend([
                Vector3(0, 0, 0),           # bottom left
                Vector3(edge_len, 0, 0),    # bottom right
                Vector3(edge_len, 1, 0),    # top right
                Vector3(edge_len, 1, 0),    # top right
                Vector3(0, 1, 0),           # top left
                Vector3(0, 0, 0),           # bottom left
            ])

        # Add room mesh
        mesh_idx = self.add_mesh(
            mesh_name,
            wall_vertices, wall_indices, normals, uvs,
            material_index=material_index
        )

        if mesh_idx >= 0:
            # Create node for room
            room_node = self.add_node(mesh_name, mesh_idx)
            return room_node

        return -1

    def _generate_metadata(self, building: Building3DData, rooms_meta: Dict,
                          floors_meta: Dict, min_x: float, min_y: float,
                          max_x: float, max_y: float) -> Dict:
        """Generate metadata JSON for the building."""
        import datetime

        # Compute hash of source data
        source_str = f"{building.building_id}_{len(rooms_meta)}_{building.building_width_meters}"
        source_hash = hashlib.md5(source_str.encode()).hexdigest()[:16]

        # Coordinate transform info
        transform = {
            "buildingId": building.building_id,
            "sourceCrs": "normalized_image",
            "targetCrs": "local_cartesian",
            "transformMatrix": {
                "values": [
                    [building.building_width_meters, 0, 0, -building.building_width_meters / 2],
                    [0, -building.building_height_meters, 0, building.building_height_meters / 2],
                    [0, 0, 1, 0],
                    [0, 0, 0, 1]
                ]
            },
            "translation": {"x": 0, "y": 0, "z": 0},
            "scale": {"x": building.building_width_meters, "y": building.building_height_meters, "z": 1},
            "rotation": 0,
            "sourceBounds": {"minX": 0, "minY": 0, "maxX": 1, "maxY": 1},
            "targetBounds": {"minX": min_x, "minY": min_y, "maxX": max_x, "maxY": max_y}
        }

        metadata = {
            "buildingId": building.building_id,
            "version": "1.0.0",
            "generatedAt": datetime.datetime.now().isoformat(),
            "sourceDataHash": source_hash,
            "coordinateTransform": transform,
            "rooms": rooms_meta,
            "floors": floors_meta,
            "bounds": {
                "minX": min_x, "minY": min_y, "minZ": 0,
                "maxX": max_x, "maxY": max_y,
                "maxZ": len(building.floors) * building.floor_height
            },
            "exportSettings": {
                "includeInteriors": True,
                "includeExteriors": True,
                "compression": "draco",
                "textureQuality": "medium"
            }
        }

        return metadata

    def _floor_index_to_string(self, index: int) -> str:
        return {0: "ground_floor", 1: "2nd_floor", 2: "3rd_floor"}.get(index, f"{index + 1}th_floor")

    def save(self, glb_path: str):
        """Save GLB file."""
        # Convert to binary GLB
        binary_data = self.buffer_data

        # Save using pygltflib
        self.gltf.save_binary(glb_path, binary_data)
        print(f"Saved GLB to {glb_path} ({len(binary_data)} bytes)")


def main():
    import argparse
    parser = argparse.ArgumentParser(description="Generate 3D models for SAFENAV CAVITE")
    parser.add_argument("--input", default="assets/data/earist_cavite_campus.json",
                        help="Input campus JSON file")
    parser.add_argument("--output-dir", default="assets/3d",
                        help="Output directory for GLB and metadata files")
    parser.add_argument("--building", help="Specific building ID to generate (default: all)")
    args = parser.parse_args()

    if not PYGLTFLIB_AVAILABLE:
        print("ERROR: pygltflib is required.")
        print("Install with: pip install pygltflib")
        print("For Draco compression: pip install pygltflib[draco]")
        return 1

    input_path = Path(args.input)
    output_dir = Path(args.output_dir)
    output_dir.mkdir(parents=True, exist_ok=True)

    print(f"Loading campus data from {input_path}...")
    buildings = load_campus_data(str(input_path))

    print(f"Found {len(buildings)} buildings:")
    for bid, bdata in buildings.items():
        total_rooms = sum(len(f) for f in bdata.floors)
        print(f"  {bid}: {bdata.name} ({len(bdata.floors)} floors, {total_rooms} rooms)")

    # Filter to specific building if requested
    if args.building:
        if args.building not in buildings:
            print(f"ERROR: Building '{args.building}' not found")
            return 1
        buildings = {args.building: buildings[args.building]}

    # Generate models for each building
    for building_id, building_data in buildings.items():
        print(f"\nGenerating model for {building_id}...")
        builder = GLBBuilder()
        gltf, metadata = builder.build_building(building_data)

        # Save GLB
        glb_path = output_dir / f"{building_id}.glb"
        builder.save(str(glb_path))

        # Save metadata JSON
        meta_path = output_dir / f"{building_id}_metadata.json"
        with open(meta_path, 'w') as f:
            json.dump(metadata, f, indent=2)
        print(f"Saved metadata to {meta_path}")

    print("\nDone!")
    return 0


if __name__ == "__main__":
    exit(main())