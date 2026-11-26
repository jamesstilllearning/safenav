/// SAFENAV CAVITE - Outdoor Start Point Selector
///
/// Modal widget for selecting manual outdoor starting point via map tap.
library;

import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';

import '../../../../../shared/widgets/widgets.dart';
import '../../../../map/presentation/providers/map_providers.dart';
import '../../../data/models/navigation_models.dart';
import '../../providers/navigation_providers.dart';

/// Modal for selecting outdoor start location via map tap
class OutdoorStartPointSelector extends ConsumerStatefulWidget {
  final VoidCallback? onLocationSelected;

  const OutdoorStartPointSelector({
    super.key,
    this.onLocationSelected,
  });

  @override
  ConsumerState<OutdoorStartPointSelector> createState() => _OutdoorStartPointSelectorState();
}

class _OutdoorStartPointSelectorState extends ConsumerState<OutdoorStartPointSelector> {
  final MapController _mapController = MapController();
  LatLng? _selectedPosition;
  String? _selectedLabel;

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  void _onMapTap(TapPosition tapPosition, LatLng latLng) {
    setState(() {
      _selectedPosition = latLng;
      // Generate a readable label for the location
      _selectedLabel = _generateLocationLabel(latLng);
    });
  }

  String _generateLocationLabel(LatLng latLng) {
    // Generate a readable location description
    return 'Outdoor Point (${latLng.latitude.toStringAsFixed(6)}, ${latLng.longitude.toStringAsFixed(6)})';
  }

  void _confirmSelection() {
    if (_selectedPosition != null) {
      final outdoorStartPoint = OutdoorStartPoint(
        coordinates: _selectedPosition!,
        placeName: _selectedLabel ?? 'Outdoor Point',
        address: 'Manual outdoor start: $_selectedLabel',
      );

      ref.read(selectedOutdoorStartPointProvider.notifier).state = outdoorStartPoint;
      ref.read(useGpsStartProvider.notifier).state = false;
      ref.read(startLocationModeProvider.notifier).state = StartLocationMode.outdoor;

      widget.onLocationSelected?.call();
      Navigator.of(context).pop();
    }
  }

  void _useCurrentLocation() {
    final userLocation = ref.read(userLatLngProvider);
    if (userLocation != null) {
      setState(() {
        _selectedPosition = userLocation;
        _selectedLabel = 'Current GPS Location';
        _mapController.move(userLocation, 18.0);
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Unable to get current location. Please enable GPS.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final viewState = ref.watch(mapViewStateProvider);
    final userLocation = ref.watch(userLatLngProvider);

    return DraggableScrollableSheet(
      initialChildSize: 0.85,
      minChildSize: 0.6,
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
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.of(context).pop(),
                      tooltip: 'Close',
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Select Outdoor Start Point',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    if (_selectedPosition != null)
                      AppTextButton(
                        onPressed: _confirmSelection,
                        label: 'Confirm',
                        icon: Icons.check,
                        iconPosition: IconPosition.leading,
                        foregroundColor: colorScheme.primary,
                        semanticLabel: 'Confirm selected start point',
                      ),
                  ],
                ),
              ),

              // Instruction
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: colorScheme.primaryContainer.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: colorScheme.primary.withValues(alpha: 0.3)),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.touch_app_outlined, color: colorScheme.primary, size: 20),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Tap on the map to select your starting location, or use the button below for your current GPS position.',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // Quick action buttons
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: AppOutlinedButton(
                        onPressed: _useCurrentLocation,
                        label: 'Use Current Location',
                        icon: Icons.my_location,
                        iconPosition: IconPosition.leading,
                        size: ButtonSize.large,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: AppFilledButton(
                        onPressed: () {
                          // Center map on campus
                          final boundary = ref.read(campusBoundaryProvider).value;
                          if (boundary != null) {
                            _mapController.move(boundary.center, 17.0);
                          }
                        },
                        label: 'Campus Center',
                        icon: Icons.center_focus_strong,
                        iconPosition: IconPosition.leading,
                        size: ButtonSize.large,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              // Map preview
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: FlutterMap(
                      mapController: _mapController,
                      options: MapOptions(
                        initialCenter: _selectedPosition ?? userLocation ?? viewState.center,
                        initialZoom: 18.0,
                        minZoom: 15.0,
                        maxZoom: 20.0,
                        onTap: _onMapTap,
                        interactionOptions: const InteractionOptions(
                          flags: InteractiveFlag.all & ~InteractiveFlag.rotate,
                        ),
                      ),
                      children: [
                        // Tile layer
                        TileLayer(
                          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                          maxZoom: 19,
                          subdomains: const ['a', 'b', 'c'],
                          userAgentPackageName: 'com.earist.safenav',
                        ),
                        // Campus boundary
                        Consumer(
                          builder: (context, ref, _) {
                            final boundaryAsync = ref.watch(campusBoundaryProvider);
                            return boundaryAsync.when(
                              data: (boundary) => PolygonLayer(
                                polygons: [
                                  Polygon(
                                    points: boundary.polygon,
                                    color: colorScheme.primary.withValues(alpha: 0.1),
                                    borderColor: colorScheme.primary,
                                    borderStrokeWidth: 2.0,
                                  ),
                                ],
                              ),
                              loading: () => const SizedBox.shrink(),
                              error: (_, __) => const SizedBox.shrink(),
                            );
                          },
                        ),
                        // Selected position marker
                        if (_selectedPosition != null)
                          MarkerLayer(
                            markers: [
                              Marker(
                                point: _selectedPosition!,
                                width: 48,
                                height: 48,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: colorScheme.primary,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: colorScheme.onPrimary,
                                      width: 3,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withValues(alpha: 0.3),
                                        blurRadius: 8,
                                        offset: const Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: Icon(
                                    Icons.location_on,
                                    color: colorScheme.onPrimary,
                                    size: 24,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        // User location marker
                        if (userLocation != null && _selectedPosition == null)
                          MarkerLayer(
                            markers: [
                              Marker(
                                point: userLocation,
                                width: 40,
                                height: 40,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 3,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withValues(alpha: 0.3),
                                        blurRadius: 6,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: const Icon(
                                    Icons.gps_fixed,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
              ),

              // Selected position info
              if (_selectedPosition != null)
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
                    border: Border(
                      top: BorderSide(color: colorScheme.outlineVariant),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: colorScheme.primaryContainer,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              Icons.map_outlined,
                              color: colorScheme.primary,
                              size: 20,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _selectedLabel ?? 'Selected Location',
                                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  'Lat: ${_selectedPosition!.latitude.toStringAsFixed(6)}, Lng: ${_selectedPosition!.longitude.toStringAsFixed(6)}',
                                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: AppOutlinedButton(
                              onPressed: () {
                                setState(() {
                                  _selectedPosition = null;
                                  _selectedLabel = null;
                                });
                              },
                              label: 'Clear',
                              icon: Icons.clear,
                              iconPosition: IconPosition.leading,
                              size: ButtonSize.large,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: AppFilledButton(
                              onPressed: _confirmSelection,
                              label: 'Set as Start Point',
                              icon: Icons.check,
                              iconPosition: IconPosition.leading,
                              size: ButtonSize.large,
                            ),
                          ),
                        ],
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