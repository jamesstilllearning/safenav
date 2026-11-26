/// SAFENAV CAVITE - Start Location Selector
///
/// Modal widget for selecting manual indoor starting point (building → floor → room/facility).
library;

import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../shared/widgets/widgets.dart';
import '../../../../map/presentation/providers/map_providers.dart';
import '../../../../map/data/models/campus_room.dart';
import '../../../../map/data/services/campus_map_parser.dart';
import '../../../data/models/navigation_models.dart';
import '../../providers/navigation_providers.dart';

/// Modal for selecting indoor start location: Building → Floor → Room/Facility
class StartLocationSelector extends ConsumerStatefulWidget {
  final VoidCallback? onLocationSelected;

  const StartLocationSelector({
    super.key,
    this.onLocationSelected,
  });

  @override
  ConsumerState<StartLocationSelector> createState() => _StartLocationSelectorState();
}

class _StartLocationSelectorState extends ConsumerState<StartLocationSelector> {
  String? _selectedBuildingId;
  String? _selectedFloorId;
  String? _selectedRoomId;
  int _currentStep = 0; // 0: building, 1: floor, 2: room

  List<CampusBuildingReference> _buildings = [];
  List<CampusFloor> _floors = [];
  List<CampusRoom> _rooms = [];

  @override
  void initState() {
    super.initState();
    _loadBuildings();
  }

  Future<void> _loadBuildings() async {
    final parser = ref.read(campusMapParserProvider);
    if (!parser.isInitialized) {
      await parser.initialize();
    }
    setState(() {
      _buildings = parser.getBuildingReferences();
    });
  }

  void _onBuildingSelected(String buildingId) {
    setState(() {
      _selectedBuildingId = buildingId;
      _selectedFloorId = null;
      _selectedRoomId = null;
      _currentStep = 1;

      // Load floors for this building
      final building = _buildings.firstWhere((b) => b.id == buildingId);
      _floors = building.floors;
    });
  }

  void _onFloorSelected(String floorId) {
    setState(() {
      _selectedFloorId = floorId;
      _selectedRoomId = null;
      _currentStep = 2;

      // Load rooms for this building and floor
      final parser = ref.read(campusMapParserProvider);
      _rooms = parser.getRoomsInBuildingOnFloor(_selectedBuildingId!, floorId)
          .where((r) => r.isNavigableSpace)
          .toList();
    });
  }

  void _onRoomSelected(String roomId) {
    setState(() {
      _selectedRoomId = roomId;
    });
  }

  void _confirmSelection() {
    if (_selectedBuildingId != null && _selectedFloorId != null && _selectedRoomId != null) {
      final room = _rooms.firstWhere((r) => r.id == _selectedRoomId);
      final indoorStartPoint = IndoorStartPoint(
        buildingId: _selectedBuildingId!,
        floorId: _selectedFloorId!,
        roomId: room.id,
        roomName: room.name,
        coordinates: room.geometry.hasRealWorldCoords && room.geometry.centroid != null
            ? room.geometry.centroid
            : null,
        description: '${room.name}, ${room.floorLevel.label}, Building $_selectedBuildingId',
      );

      ref.read(selectedIndoorStartPointProvider.notifier).state = indoorStartPoint;
      ref.read(useGpsStartProvider.notifier).state = false;

      widget.onLocationSelected?.call();
      Navigator.of(context).pop();
    }
  }

