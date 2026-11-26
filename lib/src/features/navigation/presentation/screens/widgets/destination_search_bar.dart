/// SAFENAV CAVITE - Destination Search Bar
///
/// Search bar widget for finding navigation destinations with start location selector.
library;

import 'package:material_ui/material_ui.dart' hide NavigationDestination;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

import '../../../../../shared/widgets/widgets.dart';
import '../../../data/models/navigation_models.dart';
import '../../providers/navigation_providers.dart';
import 'start_location_selector.dart';
import 'outdoor_start_point_selector.dart';
import '../../../../../features/map/presentation/providers/map_providers.dart';

/// Search bar for navigation destinations with start location selection
class DestinationSearchBar extends ConsumerStatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final ValueChanged<String> onChanged;
  final VoidCallback onClear;
  final ValueChanged<String> onSubmit;

  const DestinationSearchBar({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.onChanged,
    required this.onClear,
    required this.onSubmit,
  });

  @override
  ConsumerState<DestinationSearchBar> createState() => _DestinationSearchBarState();
}

class _DestinationSearchBarState extends ConsumerState<DestinationSearchBar> {
  bool _hasFocus = false;

  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    widget.focusNode.removeListener(_onFocusChange);
    super.dispose();
  }

  void _onFocusChange() {
    setState(() => _hasFocus = widget.focusNode.hasFocus);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final startPoint = ref.watch(navigationStartProvider);
    final useGps = ref.watch(useGpsStartProvider);
    final userLocation = ref.watch(userLocationWithAccuracyProvider);
    final startMode = ref.watch(startLocationModeProvider);

    return AppCard(
      margin: EdgeInsets.zero,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      borderRadius: BorderRadius.zero,
      elevation: 0,
      border: BorderSide(
        color: colorScheme.outlineVariant.withValues(alpha: 0.5),
        width: 1,
      ),
      child: Row(
        children: [
          // Start location selector button
          _StartLocationButton(
            startPoint: startPoint,
            useGps: useGps,
            userLocation: userLocation,
            startMode: startMode,
            onPressed: _showStartLocationSelector,
          ),
          const SizedBox(width: 8),
          // Search icon
          Icon(
            Icons.search,
            color: _hasFocus ? colorScheme.primary : colorScheme.outline,
            size: 24,
          ),
          const SizedBox(width: 12),
          // Search field
          Expanded(
            child: TextField(
              controller: widget.controller,
              focusNode: widget.focusNode,
              decoration: InputDecoration(
                hintText: 'Search buildings, rooms, facilities...',
                hintStyle: TextStyle(color: colorScheme.outline),
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
              style: Theme.of(context).textTheme.bodyLarge,
              onChanged: widget.onChanged,
              onSubmitted: widget.onSubmit,
              textInputAction: TextInputAction.search,
            ),
          ),
          // Clear button
          if (widget.controller.text.isNotEmpty)
            IconButton(
              icon: Icon(Icons.clear, color: colorScheme.outline),
              onPressed: widget.onClear,
              tooltip: 'Clear search',
            ),
          // Voice search button
          IconButton(
            icon: Icon(Icons.mic_outlined, color: colorScheme.outline),
            onPressed: _handleVoiceSearch,
            tooltip: 'Voice search',
          ),
        ],
      ),
    );
  }

  void _showStartLocationSelector() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _StartLocationModeSelector(
        currentMode: ref.read(startLocationModeProvider),
        onModeSelected: (mode) {
          ref.read(startLocationModeProvider.notifier).state = mode;
          Navigator.pop(context);
          // Show appropriate selector based on mode
          switch (mode) {
            case StartLocationMode.gps:
              // GPS is already default - just re-enable it
              ref.read(useGpsStartProvider.notifier).state = true;
              ref.read(selectedIndoorStartPointProvider.notifier).state = null;
              ref.read(selectedOutdoorStartPointProvider.notifier).state = null;
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Using GPS for start location')),
              );
              break;
            case StartLocationMode.indoor:
              ref.read(useGpsStartProvider.notifier).state = false;
              _showIndoorSelector();
              break;
            case StartLocationMode.outdoor:
              ref.read(useGpsStartProvider.notifier).state = false;
              _showOutdoorSelector();
              break;
          }
        },
      ),
    );
  }

  void _showIndoorSelector() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => StartLocationSelector(
        onLocationSelected: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Indoor start location set')),
          );
        },
      ),
    );
  }

  void _showOutdoorSelector() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => OutdoorStartPointSelector(
        onLocationSelected: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Outdoor start location set')),
          );
        },
      ),
    );
  }

  void _handleVoiceSearch() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Voice search coming soon')),
    );
  }
}

/// Start location mode selector bottom sheet
class _StartLocationModeSelector extends ConsumerWidget {
  final StartLocationMode currentMode;
  final ValueChanged<StartLocationMode> onModeSelected;

