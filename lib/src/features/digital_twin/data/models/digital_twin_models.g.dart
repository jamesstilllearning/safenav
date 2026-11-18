// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'digital_twin_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Building3D _$Building3DFromJson(Map<String, dynamic> json) => _Building3D(
  id: json['id'] as String,
  name: json['name'] as String,
  displayName: json['displayName'] as String,
  floorCount: (json['floorCount'] as num).toInt(),
  floors: (json['floors'] as List<dynamic>)
      .map((e) => Floor3D.fromJson(e as Map<String, dynamic>))
      .toList(),
  bounds: BuildingBounds3D.fromJson(json['bounds'] as Map<String, dynamic>),
  modelPath: json['modelPath'] as String,
  metadataPath: json['metadataPath'] as String,
  type: BuildingType.fromJson(json['type'] as Map<String, dynamic>),
  properties: json['properties'] as Map<String, dynamic>,
  lastUpdated: DateTime.parse(json['lastUpdated'] as String),
);

Map<String, dynamic> _$Building3DToJson(_Building3D instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'displayName': instance.displayName,
      'floorCount': instance.floorCount,
      'floors': instance.floors,
      'bounds': instance.bounds,
      'modelPath': instance.modelPath,
      'metadataPath': instance.metadataPath,
      'type': instance.type,
      'properties': instance.properties,
      'lastUpdated': instance.lastUpdated.toIso8601String(),
    };

AcademicBuilding _$AcademicBuildingFromJson(Map<String, dynamic> json) =>
    AcademicBuilding($type: json['runtimeType'] as String?);

Map<String, dynamic> _$AcademicBuildingToJson(AcademicBuilding instance) =>
    <String, dynamic>{'runtimeType': instance.$type};

AdministrativeBuilding _$AdministrativeBuildingFromJson(
  Map<String, dynamic> json,
) => AdministrativeBuilding($type: json['runtimeType'] as String?);

Map<String, dynamic> _$AdministrativeBuildingToJson(
  AdministrativeBuilding instance,
) => <String, dynamic>{'runtimeType': instance.$type};

LaboratoryBuilding _$LaboratoryBuildingFromJson(Map<String, dynamic> json) =>
    LaboratoryBuilding($type: json['runtimeType'] as String?);

Map<String, dynamic> _$LaboratoryBuildingToJson(LaboratoryBuilding instance) =>
    <String, dynamic>{'runtimeType': instance.$type};

LibraryBuilding _$LibraryBuildingFromJson(Map<String, dynamic> json) =>
    LibraryBuilding($type: json['runtimeType'] as String?);

Map<String, dynamic> _$LibraryBuildingToJson(LibraryBuilding instance) =>
    <String, dynamic>{'runtimeType': instance.$type};

GymnasiumBuilding _$GymnasiumBuildingFromJson(Map<String, dynamic> json) =>
    GymnasiumBuilding($type: json['runtimeType'] as String?);

Map<String, dynamic> _$GymnasiumBuildingToJson(GymnasiumBuilding instance) =>
    <String, dynamic>{'runtimeType': instance.$type};

AuditoriumBuilding _$AuditoriumBuildingFromJson(Map<String, dynamic> json) =>
    AuditoriumBuilding($type: json['runtimeType'] as String?);

Map<String, dynamic> _$AuditoriumBuildingToJson(AuditoriumBuilding instance) =>
    <String, dynamic>{'runtimeType': instance.$type};

CafeteriaBuilding _$CafeteriaBuildingFromJson(Map<String, dynamic> json) =>
    CafeteriaBuilding($type: json['runtimeType'] as String?);

Map<String, dynamic> _$CafeteriaBuildingToJson(CafeteriaBuilding instance) =>
    <String, dynamic>{'runtimeType': instance.$type};

DormitoryBuilding _$DormitoryBuildingFromJson(Map<String, dynamic> json) =>
    DormitoryBuilding($type: json['runtimeType'] as String?);

Map<String, dynamic> _$DormitoryBuildingToJson(DormitoryBuilding instance) =>
    <String, dynamic>{'runtimeType': instance.$type};