  void _goBack() {
    setState(() {
      if (_currentStep > 0) {
        _currentStep--;
        if (_currentStep == 0) {
          _selectedBuildingId = null;
          _selectedFloorId = null;
        } else if (_currentStep == 1) {
          _selectedFloorId = null;
          _selectedRoomId = null;
        }
      } else {
        Navigator.of(context).pop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              // Handle bar
              Container(
                margin: const EdgeInsets.only(top: 12),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: colorScheme.outlineVariant,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),

              // Header
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: _goBack,
                      tooltip: _currentStep == 0 ? 'Close' : 'Back',
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        _getStepTitle(),
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    if (_currentStep > 0)
                      AppTextButton(
                        onPressed: _confirmSelection,
                        label: 'Confirm',
                        icon: Icons.check,
                        iconPosition: IconPosition.leading,
                        foregroundColor: colorScheme.primary,
                        semanticLabel: 'Confirm selected indoor start point',
                      ),
                  ],
                ),
              ),

              // Progress indicator
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    _buildStepIndicator(0, 'Building'),
                    _buildStepConnector(0),
                    _buildStepIndicator(1, 'Floor'),
                    _buildStepConnector(1),
                    _buildStepIndicator(2, 'Room'),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Content
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: _buildStepContent(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  String _getStepTitle() {
    switch (_currentStep) {
      case 0:
        return 'Select Building';
      case 1:
        final building = _buildings.firstWhere((b) => b.id == _selectedBuildingId, orElse: () => throw StateError('Building not found'));
        return 'Select Floor in ${building.name}';
      case 2:
        final floor = _floors.firstWhere((f) => f.id == _selectedFloorId, orElse: () => throw StateError('Floor not found'));
        return 'Select Room on ${floor.name}';
      default:
        return '';
    }
  }

  Widget _buildStepIndicator(int step, String label) {
    final isActive = _currentStep == step;
    final isCompleted = _currentStep > step;
    final colorScheme = Theme.of(context).colorScheme;

    return Expanded(
      child: Column(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: isCompleted
                  ? colorScheme.primary
                  : isActive
                      ? colorScheme.primaryContainer
                      : colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: isCompleted || isActive
                    ? colorScheme.primary
                    : colorScheme.outlineVariant,
                width: 2,
              ),
            ),
            child: Center(
              child: isCompleted
                  ? Icon(Icons.check, size: 18, color: colorScheme.onPrimary)
                  : Text(
                      '${step + 1}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: isActive ? colorScheme.primary : colorScheme.onSurfaceVariant,
                      ),
                    ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: isActive ? colorScheme.primary : colorScheme.onSurfaceVariant,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildStepConnector(int step) {
    final isCompleted = _currentStep > step;
    final colorScheme = Theme.of(context).colorScheme;

    return Expanded(
      child: Container(
        height: 3,
        margin: const EdgeInsets.only(top: 14),
        decoration: BoxDecoration(
          color: isCompleted ? colorScheme.primary : colorScheme.outlineVariant,
          borderRadius: BorderRadius.circular(1.5),
        ),
      ),
    );
  }

  Widget _buildStepContent() {
    switch (_currentStep) {
      case 0:
        return _buildBuildingList();
      case 1:
        return _buildFloorList();
      case 2:
        return _buildRoomList();
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildBuildingList() {
    if (_buildings.isEmpty) {
      return const ContentEmptyState(
        icon: Icons.apartment_outlined,
        title: 'No buildings found',
        message: 'Campus map data is not loaded',
      );
    }

    return ListView.builder(
      controller: ScrollController(),
      itemCount: _buildings.length,
      itemBuilder: (context, index) {
        final building = _buildings[index];
        return _SelectionListTile(
          title: building.name,
          subtitle: '${building.floors.length} floors • ${building.roomCount} rooms',
          leading: CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            child: Icon(
              Icons.apartment_outlined,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          onTap: () => _onBuildingSelected(building.id),
        );
      },
    );
  }

  Widget _buildFloorList() {
    if (_floors.isEmpty) {
      return const ContentEmptyState(
        icon: Icons.layers_outlined,
        title: 'No floors found',
        message: 'This building has no floor data',
      );
    }

    return ListView.builder(
      controller: ScrollController(),
      itemCount: _floors.length,
      itemBuilder: (context, index) {
        final floor = _floors[index];
        return _SelectionListTile(
          title: floor.name,
          subtitle: '${floor.roomCount} rooms',
          leading: CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
            child: Icon(
              Icons.layers_outlined,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          onTap: () => _onFloorSelected(floor.id),
        );
      },
    );
  }

  Widget _buildRoomList() {
    if (_rooms.isEmpty) {
      return const ContentEmptyState(
        icon: Icons.meeting_room_outlined,
        title: 'No rooms found',
        message: 'This floor has no navigable rooms',
      );
    }

    // Group rooms by category
    final roomsByCategory = <RoomCategory, List<CampusRoom>>{};
    for (final room in _rooms) {
      roomsByCategory.putIfAbsent(room.category, () => []).add(room);
    }

    return ListView.builder(
      controller: ScrollController(),
      itemCount: roomsByCategory.length,
      itemBuilder: (context, index) {
        final category = roomsByCategory.keys.elementAt(index);
        final rooms = roomsByCategory[category]!;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                category.label,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            ...rooms.map((room) => _RoomSelectionTile(
              room: room,
              isSelected: _selectedRoomId == room.id,
              onTap: () => _onRoomSelected(room.id),
            )),
            const SizedBox(height: 8),
          ],
        );
      },
    );
  }
}

/// Selection list tile for building/floor selection
class _SelectionListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget leading;
  final VoidCallback onTap;

  const _SelectionListTile({
    required this.title,
    required this.subtitle,
    required this.leading,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(16),
      onTap: onTap,
      child: Row(
        children: [
          leading,
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.chevron_right, color: Theme.of(context).colorScheme.outline),
        ],
      ),
    );
  }
}

/// Room selection tile with category styling
class _RoomSelectionTile extends StatelessWidget {
  final CampusRoom room;
  final bool isSelected;
  final VoidCallback onTap;

  const _RoomSelectionTile({
    required this.room,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final categoryColor = Color(room.categoryColor);

    return AppCard(
      margin: const EdgeInsets.only(bottom: 6),
      padding: const EdgeInsets.all(12),
      onTap: onTap,
      elevation: isSelected ? 4 : 1,
      border: BorderSide(
        color: isSelected ? categoryColor : colorScheme.outlineVariant,
        width: isSelected ? 2 : 1,
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: categoryColor.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(_getCategoryIcon(room.category), color: categoryColor, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  room.displayName,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: isSelected ? categoryColor : colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  room.category.label,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          if (isSelected)
            Icon(Icons.check_circle, color: categoryColor, size: 24)
          else
            Icon(Icons.radio_button_unchecked, color: colorScheme.outline, size: 24),
        ],
      ),
    );
  }

  IconData _getCategoryIcon(RoomCategory category) {
    return category.when(
      room: () => Icons.meeting_room_outlined,
      restroom: () => Icons.wc_outlined,
      office: () => Icons.business_outlined,
      facility: () => Icons.business_outlined,
      canteen: () => Icons.restaurant_outlined,
      hallway: () => Icons.door_front_door_outlined,
      laboratory: () => Icons.science_outlined,
      library: () => Icons.library_books_outlined,
      parking: () => Icons.local_parking_outlined,
      sportsFacility: () => Icons.sports_gymnastics_outlined,
      stage: () => Icons.theater_comedy_outlined,
      staircase: () => Icons.stairs_outlined,
      storage: () => Icons.inventory_2_outlined,
      unresolvedMapAnnotation: () => Icons.help_outline,
      unresolvedSpace: () => Icons.help_outline,
      other: () => Icons.place_outlined,
      emergencyExit: () => Icons.emergency_outlined,
      assemblyPoint: () => Icons.groups_outlined,
      medicalFacility: () => Icons.local_hospital_outlined,
      securityOffice: () => Icons.security_outlined,
    );
  }
}