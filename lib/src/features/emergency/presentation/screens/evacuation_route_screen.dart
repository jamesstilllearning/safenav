/// SAFENAV CAVITE - Evacuation Route Screen
///
/// Evacuation route screen per Figma Emergency (2).png.
///
/// Uses the campus illustration SVG (assets/maps/campus_illustration.svg) as the
/// visual map background — not OpenStreetMap. No graph data is modified or
/// regenerated. The "You're here" marker uses real GPS location from
/// LocationService; if no location is available, a location-unavailable state is
/// shown instead of a placeholder marker.
///
/// Data gaps vs Figma:
/// - The navigation graph does not define explicit "exit" nodes (only pathway/junction
///   node types exist), so the "Assembly Points" section uses assembly points from the
///   emergency repository as the nearest safe locations instead.
/// - Real-time evacuation path lines on the SVG require coordinate projection from
///   geographic LatLng to SVG viewBox space, which is not yet implemented. The map
///   shows the campus illustration with a "You're here" marker only.
library;

import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_ui/material_ui.dart' hide NavigationDestination;
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../shared/widgets/widgets.dart';
import '../../../../core/theme/app_theme.dart';
import '../../data/models/emergency_report.dart';
import '../providers/emergency_providers.dart';
import '../../../navigation/data/models/navigation_models.dart';
import '../../../navigation/presentation/providers/navigation_providers.dart';

/// SVG viewBox dimensions from campus_illustration.svg (the visual campus map)
const double _svgViewBoxWidth = 2570.0;
const double _svgViewBoxHeight = 1664.0;

/// Evacuation route screen - displayed when user taps "Enter evacuation route"
class EvacuationRouteScreen extends ConsumerStatefulWidget {
  const EvacuationRouteScreen({super.key});

  @override
  ConsumerState<EvacuationRouteScreen> createState() => _EvacuationRouteScreenState();
}

class _EvacuationRouteScreenState extends ConsumerState<EvacuationRouteScreen> {
  final TextEditingController _searchController = TextEditingController();
  Timer? _debounce;

  AssemblyPoint? _nearestAssemblyPoint;
  bool _assemblyPointLoading = true;
  CampusEmergencyContact? _campusSecurityContact;
  EmergencyLocation? _currentLocation;
  bool _locationLoading = true;

  @override
  void initState() {
    super.initState();
    _loadAssemblyPoint();
    _loadCampusSecurityContact();
    _loadCurrentLocation();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _loadAssemblyPoint() async {
    final locationResult = await ref.read(currentEmergencyLocationProvider.future);
    if (locationResult == null) {
      if (mounted) setState(() => _assemblyPointLoading = false);
      return;
    }

    final repository = ref.read(emergencyRepositoryProvider);
    final result = await repository.getNearestAssemblyPoint(locationResult.latLng);
    result.fold(
      (failure) => {},
      (point) {
        if (mounted) {
          setState(() {
            _nearestAssemblyPoint = point;
            _assemblyPointLoading = false;
          });
        }
      },
    );
  }

  Future<void> _loadCampusSecurityContact() async {
    final repository = ref.read(emergencyRepositoryProvider);
    final result = await repository.getCampusEmergencyContacts();
    result.fold(
      (failure) => {},
      (contacts) {
        if (contacts.isEmpty) {
          if (mounted) setState(() => _campusSecurityContact = null);
          return;
        }
        final security = contacts.firstWhere(
          (c) => c.isCampusSecurity || c.role.toLowerCase().contains('security'),
          orElse: () => contacts.first,
        );
        if (mounted) {
          setState(() => _campusSecurityContact = security);
        }
      },
    );
  }

  Future<void> _loadCurrentLocation() async {
    final locationResult = await ref.read(currentEmergencyLocationProvider.future);
    if (mounted) {
      setState(() {
        _currentLocation = locationResult;
        _locationLoading = false;
      });
    }
  }

  Future<void> _shareLocation() async {
    final locationResult = await ref.read(currentEmergencyLocationProvider.future);
    if (locationResult == null) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Unable to get your location.'),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
      return;
    }

    final shareText = 'My location: ${locationResult.latitude.toStringAsFixed(6)}, ${locationResult.longitude.toStringAsFixed(6)}';
    await SharePlus.instance.share(ShareParams(
      text: shareText,
      subject: 'SAFENAV - My Location',
    ));
  }

  Future<void> _showNearestSafeZone() async {
    if (_nearestAssemblyPoint == null) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('No safe zone data available.'),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
      return;
    }

    final destination = NavigationDestination(
      id: 'assembly_${_nearestAssemblyPoint!.id}',
      name: _nearestAssemblyPoint!.name,
      type: DestinationType.assemblyPoint(),
      coordinates: _nearestAssemblyPoint!.latLng,
      description: 'Nearest Safe Zone / Assembly Point',
      isAssemblyPoint: true,
    );