OtherBuilding _$OtherBuildingFromJson(Map<String, dynamic> json) =>
    OtherBuilding(
      json['label'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$OtherBuildingToJson(OtherBuilding instance) =>
    <String, dynamic>{'label': instance.label, 'runtimeType': instance.$type};

_BuildingBounds3D _$BuildingBounds3DFromJson(Map<String, dynamic> json) =>
    _BuildingBounds3D(
      minX: (json['minX'] as num).toDouble(),
      minY: (json['minY'] as num).toDouble(),
      minZ: (json['minZ'] as num).toDouble(),
      maxX: (json['maxX'] as num).toDouble(),
      maxY: (json['maxY'] as num).toDouble(),
      maxZ: (json['maxZ'] as num).toDouble(),
    );

Map<String, dynamic> _$BuildingBounds3DToJson(_BuildingBounds3D instance) =>
    <String, dynamic>{
      'minX': instance.minX,
      'minY': instance.minY,
      'minZ': instance.minZ,
      'maxX': instance.maxX,
      'maxY': instance.maxY,
      'maxZ': instance.maxZ,
    };

_Vector3D _$Vector3DFromJson(Map<String, dynamic> json) => _Vector3D(
  x: (json['x'] as num).toDouble(),
  y: (json['y'] as num).toDouble(),
  z: (json['z'] as num).toDouble(),
);

Map<String, dynamic> _$Vector3DToJson(_Vector3D instance) => <String, dynamic>{
  'x': instance.x,
  'y': instance.y,
  'z': instance.z,
};

_Floor3D _$Floor3DFromJson(Map<String, dynamic> json) => _Floor3D(
  index: (json['index'] as num).toInt(),
  name: json['name'] as String,
  elevation: (json['elevation'] as num).toDouble(),
  height: (json['height'] as num).toDouble(),
  rooms: (json['rooms'] as List<dynamic>)
      .map((e) => Room3D.fromJson(e as Map<String, dynamic>))
      .toList(),
  bounds: FloorBounds3D.fromJson(json['bounds'] as Map<String, dynamic>),
  modelNodeName: json['modelNodeName'] as String,
  hasInterior: json['hasInterior'] as bool,
  properties: json['properties'] as Map<String, dynamic>,
);

Map<String, dynamic> _$Floor3DToJson(_Floor3D instance) => <String, dynamic>{
  'index': instance.index,
  'name': instance.name,
  'elevation': instance.elevation,
  'height': instance.height,
  'rooms': instance.rooms,
  'bounds': instance.bounds,
  'modelNodeName': instance.modelNodeName,
  'hasInterior': instance.hasInterior,
  'properties': instance.properties,
};

_FloorBounds3D _$FloorBounds3DFromJson(Map<String, dynamic> json) =>
    _FloorBounds3D(
      minX: (json['minX'] as num).toDouble(),
      minY: (json['minY'] as num).toDouble(),
      maxX: (json['maxX'] as num).toDouble(),
      maxY: (json['maxY'] as num).toDouble(),
      minZ: (json['minZ'] as num).toDouble(),
      maxZ: (json['maxZ'] as num).toDouble(),
    );

Map<String, dynamic> _$FloorBounds3DToJson(_FloorBounds3D instance) =>
    <String, dynamic>{
      'minX': instance.minX,
      'minY': instance.minY,
      'maxX': instance.maxX,
      'maxY': instance.maxY,
      'minZ': instance.minZ,
      'maxZ': instance.maxZ,
    };

_Room3D _$Room3DFromJson(Map<String, dynamic> json) => _Room3D(
  id: json['id'] as String,
  buildingId: json['buildingId'] as String,
  floorIndex: (json['floorIndex'] as num).toInt(),
  name: json['name'] as String,
  number: json['number'] as String,
  category: RoomCategory.fromJson(json['category'] as Map<String, dynamic>),
  bounds: RoomBounds3D.fromJson(json['bounds'] as Map<String, dynamic>),
  meshName: json['meshName'] as String,
  centroid: Vector3D.fromJson(json['centroid'] as Map<String, dynamic>),
  polygon: (json['polygon'] as List<dynamic>)
      .map((e) => Vector3D.fromJson(e as Map<String, dynamic>))
      .toList(),
  properties: json['properties'] as Map<String, dynamic>,
  isAccessible: json['isAccessible'] as bool,
  isEmergencyExit: json['isEmergencyExit'] as bool,
  isAssemblyPoint: json['isAssemblyPoint'] as bool,
);

Map<String, dynamic> _$Room3DToJson(_Room3D instance) => <String, dynamic>{
  'id': instance.id,
  'buildingId': instance.buildingId,
  'floorIndex': instance.floorIndex,
  'name': instance.name,
  'number': instance.number,
  'category': instance.category,
  'bounds': instance.bounds,
  'meshName': instance.meshName,
  'centroid': instance.centroid,
  'polygon': instance.polygon,
  'properties': instance.properties,
  'isAccessible': instance.isAccessible,
  'isEmergencyExit': instance.isEmergencyExit,
  'isAssemblyPoint': instance.isAssemblyPoint,
};

Classroom _$ClassroomFromJson(Map<String, dynamic> json) =>
    Classroom($type: json['runtimeType'] as String?);

Map<String, dynamic> _$ClassroomToJson(Classroom instance) => <String, dynamic>{
  'runtimeType': instance.$type,
};

Laboratory _$LaboratoryFromJson(Map<String, dynamic> json) =>
    Laboratory($type: json['runtimeType'] as String?);

Map<String, dynamic> _$LaboratoryToJson(Laboratory instance) =>
    <String, dynamic>{'runtimeType': instance.$type};

Office _$OfficeFromJson(Map<String, dynamic> json) =>
    Office($type: json['runtimeType'] as String?);

Map<String, dynamic> _$OfficeToJson(Office instance) => <String, dynamic>{
  'runtimeType': instance.$type,
};

Library _$LibraryFromJson(Map<String, dynamic> json) =>
    Library($type: json['runtimeType'] as String?);

Map<String, dynamic> _$LibraryToJson(Library instance) => <String, dynamic>{
  'runtimeType': instance.$type,
};

Auditorium _$AuditoriumFromJson(Map<String, dynamic> json) =>
    Auditorium($type: json['runtimeType'] as String?);

Map<String, dynamic> _$AuditoriumToJson(Auditorium instance) =>
    <String, dynamic>{'runtimeType': instance.$type};

Gymnasium _$GymnasiumFromJson(Map<String, dynamic> json) =>
    Gymnasium($type: json['runtimeType'] as String?);

Map<String, dynamic> _$GymnasiumToJson(Gymnasium instance) => <String, dynamic>{
  'runtimeType': instance.$type,
};

Cafeteria _$CafeteriaFromJson(Map<String, dynamic> json) =>
    Cafeteria($type: json['runtimeType'] as String?);

Map<String, dynamic> _$CafeteriaToJson(Cafeteria instance) => <String, dynamic>{
  'runtimeType': instance.$type,
};

Restroom _$RestroomFromJson(Map<String, dynamic> json) =>
    Restroom($type: json['runtimeType'] as String?);

Map<String, dynamic> _$RestroomToJson(Restroom instance) => <String, dynamic>{
  'runtimeType': instance.$type,
};

Corridor _$CorridorFromJson(Map<String, dynamic> json) =>
    Corridor($type: json['runtimeType'] as String?);

Map<String, dynamic> _$CorridorToJson(Corridor instance) => <String, dynamic>{
  'runtimeType': instance.$type,
};

Stairs _$StairsFromJson(Map<String, dynamic> json) =>
    Stairs($type: json['runtimeType'] as String?);

Map<String, dynamic> _$StairsToJson(Stairs instance) => <String, dynamic>{
  'runtimeType': instance.$type,
};

Elevator _$ElevatorFromJson(Map<String, dynamic> json) =>
    Elevator($type: json['runtimeType'] as String?);

Map<String, dynamic> _$ElevatorToJson(Elevator instance) => <String, dynamic>{
  'runtimeType': instance.$type,
};

Utility _$UtilityFromJson(Map<String, dynamic> json) =>
    Utility($type: json['runtimeType'] as String?);

Map<String, dynamic> _$UtilityToJson(Utility instance) => <String, dynamic>{
  'runtimeType': instance.$type,
};

Storage _$StorageFromJson(Map<String, dynamic> json) =>
    Storage($type: json['runtimeType'] as String?);

Map<String, dynamic> _$StorageToJson(Storage instance) => <String, dynamic>{
  'runtimeType': instance.$type,
};

Other _$OtherFromJson(Map<String, dynamic> json) =>
    Other(json['label'] as String, $type: json['runtimeType'] as String?);

Map<String, dynamic> _$OtherToJson(Other instance) => <String, dynamic>{
  'label': instance.label,
  'runtimeType': instance.$type,
};

_RoomBounds3D _$RoomBounds3DFromJson(Map<String, dynamic> json) =>
    _RoomBounds3D(
      minX: (json['minX'] as num).toDouble(),
      minY: (json['minY'] as num).toDouble(),
      minZ: (json['minZ'] as num).toDouble(),
      maxX: (json['maxX'] as num).toDouble(),
      maxY: (json['maxY'] as num).toDouble(),
      maxZ: (json['maxZ'] as num).toDouble(),
    );

Map<String, dynamic> _$RoomBounds3DToJson(_RoomBounds3D instance) =>
    <String, dynamic>{
      'minX': instance.minX,
      'minY': instance.minY,
      'minZ': instance.minZ,
      'maxX': instance.maxX,
      'maxY': instance.maxY,
      'maxZ': instance.maxZ,
    };

_Loading _$LoadingFromJson(Map<String, dynamic> json) =>
    _Loading($type: json['runtimeType'] as String?);

Map<String, dynamic> _$LoadingToJson(_Loading instance) => <String, dynamic>{
  'runtimeType': instance.$type,
};

_Loaded _$LoadedFromJson(Map<String, dynamic> json) => _Loaded(
  building: Building3D.fromJson(json['building'] as Map<String, dynamic>),
  currentFloor: (json['currentFloor'] as num).toInt(),
  highlightedRooms: (json['highlightedRooms'] as List<dynamic>)
      .map((e) => e as String)
      .toSet(),
  selectedRoomId: json['selectedRoomId'] as String?,
  theme: DigitalTwinTheme.fromJson(json['theme'] as Map<String, dynamic>),
  isExplodedView: json['isExplodedView'] as bool,
  camera: CameraState.fromJson(json['camera'] as Map<String, dynamic>),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$LoadedToJson(_Loaded instance) => <String, dynamic>{
  'building': instance.building,
  'currentFloor': instance.currentFloor,
  'highlightedRooms': instance.highlightedRooms.toList(),
  'selectedRoomId': instance.selectedRoomId,
  'theme': instance.theme,
  'isExplodedView': instance.isExplodedView,
  'camera': instance.camera,
  'runtimeType': instance.$type,
};

_Error _$ErrorFromJson(Map<String, dynamic> json) => _Error(
  message: json['message'] as String,
  error: json['error'],
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$ErrorToJson(_Error instance) => <String, dynamic>{
  'message': instance.message,
  'error': instance.error,
  'runtimeType': instance.$type,
};

_CameraState _$CameraStateFromJson(Map<String, dynamic> json) => _CameraState(
  position: Vector3D.fromJson(json['position'] as Map<String, dynamic>),
  target: Vector3D.fromJson(json['target'] as Map<String, dynamic>),
  zoom: (json['zoom'] as num).toDouble(),
  polarAngle: (json['polarAngle'] as num).toDouble(),
  azimuthAngle: (json['azimuthAngle'] as num).toDouble(),
);

Map<String, dynamic> _$CameraStateToJson(_CameraState instance) =>
    <String, dynamic>{
      'position': instance.position,
      'target': instance.target,
      'zoom': instance.zoom,
      'polarAngle': instance.polarAngle,
      'azimuthAngle': instance.azimuthAngle,
    };

LightTheme _$LightThemeFromJson(Map<String, dynamic> json) =>
    LightTheme($type: json['runtimeType'] as String?);

Map<String, dynamic> _$LightThemeToJson(LightTheme instance) =>
    <String, dynamic>{'runtimeType': instance.$type};

DarkTheme _$DarkThemeFromJson(Map<String, dynamic> json) =>
    DarkTheme($type: json['runtimeType'] as String?);

Map<String, dynamic> _$DarkThemeToJson(DarkTheme instance) => <String, dynamic>{
  'runtimeType': instance.$type,
};

EmergencyTheme _$EmergencyThemeFromJson(Map<String, dynamic> json) =>
    EmergencyTheme($type: json['runtimeType'] as String?);

Map<String, dynamic> _$EmergencyThemeToJson(EmergencyTheme instance) =>
    <String, dynamic>{'runtimeType': instance.$type};

_RoomSearchResult _$RoomSearchResultFromJson(Map<String, dynamic> json) =>
    _RoomSearchResult(
      room: Room3D.fromJson(json['room'] as Map<String, dynamic>),
      relevanceScore: (json['relevanceScore'] as num).toDouble(),
      matchType: SearchMatchType.fromJson(
        json['matchType'] as Map<String, dynamic>,
      ),
      matchedField: json['matchedField'] as String,
    );

Map<String, dynamic> _$RoomSearchResultToJson(_RoomSearchResult instance) =>
    <String, dynamic>{
      'room': instance.room,
      'relevanceScore': instance.relevanceScore,
      'matchType': instance.matchType,
      'matchedField': instance.matchedField,
    };

ExactMatch _$ExactMatchFromJson(Map<String, dynamic> json) =>
    ExactMatch($type: json['runtimeType'] as String?);

Map<String, dynamic> _$ExactMatchToJson(ExactMatch instance) =>
    <String, dynamic>{'runtimeType': instance.$type};

PrefixMatch _$PrefixMatchFromJson(Map<String, dynamic> json) =>
    PrefixMatch($type: json['runtimeType'] as String?);

Map<String, dynamic> _$PrefixMatchToJson(PrefixMatch instance) =>
    <String, dynamic>{'runtimeType': instance.$type};

ContainsMatch _$ContainsMatchFromJson(Map<String, dynamic> json) =>
    ContainsMatch($type: json['runtimeType'] as String?);

Map<String, dynamic> _$ContainsMatchToJson(ContainsMatch instance) =>
    <String, dynamic>{'runtimeType': instance.$type};

FuzzyMatch _$FuzzyMatchFromJson(Map<String, dynamic> json) =>
    FuzzyMatch($type: json['runtimeType'] as String?);

Map<String, dynamic> _$FuzzyMatchToJson(FuzzyMatch instance) =>
    <String, dynamic>{'runtimeType': instance.$type};

_LoadBuilding _$LoadBuildingFromJson(Map<String, dynamic> json) =>
    _LoadBuilding(
      buildingId: json['buildingId'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$LoadBuildingToJson(_LoadBuilding instance) =>
    <String, dynamic>{
      'buildingId': instance.buildingId,
      'runtimeType': instance.$type,
    };

_ShowFloor _$ShowFloorFromJson(Map<String, dynamic> json) => _ShowFloor(
  floorIndex: (json['floorIndex'] as num).toInt(),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$ShowFloorToJson(_ShowFloor instance) =>
    <String, dynamic>{
      'floorIndex': instance.floorIndex,
      'runtimeType': instance.$type,
    };

_SetFloorVisibility _$SetFloorVisibilityFromJson(Map<String, dynamic> json) =>
    _SetFloorVisibility(
      floorIndex: (json['floorIndex'] as num).toInt(),
      visible: json['visible'] as bool,
      opacity: (json['opacity'] as num?)?.toDouble() ?? 1.0,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$SetFloorVisibilityToJson(_SetFloorVisibility instance) =>
    <String, dynamic>{
      'floorIndex': instance.floorIndex,
      'visible': instance.visible,
      'opacity': instance.opacity,
      'runtimeType': instance.$type,
    };

_HighlightRoom _$HighlightRoomFromJson(Map<String, dynamic> json) =>
    _HighlightRoom(
      roomId: json['roomId'] as String,
      color: (json['color'] as num?)?.toInt(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$HighlightRoomToJson(_HighlightRoom instance) =>
    <String, dynamic>{
      'roomId': instance.roomId,
      'color': instance.color,
      'runtimeType': instance.$type,
    };

_ClearHighlight _$ClearHighlightFromJson(Map<String, dynamic> json) =>
    _ClearHighlight(
      roomId: json['roomId'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$ClearHighlightToJson(_ClearHighlight instance) =>
    <String, dynamic>{'roomId': instance.roomId, 'runtimeType': instance.$type};

_FlyToRoom _$FlyToRoomFromJson(Map<String, dynamic> json) => _FlyToRoom(
  roomId: json['roomId'] as String,
  duration: (json['duration'] as num?)?.toInt() ?? 1000,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$FlyToRoomToJson(_FlyToRoom instance) =>
    <String, dynamic>{
      'roomId': instance.roomId,
      'duration': instance.duration,
      'runtimeType': instance.$type,
    };

_SetTheme _$SetThemeFromJson(Map<String, dynamic> json) => _SetTheme(
  theme: json['theme'] as String,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$SetThemeToJson(_SetTheme instance) => <String, dynamic>{
  'theme': instance.theme,
  'runtimeType': instance.$type,
};

_SetExplodedView _$SetExplodedViewFromJson(Map<String, dynamic> json) =>
    _SetExplodedView(
      enabled: json['enabled'] as bool,
      separation: (json['separation'] as num?)?.toDouble() ?? 5.0,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$SetExplodedViewToJson(_SetExplodedView instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
      'separation': instance.separation,
      'runtimeType': instance.$type,
    };

_SetCameraPosition _$SetCameraPositionFromJson(Map<String, dynamic> json) =>
    _SetCameraPosition(
      x: (json['x'] as num).toDouble(),
      y: (json['y'] as num).toDouble(),
      z: (json['z'] as num).toDouble(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$SetCameraPositionToJson(_SetCameraPosition instance) =>
    <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
      'z': instance.z,
      'runtimeType': instance.$type,
    };

_RequestState _$RequestStateFromJson(Map<String, dynamic> json) =>
    _RequestState($type: json['runtimeType'] as String?);

Map<String, dynamic> _$RequestStateToJson(_RequestState instance) =>
    <String, dynamic>{'runtimeType': instance.$type};

_ModelLoaded _$ModelLoadedFromJson(Map<String, dynamic> json) => _ModelLoaded(
  buildingId: json['buildingId'] as String,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$ModelLoadedToJson(_ModelLoaded instance) =>
    <String, dynamic>{
      'buildingId': instance.buildingId,
      'runtimeType': instance.$type,
    };

_FloorChanged _$FloorChangedFromJson(Map<String, dynamic> json) =>
    _FloorChanged(
      floorIndex: (json['floorIndex'] as num).toInt(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$FloorChangedToJson(_FloorChanged instance) =>
    <String, dynamic>{
      'floorIndex': instance.floorIndex,
      'runtimeType': instance.$type,
    };

_RoomHovered _$RoomHoveredFromJson(Map<String, dynamic> json) => _RoomHovered(
  roomId: json['roomId'] as String,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$RoomHoveredToJson(_RoomHovered instance) =>
    <String, dynamic>{'roomId': instance.roomId, 'runtimeType': instance.$type};

_RoomSelected _$RoomSelectedFromJson(Map<String, dynamic> json) =>
    _RoomSelected(
      roomId: json['roomId'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$RoomSelectedToJson(_RoomSelected instance) =>
    <String, dynamic>{'roomId': instance.roomId, 'runtimeType': instance.$type};

_CameraChanged _$CameraChangedFromJson(Map<String, dynamic> json) =>
    _CameraChanged(
      camera: CameraState.fromJson(json['camera'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$CameraChangedToJson(_CameraChanged instance) =>
    <String, dynamic>{'camera': instance.camera, 'runtimeType': instance.$type};

_ThreeJsError _$ThreeJsErrorFromJson(Map<String, dynamic> json) =>
    _ThreeJsError(
      message: json['message'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$ThreeJsErrorToJson(_ThreeJsError instance) =>
    <String, dynamic>{
      'message': instance.message,
      'runtimeType': instance.$type,
    };

_CoordinateTransform _$CoordinateTransformFromJson(Map<String, dynamic> json) =>
    _CoordinateTransform(
      buildingId: json['buildingId'] as String,
      sourceCrs: json['sourceCrs'] as String,
      targetCrs: json['targetCrs'] as String,
      transformMatrix: Matrix4x4.fromJson(
        json['transformMatrix'] as Map<String, dynamic>,
      ),
      translation: Vector3D.fromJson(
        json['translation'] as Map<String, dynamic>,
      ),
      scale: Vector3D.fromJson(json['scale'] as Map<String, dynamic>),
      rotation: (json['rotation'] as num).toDouble(),
      sourceBounds: BoundingBox2D.fromJson(
        json['sourceBounds'] as Map<String, dynamic>,
      ),
      targetBounds: BoundingBox2D.fromJson(
        json['targetBounds'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$CoordinateTransformToJson(
  _CoordinateTransform instance,
) => <String, dynamic>{
  'buildingId': instance.buildingId,
  'sourceCrs': instance.sourceCrs,
  'targetCrs': instance.targetCrs,
  'transformMatrix': instance.transformMatrix,
  'translation': instance.translation,
  'scale': instance.scale,
  'rotation': instance.rotation,
  'sourceBounds': instance.sourceBounds,
  'targetBounds': instance.targetBounds,
};

_Matrix4x4 _$Matrix4x4FromJson(Map<String, dynamic> json) => _Matrix4x4(
  values: (json['values'] as List<dynamic>)
      .map(
        (e) => (e as List<dynamic>).map((e) => (e as num).toDouble()).toList(),
      )
      .toList(),
);

Map<String, dynamic> _$Matrix4x4ToJson(_Matrix4x4 instance) =>
    <String, dynamic>{'values': instance.values};

_BoundingBox2D _$BoundingBox2DFromJson(Map<String, dynamic> json) =>
    _BoundingBox2D(
      minX: (json['minX'] as num).toDouble(),
      minY: (json['minY'] as num).toDouble(),
      maxX: (json['maxX'] as num).toDouble(),
      maxY: (json['maxY'] as num).toDouble(),
    );

Map<String, dynamic> _$BoundingBox2DToJson(_BoundingBox2D instance) =>
    <String, dynamic>{
      'minX': instance.minX,
      'minY': instance.minY,
      'maxX': instance.maxX,
      'maxY': instance.maxY,
    };

_ModelMetadata _$ModelMetadataFromJson(Map<String, dynamic> json) =>
    _ModelMetadata(
      buildingId: json['buildingId'] as String,
      version: json['version'] as String,
      generatedAt: DateTime.parse(json['generatedAt'] as String),
      sourceDataHash: json['sourceDataHash'] as String,
      coordinateTransform: CoordinateTransform.fromJson(
        json['coordinateTransform'] as Map<String, dynamic>,
      ),
      rooms: (json['rooms'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, RoomMetadata.fromJson(e as Map<String, dynamic>)),
      ),
      floors: (json['floors'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
          int.parse(k),
          FloorMetadata.fromJson(e as Map<String, dynamic>),
        ),
      ),
      bounds: BuildingBounds3D.fromJson(json['bounds'] as Map<String, dynamic>),
      exportSettings: json['exportSettings'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$ModelMetadataToJson(_ModelMetadata instance) =>
    <String, dynamic>{
      'buildingId': instance.buildingId,
      'version': instance.version,
      'generatedAt': instance.generatedAt.toIso8601String(),
      'sourceDataHash': instance.sourceDataHash,
      'coordinateTransform': instance.coordinateTransform,
      'rooms': instance.rooms,
      'floors': instance.floors.map((k, e) => MapEntry(k.toString(), e)),
      'bounds': instance.bounds,
      'exportSettings': instance.exportSettings,
    };

_RoomMetadata _$RoomMetadataFromJson(Map<String, dynamic> json) =>
    _RoomMetadata(
      roomId: json['roomId'] as String,
      meshName: json['meshName'] as String,
      floorIndex: (json['floorIndex'] as num).toInt(),
      name: json['name'] as String,
      number: json['number'] as String,
      category: json['category'] as String,
      bounds: RoomBounds3D.fromJson(json['bounds'] as Map<String, dynamic>),
      centroid: Vector3D.fromJson(json['centroid'] as Map<String, dynamic>),
      polygon: (json['polygon'] as List<dynamic>)
          .map((e) => Vector3D.fromJson(e as Map<String, dynamic>))
          .toList(),
      properties: json['properties'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$RoomMetadataToJson(_RoomMetadata instance) =>
    <String, dynamic>{
      'roomId': instance.roomId,
      'meshName': instance.meshName,
      'floorIndex': instance.floorIndex,
      'name': instance.name,
      'number': instance.number,
      'category': instance.category,
      'bounds': instance.bounds,
      'centroid': instance.centroid,
      'polygon': instance.polygon,
      'properties': instance.properties,
    };

_FloorMetadata _$FloorMetadataFromJson(Map<String, dynamic> json) =>
    _FloorMetadata(
      index: (json['index'] as num).toInt(),
      name: json['name'] as String,
      elevation: (json['elevation'] as num).toDouble(),
      height: (json['height'] as num).toDouble(),
      bounds: FloorBounds3D.fromJson(json['bounds'] as Map<String, dynamic>),
      nodeName: json['nodeName'] as String,
      roomCount: (json['roomCount'] as num).toInt(),
    );

Map<String, dynamic> _$FloorMetadataToJson(_FloorMetadata instance) =>
    <String, dynamic>{
      'index': instance.index,
      'name': instance.name,
      'elevation': instance.elevation,
      'height': instance.height,
      'bounds': instance.bounds,
      'nodeName': instance.nodeName,
      'roomCount': instance.roomCount,
    };