  const _StartLocationModeSelector({
    required this.currentMode,
    required this.onModeSelected,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    return DraggableScrollableSheet(
      initialChildSize: 0.5,
      minChildSize: 0.4,
      maxChildSize: 0.7,
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
                    Text(
                      'Select Start Location Type',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
              ),

              // Mode options
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    _ModeOptionTile(
                      icon: Icons.gps_fixed,
                      title: 'Current Location (GPS)',
                      subtitle: 'Use your device\'s GPS for the starting point',
                      color: Colors.green,
                      isSelected: currentMode == StartLocationMode.gps,
                      onTap: () => onModeSelected(StartLocationMode.gps),
                    ),
                    const SizedBox(height: 12),
                    _ModeOptionTile(
                      icon: Icons.layers,
                      title: 'Indoor Location',
                      subtitle: 'Select building, floor, and room/facility',
                      color: Colors.blue,
                      isSelected: currentMode == StartLocationMode.indoor,
                      onTap: () => onModeSelected(StartLocationMode.indoor),
                    ),
                    const SizedBox(height: 12),
                    _ModeOptionTile(
                      icon: Icons.map_outlined,
                      title: 'Outdoor Location (Map Tap)',
                      subtitle: 'Tap on the campus map to set a custom outdoor start point',
                      color: Colors.orange,
                      isSelected: currentMode == StartLocationMode.outdoor,
                      onTap: () => onModeSelected(StartLocationMode.outdoor),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

/// Mode option tile
class _ModeOptionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final bool isSelected;
  final VoidCallback onTap;

  const _ModeOptionTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AppCard(
      padding: const EdgeInsets.all(16),
      onTap: onTap,
      elevation: isSelected ? 4 : 1,
      border: BorderSide(
        color: isSelected ? color : colorScheme.outlineVariant,
        width: isSelected ? 2 : 1,
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: color.withValues(alpha: isSelected ? 0.2 : 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: isSelected ? color : colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          if (isSelected)
            Icon(Icons.check_circle, color: color, size: 24)
          else
            Icon(Icons.radio_button_unchecked, color: colorScheme.outline, size: 24),
        ],
      ),
    );
  }
}

/// Start location button showing current start point with selector
class _StartLocationButton extends ConsumerWidget {
  final NavigationStartPoint? startPoint;
  final bool useGps;
  final ({LatLng position, double accuracy})? userLocation;
  final StartLocationMode startMode;
  final VoidCallback onPressed;

  const _StartLocationButton({
    required this.startPoint,
    required this.useGps,
    required this.userLocation,
    required this.startMode,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    // Determine start point type and display
    String label;
    IconData icon;
    Color iconColor;
    Color? backgroundColor;
    String? accuracyText;
    String? modeBadge;

    if (startPoint != null) {
      // Manual start point (indoor or outdoor)
      label = startPoint!.displayName;
      icon = startPoint!.when(
        indoor: (_) => Icons.layers,
        outdoor: (_) => Icons.map_outlined,
        currentLocation: (_, __) => Icons.my_location,
      );
      iconColor = colorScheme.primary;
      backgroundColor = colorScheme.primaryContainer;
      modeBadge = startPoint!.when(
        indoor: (_) => 'INDOOR',
        outdoor: (_) => 'OUTDOOR',
        currentLocation: (_, __) => 'GPS',
      );
    } else if (useGps && userLocation != null) {
      // GPS location
      label = 'Current Location';
      icon = Icons.my_location;
      iconColor = Colors.green;
      backgroundColor = Colors.green.withValues(alpha: 0.15);
      modeBadge = 'GPS';
      // Show accuracy if available
      final accuracy = userLocation!.accuracy;
      if (accuracy < 50) {
        accuracyText = '±${accuracy.round()}m';
      } else if (accuracy < 100) {
        accuracyText = '±${accuracy.round()}m (approx)';
      } else {
        accuracyText = '±${accuracy.round()}m (low accuracy)';
      }
    } else {
      // No start point set - show mode badge
      label = 'Set Start';
      modeBadge = switch (startMode) {
        StartLocationMode.gps => 'GPS',
        StartLocationMode.indoor => 'INDOOR',
        StartLocationMode.outdoor => 'OUTDOOR',
      };
      icon = switch (startMode) {
        StartLocationMode.gps => Icons.my_location_outlined,
        StartLocationMode.indoor => Icons.layers_outlined,
        StartLocationMode.outdoor => Icons.map_outlined,
      };
      iconColor = colorScheme.outline;
      backgroundColor = colorScheme.surfaceContainerHighest;
    }

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: iconColor.withValues(alpha: 0.3),
              width: 1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: iconColor, size: 20),
              const SizedBox(width: 8),
              Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: Text(
                            label,
                            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: iconColor,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (modeBadge != null) ...[
                          const SizedBox(width: 6),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                            decoration: BoxDecoration(
                              color: iconColor.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              modeBadge,
                              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: iconColor,
                                fontSize: 9,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                    if (accuracyText != null)
                      Text(
                        accuracyText,
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: iconColor.withValues(alpha: 0.7),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(width: 4),
              Icon(
                Icons.keyboard_arrow_down,
                color: iconColor.withValues(alpha: 0.7),
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}