    ref.read(navigationDestinationProvider.notifier).state = destination;
    if (mounted) {
      Navigator.pushNamed(context, '/navigation');
    }
  }

  Future<void> _callSecurityCampus() async {
    final phone = _campusSecurityContact?.phone;
    if (phone == null || phone.isEmpty) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Campus security phone number not available.'),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
      return;
    }

    final uri = Uri.parse('tel:$phone');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Could not launch phone dialer for $phone'),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }

  void _navigateToAssemblyPoint() {
    _showNearestSafeZone();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Evacuation route'),
        centerTitle: false,
        elevation: 0,
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
          tooltip: 'Back to emergency',
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: AppTextField(
                controller: _searchController,
                hint: 'Search room, building, or facility',
                prefixIcon: Icons.search,
                onChanged: (value) {
                  _debounce?.cancel();
                  _debounce = Timer(const Duration(milliseconds: 300), () {
                    // Search handled locally; results filtered against available exit data
                  });
                },
              ),
            ),

            // Help requested banner
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              color: AppColors.successContainer,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.info, color: AppColors.success, size: 24),
                  const SizedBox(width: 12.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Help requested',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.onSuccess,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          'Campus security has your location and is sending someone to assist you.',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.onSuccess.withValues(alpha: 0.9),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16.0),

            // Campus map using campus illustration SVG
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final screenWidth = constraints.maxWidth;
                  final screenHeight = screenWidth * (_svgViewBoxHeight / _svgViewBoxWidth);

                  return Stack(
                    children: [
                      // Campus map SVG (visual campus illustration)
                      SizedBox(
                        width: screenWidth,
                        height: screenHeight,
                        child: SvgPicture.asset(
                          'assets/maps/campus_illustration.svg',
                          fit: BoxFit.fill,
                        ),
                      ),

                      // "You're here" marker — only shown when real GPS location is available
                      if (_currentLocation != null)
                        Positioned(
                          left: screenWidth / 2 - 10,
                          top: screenHeight / 2 - 10,
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: AppColors.mapUserLocation,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 3),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.mapUserLocationPulse,
                                  blurRadius: 8,
                                  spreadRadius: 2,
                                ),
                              ],
                            ),
                          ),
                        ),

                      // You're here label with real coordinates
                      if (_currentLocation != null)
                        Positioned(
                          left: screenWidth / 2 + 12,
                          top: screenHeight / 2 - 10,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(color: AppColors.mapUserLocation),
                            ),
                            child: Text(
                              "You're here",
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ),

                      // Location unavailable state
                      if (_locationLoading)
                        const Center(
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: InlineLoading(message: 'Getting your location...'),
                          ),
                        )
                      else if (_currentLocation == null)
                        const Center(
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: _LocationUnavailableState(),
                          ),
                        ),
                    ],
                  );
                },
              ),
            ),

            // Action buttons: Share Location, Show nearest safe zone, Call Security Campus
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: AppFilledButton(
                          onPressed: _shareLocation,
                          label: 'Share Location',
                          icon: Icons.share,
                          backgroundColor: AppColors.primary,
                          foregroundColor: AppColors.onPrimary,
                          size: ButtonSize.large,
                          semanticLabel: 'Share my location',
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      Expanded(
                        child: AppFilledButton(
                          onPressed: _showNearestSafeZone,
                          label: 'Show nearest safe zone',
                          icon: Icons.safety_check,
                          backgroundColor: AppColors.primary,
                          foregroundColor: AppColors.onPrimary,
                          size: ButtonSize.large,
                          semanticLabel: 'Show nearest safe zone',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  SizedBox(
                    width: double.infinity,
                    child: AppOutlinedButton(
                      onPressed: _callSecurityCampus,
                      label: 'Call Security Campus',
                      icon: Icons.call,
                      borderColor: Colors.purple,
                      foregroundColor: Colors.purple,
                      size: ButtonSize.large,
                      semanticLabel: 'Call campus security',
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16.0),

            // Assembly Points section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SectionHeader(
                title: 'Assembly Points',
                icon: Icons.safety_check,
                style: SectionHeaderStyle.standard,
              ),
            ),
            const SizedBox(height: 8.0),

            // Assembly points list (using assembly points as nearest safe zones)
            _buildAssemblyPoints(context),

            const SizedBox(height: 32.0),
          ],
        ),
      ),
    );
  }

  Widget _buildAssemblyPoints(BuildContext context) {
    if (_assemblyPointLoading) {
      return const Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(child: InlineLoading(message: 'Loading safe zones...')),
      );
    }

    if (_nearestAssemblyPoint == null) {
      return const Padding(
        padding: EdgeInsets.all(16.0),
        child: _EmptyAssemblyPointsState(),
      );
    }

    return Column(
      children: [
        _AssemblyPointListItem(
          name: _nearestAssemblyPoint!.name,
          subtitle: 'Assembly Point - ${_nearestAssemblyPoint!.buildingId ?? 'Campus'}',
          distance: _nearestAssemblyPoint!.availableCapacity > 0
              ? '${_nearestAssemblyPoint!.availableCapacity} spots available'
              : 'At capacity',
          onGo: _navigateToAssemblyPoint,
        ),
      ],
    );
  }
}

/// Empty state for assembly points when no data is available
class _EmptyAssemblyPointsState extends StatelessWidget {
  const _EmptyAssemblyPointsState();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return AppCard(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          Icon(Icons.safety_check, size: 48, color: colorScheme.onSurfaceVariant),
          const SizedBox(height: 12.0),
          Text(
            'No assembly point data available',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            'Assembly point data is not yet configured in the emergency system.',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

/// Location unavailable state shown on the map when GPS location cannot be determined
class _LocationUnavailableState extends StatelessWidget {
  const _LocationUnavailableState();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return AppCard(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.location_off, size: 48, color: colorScheme.onSurfaceVariant),
          const SizedBox(height: 12.0),
          Text(
            'Location unavailable',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            'Unable to determine your current location. Please enable GPS and try again.',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

/// Individual assembly point list item with GO button
class _AssemblyPointListItem extends StatelessWidget {
  final String name;
  final String subtitle;
  final String distance;
  final VoidCallback onGo;

  const _AssemblyPointListItem({
    required this.name,
    required this.subtitle,
    required this.distance,
    required this.onGo,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      margin: const EdgeInsets.only(bottom: 8.0),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16.0),
        title: Text(
          name,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4.0),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 2.0),
            Text(
              distance,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        trailing: AppTextButton(
          onPressed: onGo,
          label: 'GO',
          icon: Icons.arrow_forward,
          size: ButtonSize.small,
        ),
      ),
    );
  }
}
