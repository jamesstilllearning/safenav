// Copyright 2025 SAFENAV CAVITE
// Digital Twin screen with 3D campus view, floor selector, room search, and room info

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../data/models/digital_twin_models.dart';
import '../providers/digital_twin_providers.dart';
import '../widgets/digital_twin_view.dart';

/// Screen for the 3D Digital Twin view
class DigitalTwinScreen extends ConsumerStatefulWidget {
  final String buildingId;

  const DigitalTwinScreen({
    super.key,
    required this.buildingId,
  });

  @override
  ConsumerState<DigitalTwinScreen> createState() => _DigitalTwinScreenState();
}

class _DigitalTwinScreenState extends ConsumerState<DigitalTwinScreen> {
  final TextEditingController _searchController = TextEditingController();
  Timer? _searchDebounce;

  @override
  void initState() {
    super.initState();
    // Load the building when screen initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(digitalTwinControllerProvider).loadBuilding(widget.buildingId);
    });

    // Debounce search
    _searchController.addListener(() {
      if (_searchDebounce?.isActive ?? false) {
        _searchDebounce!.cancel();
      }
      _searchDebounce = Timer(const Duration(milliseconds: 300), () {
        ref.read(roomSearchQueryProvider.notifier).state = _searchController.text;
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchDebounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final buildingAsync = ref.watch(building3DProvider(widget.buildingId));
    final currentFloor = ref.watch(currentFloorProvider);
    final theme = ref.watch(digitalTwinThemeProvider);
    final isExploded = ref.watch(explodedViewProvider);
    final highlightedRooms = ref.watch(highlightedRoomsProvider);
    final selectedRoomId = ref.watch(selectedRoomIdProvider);
    final isLoading = ref.watch(digitalTwinLoadingProvider);
    final error = ref.watch(digitalTwinErrorProvider);

    return Scaffold(
      backgroundColor: _getBackgroundColor(theme),
      body: Stack(
        children: [
          // 3D WebView
          Positioned.fill(
            child: buildingAsync.when(
              data: (building) {
                if (building == null) {
                  return _buildErrorView('Building not found: ${widget.buildingId}');
                }
                return DigitalTwinView(
                  buildingId: widget.buildingId,
                  onRoomHovered: (roomId) {
                    ref.read(digitalTwinControllerProvider).highlightRoom(roomId);
                  },
                  onRoomSelected: (roomId) {
                    ref.read(digitalTwinControllerProvider).selectRoom(roomId);
                  },
                  onFloorChanged: (floorIndex) {
                    ref.read(digitalTwinControllerProvider).changeFloor(floorIndex);
                  },
                  onError: (message) {
                    ref.read(digitalTwinErrorProvider.notifier).state = message;
                  },
                );
              },
              loading: () => _buildLoadingView(),
              error: (e, st) => _buildErrorView('Failed to load building: $e'),
            ),
          ),

          // Loading overlay
          if (isLoading)
            _buildLoadingOverlay(),

          // Error banner
          if (error != null)
            _buildErrorBanner(error),

          // Top app bar
          _buildAppBar(context, buildingAsync, theme, isExploded),

          // Floor selector (left side)
          buildingAsync.when(
            data: (building) {
              if (building == null) return const SizedBox.shrink();
              return _buildFloorSelector(context, building, currentFloor);
            },
            loading: () => const SizedBox.shrink(),
            error: (_, __) => const SizedBox.shrink(),
          ),

          // Room search panel (right side)
          buildingAsync.when(
            data: (building) {
              if (building == null) return const SizedBox.shrink();
              return _buildRoomSearchPanel(context, widget.buildingId);
            },
            loading: () => const SizedBox.shrink(),
            error: (_, __) => const SizedBox.shrink(),
          ),

          // Room info panel (bottom)
          if (selectedRoomId != null)
            buildingAsync.when(
              data: (building) {
                if (building == null) return const SizedBox.shrink();
                final room = _findRoomById(building, selectedRoomId);
                if (room == null) return const SizedBox.shrink();
                return _buildRoomInfoPanel(context, room);
              },
              loading: () => const SizedBox.shrink(),
              error: (_, __) => const SizedBox.shrink(),
            ),

          // Selected room badge (when highlighted but not selected)
          if (selectedRoomId == null && highlightedRooms.isNotEmpty)
            _buildHighlightedRoomsBadge(highlightedRooms),
        ],
      ),
    );
  }

  Widget _buildAppBar(
    BuildContext context,
    AsyncValue<Building3D?> buildingAsync,
    DigitalTwinTheme theme,
    bool isExploded,
  ) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // Back button
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => context.pop(),
              tooltip: 'Back to Map',
            ),
            const SizedBox(width: 8),
            // Building name
            Expanded(
              child: buildingAsync.when(
                data: (building) => Text(
                  building?.displayName ?? 'Loading...',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                loading: () => const Text(
                  'Loading...',
                  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
                ),
                error: (_, __) => const Text(
                  'Error',
                  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            // Theme toggle
            IconButton(
              icon: Icon(
                _getThemeIcon(theme),
                color: Colors.white,
              ),
              onPressed: () => ref.read(digitalTwinControllerProvider).toggleTheme(),
              tooltip: 'Toggle Theme (${theme.name})',
            ),
            // Exploded view toggle
            IconButton(
              icon: Icon(
                isExploded ? Icons.layers_clear : Icons.layers,
                color: isExploded ? Colors.amber : Colors.white,
              ),
              onPressed: () => ref.read(digitalTwinControllerProvider).toggleExplodedView(),
              tooltip: isExploded ? 'Collapse Floors' : 'Explode Floors',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFloorSelector(
    BuildContext context,
    Building3D building,
    int currentFloor,
  ) {
    return Positioned(
      left: 16,
      top: 100,
      bottom: 16,
      child: Container(
        width: 60,
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.7),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Floor buttons (reversed so ground floor is at bottom)
            ...List.generate(building.floorCount, (index) {
              final floorIndex = building.floorCount - 1 - index;
              final isSelected = floorIndex == currentFloor;

              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: Material(
                  color: isSelected
                    ? Theme.of(context).colorScheme.primary
                    : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(8),
                    onTap: () => ref.read(digitalTwinControllerProvider).changeFloor(floorIndex),
                    child: Container(
                      width: 52,
                      height: 52,
                      alignment: Alignment.center,
                      child: Text(
                        _getFloorLabel(floorIndex),
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.white70,
                          fontSize: 11,
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              );
            }).reversed,
          ],
        ),
      ),
    );
  }

  Widget _buildRoomSearchPanel(BuildContext context, String buildingId) {
    final searchResults = ref.watch(roomSearchResultsProvider(buildingId));
    final query = ref.watch(roomSearchQueryProvider);
    final isSearching = query.isNotEmpty;

    return Positioned(
      right: 16,
      top: 100,
      width: 280,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Search field
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.85),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
            ),
            child: TextField(
              controller: _searchController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Search rooms...',
                hintStyle: TextStyle(color: Colors.white54),
                prefixIcon: const Icon(Icons.search, color: Colors.white54),
                suffixIcon: query.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear, color: Colors.white54),
                        onPressed: () {
                          _searchController.clear();
                          ref.read(roomSearchQueryProvider.notifier).state = '';
                        },
                      )
                    : null,
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
            ),
          ),
          // Search results
          if (isSearching && searchResults.isNotEmpty)
            Container(
              margin: const EdgeInsets.only(top: 8),
              constraints: const BoxConstraints(maxHeight: 300),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.9),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
              ),
              child: ListView.separated(
                shrinkWrap: true,
                padding: const EdgeInsets.all(8),
                itemCount: searchResults.length,
                separatorBuilder: (_, __) => const Divider(color: Colors.white10, height: 1),
                itemBuilder: (context, index) {
                  final result = searchResults[index];
                  return ListTile(
                    dense: true,
                    leading: Text(
                      result.room.category.icon,
                      style: const TextStyle(fontSize: 20),
                    ),
                    title: Text(
                      result.room.displayLabel,
                      style: const TextStyle(color: Colors.white, fontSize: 13),
                    ),
                    subtitle: Text(
                      'Floor ${result.room.floorIndex} • ${(result.relevanceScore * 100).toInt()}% match',
                      style: const TextStyle(color: Colors.white54, fontSize: 11),
                    ),
                    onTap: () {
                      ref.read(digitalTwinControllerProvider).flyToRoom(result.room.id);
                      ref.read(digitalTwinControllerProvider).selectRoom(result.room.id);
                      ref.read(digitalTwinControllerProvider).changeFloor(result.room.floorIndex);
                      _searchController.clear();
                      ref.read(roomSearchQueryProvider.notifier).state = '';
                    },
                  );
                },
              ),
            ),
          if (isSearching && searchResults.isEmpty)
            Container(
              margin: const EdgeInsets.only(top: 8),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.9),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
              ),
              child: const Text(
                'No rooms found',
                style: TextStyle(color: Colors.white54),
                textAlign: TextAlign.center,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildRoomInfoPanel(BuildContext context, Room3D room) {
    return Positioned(
      left: 16,
      right: 16,
      bottom: 16,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.9),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Color(room.category.color).withValues(alpha: 0.5),
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.3),
              blurRadius: 20,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  room.category.icon,
                  style: const TextStyle(fontSize: 28),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        room.displayLabel,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Floor ${room.floorIndex} • ${room.category.toString().split('.').last}',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.white54),
                  onPressed: () => ref.read(digitalTwinControllerProvider).selectRoom(null),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Divider(color: Colors.white10),
            const SizedBox(height: 8),
            // Room properties
            Wrap(
              spacing: 16,
              runSpacing: 8,
              children: [
                _buildInfoChip('ID', room.id),
                _buildInfoChip('Category', room.category.toString().split('.').last),
                if (room.isEmergencyExit)
                  _buildInfoChip('⚠️', 'Emergency Exit', color: Colors.red),
                if (room.isAssemblyPoint)
                  _buildInfoChip('🏁', 'Assembly Point', color: Colors.green),
                if (!room.isAccessible)
                  _buildInfoChip('♿', 'Limited Access', color: Colors.orange),
              ],
            ),
            const SizedBox(height: 12),
            // Action buttons
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    icon: const Icon(Icons.center_focus_strong, size: 18),
                    label: const Text('Fly To'),
                    onPressed: () => ref.read(digitalTwinControllerProvider).flyToRoom(room.id),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      side: BorderSide(color: Colors.white.withValues(alpha: 0.3)),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: FilledButton.icon(
                    icon: const Icon(Icons.directions, size: 18),
                    label: const Text('Navigate'),
                    onPressed: () {
                      // TODO: Integrate with navigation system
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Navigation to ${room.displayLabel} - Coming soon')),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoChip(String label, String value, {Color? color}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: (color ?? Colors.white).withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: (color ?? Colors.white).withValues(alpha: 0.2)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (label != 'ID' && label != 'Category')
            Text(label, style: TextStyle(color: color ?? Colors.white70, fontSize: 11)),
          if (label == 'ID' || label == 'Category')
            Text('$label: ', style: TextStyle(color: Colors.white54, fontSize: 11)),
          Text(
            value,
            style: TextStyle(
              color: color ?? Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHighlightedRoomsBadge(Set<String> highlightedRooms) {
    if (highlightedRooms.isEmpty) return const SizedBox.shrink();

    return Positioned(
      bottom: 100,
      left: 16,
      right: 16,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.8),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.blueAccent.withValues(alpha: 0.5)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.location_on, color: Colors.blueAccent, size: 18),
            const SizedBox(width: 8),
            Text(
              '${highlightedRooms.length} room${highlightedRooms.length > 1 ? 's' : ''} highlighted',
              style: const TextStyle(color: Colors.white, fontSize: 13),
            ),
            const SizedBox(width: 12),
            TextButton(
              onPressed: () {
                ref.read(highlightedRoomsProvider.notifier).state = <String>{};
                ref.read(digitalTwinControllerProvider).clearHighlight(highlightedRooms.first);
              },
              child: const Text('Clear', style: TextStyle(color: Colors.blueAccent)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoadingView() {
    return Container(
      color: const Color(0xFF1A1A2E),
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(color: Colors.blueAccent),
            SizedBox(height: 16),
            Text('Loading 3D Campus...', style: TextStyle(color: Colors.white70)),
          ],
        ),
      ),
    );
  }

  Widget _buildLoadingOverlay() {
    return Container(
      color: Colors.black.withValues(alpha: 0.7),
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(color: Colors.blueAccent),
            SizedBox(height: 16),
            Text('Loading building...', style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorView(String message) {
    return Container(
      color: const Color(0xFF1A1A2E),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, color: Colors.redAccent, size: 64),
              const SizedBox(height: 16),
              const Text(
                'Unable to Load 3D View',
                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                message,
                style: const TextStyle(color: Colors.white70),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              FilledButton.icon(
                icon: const Icon(Icons.refresh),
                label: const Text('Retry'),
                onPressed: () => ref.read(digitalTwinControllerProvider).loadBuilding(widget.buildingId),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildErrorBanner(String message) {
    return Positioned(
      top: 80,
      left: 16,
      right: 16,
      child: Material(
        color: Colors.redAccent.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              const Icon(Icons.warning, color: Colors.white),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  message,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: () => ref.read(digitalTwinErrorProvider.notifier).state = null,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Room3D? _findRoomById(Building3D building, String roomId) {
    for (final floor in building.floors) {
      for (final room in floor.rooms) {
        if (room.id == roomId) return room;
      }
    }
    return null;
  }

  String _getFloorLabel(int index) {
    return switch (index) {
      0 => 'G',
      1 => '2',
      2 => '3',
      _ => '${index + 1}',
    };
  }

  IconData _getThemeIcon(DigitalTwinTheme theme) {
    return theme.when(
      light: () => Icons.wb_sunny,
      dark: () => Icons.nightlight_round,
      emergency: () => Icons.warning_amber_rounded,
    );
  }

  Color _getBackgroundColor(DigitalTwinTheme theme) {
    return theme.when(
      light: () => const Color(0xFFF5F5F5),
      dark: () => const Color(0xFF1A1A2E),
      emergency: () => const Color(0xFF1A0000),
    );
  }
}