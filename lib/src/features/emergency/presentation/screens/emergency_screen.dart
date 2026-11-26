/// SAFENAV CAVITE - Emergency Screen
///
/// Main emergency screen with SOS button (3-second hold), emergency contacts
/// from Firestore, evacuation routes & assembly points, and real-time
/// emergency status tracking with full-screen view.
library;

import 'dart:async';

import 'package:material_ui/material_ui.dart' hide NavigationDestination;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../shared/widgets/widgets.dart';
import '../../../../core/theme/app_theme.dart';
import '../../data/models/emergency_report.dart';
import '../providers/emergency_providers.dart';
import '../../../navigation/data/models/navigation_models.dart';
import '../../../navigation/presentation/providers/navigation_providers.dart';

/// Emergency screen - 3rd tab in bottom navigation
class EmergencyScreen extends ConsumerWidget {
  const EmergencyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch active emergency report stream
    final activeReportAsync = ref.watch(activeEmergencyReportProvider);
    // Watch SOS activation state
    final sosState = ref.watch(sosActivationStateProvider);

    // Show full-screen status if there's an active report OR if SOS flow created a report
    return activeReportAsync.when(
      data: (activeReport) {
        final hasActiveReport = activeReport != null && activeReport.isActive;
        final hasReportCreated = sosState.isReportCreated && sosState.report != null;

        if (hasActiveReport) {
          return EmergencyStatusScreen(report: activeReport);
        }
        if (hasReportCreated) {
          return EmergencyStatusScreen(report: sosState.report!);
        }
        return const EmergencyMainScreen();
      },
      loading: () => const EmergencyMainScreen(),
      error: (_, __) => const EmergencyMainScreen(),
    );
  }
}

/// Main emergency screen content
class EmergencyMainScreen extends ConsumerStatefulWidget {
  const EmergencyMainScreen({super.key});

  @override
  ConsumerState<EmergencyMainScreen> createState() => _EmergencyMainScreenState();
}

class _EmergencyMainScreenState extends ConsumerState<EmergencyMainScreen>
    with TickerProviderStateMixin {
  Timer? _holdTimer;
  late AnimationController _pulseController;
  late AnimationController _holdProgressController;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);

    _holdProgressController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _holdTimer?.cancel();
    _pulseController.dispose();
    _holdProgressController.dispose();
    super.dispose();
  }

  void _startSosHold() {
    final notifier = ref.read(sosActivationStateProvider.notifier);
    notifier.state = const SosActivationState.confirming(holdProgress: 0);

    _holdProgressController.forward(from: 0);
    _holdTimer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      final progress = (_holdProgressController.value * 100).round();
      notifier.state = SosActivationState.confirming(holdProgress: progress);

      if (progress >= 100) {
        timer.cancel();
        _triggerSosConfirmation();
      }
    });
  }

  void _cancelSosHold() {
    _holdTimer?.cancel();
    _holdTimer = null;
    _holdProgressController.stop();
    _holdProgressController.reset();
    ref.read(sosActivationStateProvider.notifier).state = const SosActivationState.idle();
  }

  void _triggerSosConfirmation() {
    _holdTimer?.cancel();
    _holdTimer = null;
    _holdProgressController.stop();
    _holdProgressController.reset();
    _showConfirmationDialog();
  }

  void _showConfirmationDialog() {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) => _SosConfirmationDialog(
        onCancel: () {
          Navigator.pop(dialogContext);
          ref.read(sosActivationStateProvider.notifier).state = const SosActivationState.idle();
        },
        onConfirm: () {
          Navigator.pop(dialogContext);
          _activateSos();
        },
      ),
    );
  }

  Future<void> _activateSos() async {
    final notifier = ref.read(sosActivationStateProvider.notifier);
    notifier.state = const SosActivationState.gettingLocation();

    try {
      // Get current location
      final locationResult = await ref.read(currentEmergencyLocationProvider.future);
      if (locationResult == null) {
        notifier.state = const SosActivationState.error(
          message: 'Unable to get your location. Please enable GPS and try again.',
        );
        return;
      }

      notifier.state = const SosActivationState.creatingReport();

      // Get current user info
      final userId = ref.read(currentUserIdProvider);
      final userName = ref.read(currentUserNameProvider);
      final userPhone = ref.read(currentUserPhoneProvider);

      if (userId == null) {
        notifier.state = const SosActivationState.error(
          message: 'User not authenticated. Please log in and try again.',
        );
        return;
      }

      // Create emergency report via repository
      final repository = ref.read(emergencyRepositoryProvider);
      final report = EmergencyReport.create(
        id: 'emergency_${DateTime.now().millisecondsSinceEpoch}',
        userId: userId,
        userName: userName ?? 'Unknown User',
        userPhone: userPhone ?? '',
        userLocation: locationResult,
        type: EmergencyType.other(), // Default, could be extended with type selection
        description: 'SOS activated from emergency screen',
      );

      final result = await repository.createReport(report);

      result.fold(
        (failure) {
          notifier.state = SosActivationState.error(message: failure.message);
        },
        (createdReport) {
          notifier.state = SosActivationState.reportCreated(report: createdReport);
          // The activeEmergencyReportProvider stream will pick this up and show status screen
        },
      );
    } catch (e) {
      notifier.state = SosActivationState.error(message: 'Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final sosState = ref.watch(sosActivationStateProvider);
    final contactsAsync = ref.watch(campusEmergencyContactsStreamProvider);
    final assemblyPointAsync = ref.watch(nearestAssemblyPointProvider);
    final evacuationRouteAsync = ref.watch(nearestEvacuationRouteProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergency'),
        centerTitle: false,
        elevation: 0,
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        surfaceTintColor: Colors.transparent,
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () => _showSafetyInfoDialog(context),
            tooltip: 'Safety Information',
          ),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // SOS Button Section with hold animation
                  _buildSosSection(context, sosState),

                  const SizedBox(height: 24),

                  // Call for help section (per Figma Emergency screen)
                  SectionHeader(
                    title: 'Call for help',
                    subtitle: 'Your location is sent in every call',
                    icon: Icons.phone,
                    style: SectionHeaderStyle.standard,
                  ),
                  const SizedBox(height: 12),
                  _buildCallForHelp(context, ref, contactsAsync),

                  const SizedBox(height: 24),

                  // Bottom action buttons: Send Alert + Enter evacuation route
                  _buildBottomActionButtons(context, ref),

                  const SizedBox(height: 24),

                  // Emergency Contacts Section (from Firestore)
                  SectionHeader(
                    title: 'Emergency Contacts',
                    icon: Icons.contact_phone,
                    style: SectionHeaderStyle.standard,
                  ),
                  const SizedBox(height: 12),
                  _buildEmergencyContacts(context, ref, contactsAsync),

                  const SizedBox(height: 24),

                  // Assembly Point & Evacuation Route Section
                  SectionHeader(
                    title: 'Nearest Safety Locations',
                    icon: Icons.route,
                    style: SectionHeaderStyle.standard,
                  ),
                  const SizedBox(height: 12),
                  _buildSafetyLocations(context, ref, assemblyPointAsync, evacuationRouteAsync),

                  const SizedBox(height: 32),
                ],
              ),
            ),

            // Error overlay for SOS activation
            if (sosState.isError) _buildErrorOverlay(context, sosState.errorMessage!),
          ],
        ),
      ),
    );
  }

  Widget _buildSosSection(BuildContext context, SosActivationState sosState) {
    final colorScheme = Theme.of(context).colorScheme;
    final isConfirming = sosState.isConfirming;
    final holdProgress = sosState.holdProgress;

    return AppElevatedCard(
      padding: const EdgeInsets.all(24),
      elevation: 4,
      child: Column(
        children: [
          // Warning banner
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: colorScheme.errorContainer,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: colorScheme.error, width: 1),
            ),
            child: Row(
              children: [
                Icon(Icons.warning_amber_rounded, color: colorScheme.error, size: 28),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Emergency SOS',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: colorScheme.onErrorContainer,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Hold the button for 3 seconds to immediately alert campus security and emergency services with your location.',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onErrorContainer.withValues(alpha: 0.8),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // SOS Button with hold progress
          Stack(
            alignment: Alignment.center,
            children: [
              // Hold progress ring
              if (isConfirming && holdProgress > 0 && holdProgress < 100)
                AnimatedBuilder(
                  animation: _holdProgressController,
                  builder: (context, child) {
                    return SizedBox(
                      width: 120,
                      height: 120,
                      child: CircularProgressIndicator(
                        value: _holdProgressController.value,
                        strokeWidth: 8,
                        backgroundColor: colorScheme.error.withValues(alpha: 0.2),
                        valueColor: AlwaysStoppedAnimation<Color>(colorScheme.error),
                      ),
                    );
                  },
                ),

              // Pulsing animation when idle
              if (!isConfirming)
                AnimatedBuilder(
                  animation: _pulseController,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: 1.0 + (_pulseController.value * 0.05),
                      child: child,
                    );
                  },
                  child: const SizedBox(width: 120, height: 120),
                ),

              // SOS Button
              GestureDetector(
                onTapDown: (_) => _startSosHold(),
                onTapUp: (_) => _cancelSosHold(),
                onTapCancel: _cancelSosHold,
                onLongPressEnd: (_) => _cancelSosHold(),
                child: AppSosButton(
                  onPressed: () {}, // Handled by GestureDetector
                  label: 'SOS',
                  size: SosButtonSize.large,
                  isEnabled: sosState.isIdle || sosState.isError,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Hold instruction / progress text
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: isConfirming && holdProgress > 0 && holdProgress < 100
                ? Text(
                    'Hold for ${(3 - holdProgress / 100 * 3).toStringAsFixed(1)}s...',
                    key: const ValueKey('progress'),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: colorScheme.error,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                : Text(
                    'Hold for 3 seconds to activate',
                    key: const ValueKey('instruction'),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorOverlay(BuildContext context, String error) {
    final colorScheme = Theme.of(context).colorScheme;

    return Positioned.fill(
      child: Material(
        color: Colors.black54,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: AppElevatedCard(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.error_outline, color: colorScheme.error, size: 48),
                  const SizedBox(height: 16),
                  Text(
                    'Error',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    error,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: AppOutlinedButton(
                          onPressed: () {
                            ref.read(sosActivationStateProvider.notifier).state = const SosActivationState.idle();
                          },
                          label: 'Dismiss',
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: AppFilledButton(
                          onPressed: () {
                            ref.read(sosActivationStateProvider.notifier).state = const SosActivationState.idle();
                            _activateSos();
                          },
                          label: 'Retry',
                          backgroundColor: colorScheme.primary,
                          foregroundColor: colorScheme.onPrimary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCallForHelp(
    BuildContext context,
    WidgetRef ref,
    AsyncValue<List<CampusEmergencyContact>> contactsAsync,
  ) {
    return contactsAsync.when(
      data: (contacts) {
        // Look up the four campus service contacts by role from Firestore only.
        // No fallback phone numbers are invented — if a contact is not in Firestore,
        // an unavailable state is shown instead of a hardcoded number.
        final fireStation = _findContactByRole(
          contacts,
          (c) => c.role.toLowerCase().contains('fire'),
        );
        final hospital = _findContactByRole(
          contacts,
          (c) => c.role.toLowerCase().contains('medical') || c.role.toLowerCase().contains('health'),
        );
        final policeStation = _findContactByRole(
          contacts,
          (c) => c.role.toLowerCase().contains('police'),
        );
        final campusSecurity = _findContactByRole(
          contacts,
          (c) => c.isCampusSecurity || c.role.toLowerCase().contains('security'),
        );

        return Column(
          children: [
            // Row 1: Fire Station + Hospital
            Row(
              children: [
                Expanded(
                  child: fireStation != null
                      ? _CallButton(
                          label: 'Fire Station',
                          subtitle: 'Nearest',
                          icon: Icons.local_fire_department,
                          color: AppColors.emergency,
                          phone: fireStation.phone,
                          isAvailable: fireStation.isActive,
                          onCall: () => _makePhoneCall(fireStation.phone),
                        )
                      : _CallButtonUnavailable(
                          label: 'Fire Station',
                          icon: Icons.local_fire_department,
                          color: AppColors.emergency,
                        ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: hospital != null
                      ? _CallButton(
                          label: 'Hospital',
                          subtitle: 'Nearest',
                          icon: Icons.medical_services,
                          color: AppColors.primary,
                          phone: hospital.phone,
                          isAvailable: hospital.isActive,
                          onCall: () => _makePhoneCall(hospital.phone),
                        )
                      : _CallButtonUnavailable(
                          label: 'Hospital',
                          icon: Icons.medical_services,
                          color: AppColors.primary,
                        ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Row 2: Police Station + Campus Security
            Row(
              children: [
                Expanded(
                  child: policeStation != null
                      ? _CallButton(
                          label: 'Police Station',
                          subtitle: 'Nearest',
                          icon: Icons.local_police,
                          color: AppColors.secondary,
                          phone: policeStation.phone,
                          isAvailable: policeStation.isActive,
                          onCall: () => _makePhoneCall(policeStation.phone),
                        )
                      : _CallButtonUnavailable(
                          label: 'Police Station',
                          icon: Icons.local_police,
                          color: AppColors.secondary,
                        ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: campusSecurity != null
                      ? _CallButton(
                          label: 'Campus Security',
                          subtitle: 'Nearest',
                          icon: Icons.security,
                          color: Colors.purple,
                          phone: campusSecurity.phone,
                          isAvailable: campusSecurity.isActive,
                          onCall: () => _makePhoneCall(campusSecurity.phone),
                        )
                      : _CallButtonUnavailable(
                          label: 'Campus Security',
                          icon: Icons.security,
                          color: Colors.purple,
                        ),
                ),
              ],
            ),
          ],
        );
      },
      loading: () => const Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: InlineLoading(message: 'Loading emergency contacts...'),
        ),
      ),
      error: (error, _) => _buildErrorContacts(
        context,
        error.toString(),
        onRetry: () => ref.refresh(campusEmergencyContactsStreamProvider),
      ),
    );
  }

  Widget _buildBottomActionButtons(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: AppFilledButton(
                onPressed: () => _showConfirmationDialog(),
                label: 'Send Alert',
                icon: Icons.send_rounded,
                backgroundColor: colorScheme.error,
                foregroundColor: colorScheme.onError,
                size: ButtonSize.large,
                semanticLabel: 'Send emergency alert',
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: AppOutlinedButton(
                onPressed: () => Navigator.pushNamed(context, '/emergency/evacuation'),
                label: 'Enter evacuation route',
                icon: Icons.route,
                borderColor: colorScheme.primary,
                foregroundColor: colorScheme.primary,
                size: ButtonSize.large,
                semanticLabel: 'Enter evacuation route',
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildEmergencyContacts(
    BuildContext context,
    WidgetRef ref,
    AsyncValue<List<CampusEmergencyContact>> contactsAsync,
  ) {
    return contactsAsync.when(
      data: (contacts) {
        if (contacts.isEmpty) {
          return _buildEmptyContacts(context);
        }
        return Column(
          children: contacts
              .map((contact) => _EmergencyContactTile(
                    contact: contact,
                    onCall: () => _makePhoneCall(contact.phone),
                  ))
              .toList(),
        );
      },
      loading: () => const Center(child: InlineLoading(message: 'Loading emergency contacts...')),
      error: (error, _) => _buildErrorContacts(
        context,
        error.toString(),
        onRetry: () => ref.refresh(campusEmergencyContactsStreamProvider),
      ),
    );
  }

  Widget _buildEmptyContacts(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return AppCard(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Icon(Icons.contact_phone, size: 48, color: colorScheme.onSurfaceVariant),
          const SizedBox(height: 12),
          Text(
            'No emergency contacts available',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Emergency contact information will appear here when configured.',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildErrorContacts(
    BuildContext context,
    String error, {
    VoidCallback? onRetry,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    return AppCard(
      padding: const EdgeInsets.all(16),
      child: InlineError(
        title: 'Failed to load emergency contacts',
        message: error,
        icon: Icons.error_outline,
        onRetry: onRetry,
        retryLabel: 'Retry',
        iconColor: colorScheme.error,
      ),
    );
  }

  Widget _buildSafetyLocations(
    BuildContext context,
    WidgetRef ref,
    AsyncValue<AssemblyPoint?> assemblyPointAsync,
    AsyncValue<EvacuationRouteSummary?> evacuationRouteAsync,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: assemblyPointAsync.when(
            data: (point) => _AssemblyPointCard(
              point: point,
              onNavigate: point != null ? () => _navigateToSafety(context, ref, point) : null,
            ),
            loading: () => const Center(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: InlineLoading(message: 'Loading assembly point...'),
              ),
            ),
            error: (_, _) => const Center(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: InlineError(
                  title: 'Unable to load assembly point',
                  message: 'Please try again later.',
                  icon: Icons.error_outline,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: evacuationRouteAsync.when(
            data: (route) => _EvacuationRouteCard(
              route: route,
              onNavigate: route != null ? () => _navigateToSafetyViaRoute(context, ref, route) : null,
            ),
            loading: () => const Center(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: InlineLoading(message: 'Loading evacuation route...'),
              ),
            ),
            error: (_, _) => const Center(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: InlineError(
                  title: 'Unable to load evacuation route',
                  message: 'Please try again later.',
                  icon: Icons.error_outline,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _navigateToSafety(BuildContext context, WidgetRef ref, AssemblyPoint point) {
    // Set the assembly point as navigation destination
    final destination = NavigationDestination(
      id: 'assembly_${point.id}',
      name: point.name,
      type: DestinationType.assemblyPoint(),
      coordinates: point.latLng,
      description: 'Nearest Assembly Point',
      isAssemblyPoint: true,
    );

    ref.read(navigationDestinationProvider.notifier).state = destination;

    // Start navigation
    _startNavigation(context);
  }

  void _navigateToSafetyViaRoute(BuildContext context, WidgetRef ref, EvacuationRouteSummary route) {
    // Use the evacuation route's path as navigation
    if (route.pathCoordinates.isNotEmpty) {
      final destination = NavigationDestination(
        id: 'evacuation_${route.id}',
        name: route.name,
        type: DestinationType.assemblyPoint(),
        coordinates: route.pathCoordinates.last,
        description: 'Evacuation Route: ${route.name}',
      );

      ref.read(navigationDestinationProvider.notifier).state = destination;
      _startNavigation(context);
    }
  }

  void _startNavigation(BuildContext context) {
    // Navigate to the navigation screen to start turn-by-turn
    Navigator.pushNamed(context, '/navigation');
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Starting navigation to safety...'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _showSafetyInfoDialog(BuildContext context) {
    final safetyItems = [
      const SafetyInfo(
        icon: Icons.check_circle_outline,
        title: 'Know Your Exits',
        description: 'Familiarize yourself with building exits and evacuation routes.',
      ),
      const SafetyInfo(
        icon: Icons.check_circle_outline,
        title: 'Stay Calm',
        description: 'In an emergency, remain calm and follow instructions from authorities.',
      ),
      const SafetyInfo(
        icon: Icons.check_circle_outline,
        title: 'Buddy System',
        description: 'Always inform someone of your location when moving around campus.',
      ),
      const SafetyInfo(
        icon: Icons.check_circle_outline,
        title: 'Emergency Kit',
        description: 'Keep a small emergency kit with water, flashlight, and whistle.',
      ),
    ];

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Icon(Icons.shield, color: Theme.of(context).colorScheme.primary),
            const SizedBox(width: 8),
            const Text('Safety Information'),
          ],
        ),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView(
            shrinkWrap: true,
            children: safetyItems
                .map((item) => Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primaryContainer,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(item.icon, color: Theme.of(context).colorScheme.primary, size: 18),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.title,
                                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  item.description,
                                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ))
                .toList(),
          ),
        ),
        actions: [
          AppTextButton(
            onPressed: () => Navigator.pop(context),
            label: 'Close',
          ),
        ],
      ),
    );
  }

  /// Finds a campus emergency contact by role predicate, returning null if none matches.
  /// No fallback phone numbers are invented — absence of a contact means unavailable.
  CampusEmergencyContact? _findContactByRole(
    List<CampusEmergencyContact> contacts,
    bool Function(CampusEmergencyContact) test,
  ) {
    for (final contact in contacts) {
      if (test(contact)) return contact;
    }
    return null;
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final uri = Uri.parse('tel:$phoneNumber');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Could not launch phone dialer for $phoneNumber'),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }
}

/// SOS Confirmation Dialog
class _SosConfirmationDialog extends StatelessWidget {
  final VoidCallback onCancel;
  final VoidCallback onConfirm;

  const _SosConfirmationDialog({
    required this.onCancel,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AlertDialog(
      title: Row(
        children: [
          Icon(Icons.warning_amber_rounded, color: colorScheme.error, size: 28),
          const SizedBox(width: 8),
          const Text('Activate Emergency SOS?'),
        ],
      ),
      content: Text(
        'This will immediately alert campus security and emergency services with your current location. Your emergency contacts will also be notified.',
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: colorScheme.onSurfaceVariant,
        ),
      ),
      actions: [
        AppTextButton(
          onPressed: onCancel,
          label: 'Cancel',
        ),
        AppFilledButton(
          onPressed: onConfirm,
          label: 'Activate SOS',
          backgroundColor: colorScheme.error,
          foregroundColor: colorScheme.onError,
          semanticLabel: 'Activate emergency SOS',
        ),
      ],
    );
  }
}

/// Call button for direct emergency service calls (per Figma "Call for help")
class _CallButton extends StatelessWidget {
  final String label;
  final String subtitle;
  final IconData icon;
  final Color color;
  final String phone;
  final bool isAvailable;
  final VoidCallback onCall;

  const _CallButton({
    required this.label,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.phone,
    required this.isAvailable,
    required this.onCall,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AppOutlinedCard(
      onTap: isAvailable ? onCall : null,
      padding: const EdgeInsets.all(16),
      borderColor: color.withValues(alpha: 0.3),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: color, size: 24),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.call, color: color, size: 20),
            ],
          ),
        ],
      ),
    );
  }
}

/// Call button shown when no verified contact is available from Firestore.
/// Displays an unavailable state instead of a hardcoded fallback phone number.
class _CallButtonUnavailable extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;

  const _CallButtonUnavailable({
    required this.label,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AppOutlinedCard(
      onTap: null, // Disabled — no verified phone number available
      padding: const EdgeInsets.all(16),
      borderColor: color.withValues(alpha: 0.3),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: color.withValues(alpha: 0.4), size: 24),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: colorScheme.onSurfaceVariant.withValues(alpha: 0.6),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Not available',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.call, color: color.withValues(alpha: 0.3), size: 20),
            ],
          ),
        ],
      ),
    );
  }
}

/// Emergency contact tile using Firestore data
class _EmergencyContactTile extends StatelessWidget {
  final CampusEmergencyContact contact;
  final VoidCallback onCall;

  const _EmergencyContactTile({
    required this.contact,
    required this.onCall,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    // Determine category color/icon from services/role
    Color categoryColor;
    IconData categoryIcon;

    if (contact.isCampusSecurity || contact.role.toLowerCase().contains('security')) {
      categoryColor = Colors.blue;
      categoryIcon = Icons.security;
    } else if (contact.role.toLowerCase().contains('medical') || contact.role.toLowerCase().contains('health')) {
      categoryColor = Colors.red;
      categoryIcon = Icons.medical_services;
    } else if (contact.role.toLowerCase().contains('fire')) {
      categoryColor = Colors.orange;
      categoryIcon = Icons.local_fire_department;
    } else if (contact.role.toLowerCase().contains('police')) {
      categoryColor = Colors.indigo;
      categoryIcon = Icons.local_police;
    } else {
      categoryColor = colorScheme.primary;
      categoryIcon = Icons.phone;
    }

    return AppCard(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(16),
      onTap: onCall,
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: categoryColor.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(categoryIcon, color: categoryColor, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  contact.name,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  contact.role,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                if (contact.hours?.isNotEmpty == true) ...[
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      Icon(Icons.access_time, size: 12, color: colorScheme.onSurfaceVariant),
                      const SizedBox(width: 4),
                      Text(
                        contact.hours!,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                contact.phone,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontFamily: 'RobotoMono',
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Icon(Icons.call, size: 18, color: colorScheme.primary),
                  const SizedBox(width: 4),
                  if (contact.isCampusSecurity)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        'Security',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: colorScheme.onPrimaryContainer,
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Assembly point card
class _AssemblyPointCard extends StatelessWidget {
  final AssemblyPoint? point;
  final VoidCallback? onNavigate;

  const _AssemblyPointCard({
    required this.point,
    required this.onNavigate,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    if (point == null) {
      return AppCard(
        padding: const EdgeInsets.all(16),
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
                  child: Icon(Icons.meeting_room, color: colorScheme.primary, size: 20),
                ),
                const SizedBox(width: 12),
                Text(
                  'Assembly Point',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Center(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: InlineLoading(message: 'Loading assembly point...'),
              ),
            ),
          ],
        ),
      );
    }

    // Type narrowing: after null check, point is non-null
    final p = point!;

    return AppCard(
      onTap: onNavigate,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.green.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.meeting_room, color: Colors.green, size: 20),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      p.name,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      'Assembly Point',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              if (onNavigate != null)
                Icon(Icons.navigate_next, color: colorScheme.primary, size: 28),
            ],
          ),
          const SizedBox(height: 12),
          if (p.capacity != null && p.capacity! > 0) ...[
            Row(
              children: [
                Icon(Icons.people, size: 16, color: colorScheme.onSurfaceVariant),
                const SizedBox(width: 4),
                Text(
                  'Capacity: ${p.availableCapacity}/${p.capacity}',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            const SizedBox(height: 8),
          ],
          if (p.buildingId != null) ...[
            Row(
              children: [
                Icon(Icons.business, size: 16, color: colorScheme.onSurfaceVariant),
                const SizedBox(width: 4),
                Text(
                  p.buildingId!,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
          if (onNavigate != null) ...[
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: AppFilledButton(
                onPressed: onNavigate,
                label: 'Navigate to Safety',
                icon: Icons.directions_walk,
                size: ButtonSize.small,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

/// Evacuation route card
class _EvacuationRouteCard extends StatelessWidget {
  final EvacuationRouteSummary? route;
  final VoidCallback? onNavigate;

  const _EvacuationRouteCard({
    required this.route,
    required this.onNavigate,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    if (route == null) {
      return AppCard(
        padding: const EdgeInsets.all(16),
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
                  child: Icon(Icons.route, color: colorScheme.primary, size: 20),
                ),
                const SizedBox(width: 12),
                Text(
                  'Evacuation Route',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Center(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: InlineLoading(message: 'Loading evacuation route...'),
              ),
            ),
          ],
        ),
      );
    }

    // Type narrowing: after null check, route is non-null
    final r = route!;

    return AppCard(
      onTap: onNavigate,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.purple.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.route, color: Colors.purple, size: 20),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      r.name,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      'Evacuation Route',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              if (onNavigate != null)
                Icon(Icons.navigate_next, color: colorScheme.primary, size: 28),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Icon(Icons.straighten, size: 16, color: colorScheme.onSurfaceVariant),
              const SizedBox(width: 4),
              Text(
                '${(r.distanceMeters / 1000).toStringAsFixed(1)} km',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(width: 16),
              Icon(Icons.timer, size: 16, color: colorScheme.onSurfaceVariant),
              const SizedBox(width: 4),
              Text(
                '${r.estimatedTimeMinutes} min',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          if (r.isWheelchairAccessible) ...[
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.accessible, size: 16, color: Colors.green),
                const SizedBox(width: 4),
                Text(
                  'Wheelchair Accessible',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.green,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
          if (onNavigate != null) ...[
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: AppFilledButton(
                onPressed: onNavigate,
                label: 'Follow Route',
                icon: Icons.directions_run,
                size: ButtonSize.small,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

/// Safety info data class
class SafetyInfo {
  final IconData icon;
  final String title;
  final String description;

  const SafetyInfo({
    required this.icon,
    required this.title,
    required this.description,
  });
}

/// Full-screen emergency status screen
class EmergencyStatusScreen extends ConsumerWidget {
  final EmergencyReport report;

  const EmergencyStatusScreen({super.key, required this.report});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the report for real-time updates from Firestore stream
    final reportAsync = ref.watch(activeEmergencyReportProvider);

    return reportAsync.when(
      data: (updatedReport) {
        final currentReport = updatedReport ?? report;
        if (!currentReport.isActive) {
          // If report is no longer active, pop back to main screen
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (context.mounted) {
              Navigator.pop(context);
            }
          });
        }
        return EmergencyStatusView(report: currentReport);
      },
      loading: () => EmergencyStatusView(report: report),
      error: (_, __) => EmergencyStatusView(report: report),
    );
  }
}

class EmergencyStatusView extends ConsumerWidget {
  final EmergencyReport report;

  const EmergencyStatusView({super.key, required this.report});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final canCancel = report.canCancel;

    // Watch assembly point and evacuation route for this location
    final assemblyPointAsync = ref.watch(nearestAssemblyPointProvider);
    final evacuationRouteAsync = ref.watch(nearestEvacuationRouteProvider);

    return PopScope(
      canPop: false, // Prevent accidental back navigation
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop && canCancel) {
          _showCancelDialog(context, ref);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Emergency Status'),
          centerTitle: true,
          elevation: 0,
          backgroundColor: colorScheme.surface,
          foregroundColor: colorScheme.onSurface,
          surfaceTintColor: Colors.transparent,
          automaticallyImplyLeading: false,
          actions: [
            if (canCancel)
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => _showCancelDialog(context, ref),
                tooltip: 'Cancel Emergency',
              ),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // Status header
                _buildStatusHeader(context, colorScheme),

                const SizedBox(height: 24),

                // Location info
                _buildLocationInfo(context),

                const SizedBox(height: 24),

                // Assembly Point & Evacuation Route (if available)
                _buildSafetyLocations(context, ref, assemblyPointAsync, evacuationRouteAsync),

                const SizedBox(height: 24),

                // Responder info (if assigned)
                if (report.responder != null) _buildResponderInfo(context, report.responder!),

                const SizedBox(height: 24),

                // Timeline / Notes
                Expanded(child: _buildTimeline(context, report)),

                const SizedBox(height: 16),

                // Cancel button (if allowed)
                if (canCancel) _buildCancelButton(context, ref),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatusHeader(BuildContext context, ColorScheme colorScheme) {
    final status = report.status;
    final statusColor = status.when(
      pending: () => Colors.orange,
      connecting: () => Colors.orange,
      acknowledged: () => Colors.blue,
      dispatched: () => Colors.purple,
      arrived: () => Colors.green,
      resolved: () => Colors.green,
      cancelled: () => Colors.grey,
      failed: () => colorScheme.error,
    );

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: statusColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: statusColor, width: 2),
      ),
      child: Column(
        children: [
          // Status icon
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: statusColor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              _getStatusIcon(status),
              color: Colors.white,
              size: 32,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            status.displayName,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w700,
              color: statusColor,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            report.type.displayName,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 12),
          // Progress indicator
          _buildStatusProgress(status),
        ],
      ),
    );
  }

  Widget _buildStatusProgress(EmergencyStatus status) {
    final progress = _getStatusProgress(status);
    final labels = ['Alerting', 'Acknowledged', 'Dispatched', 'Arrived', 'Resolved'];

    return Column(
      children: [
        LinearProgressIndicator(
          value: progress,
          backgroundColor: Colors.grey.withValues(alpha: 0.2),
          minHeight: 8,
          borderRadius: BorderRadius.circular(4),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: labels.asMap().entries.map((entry) {
            final index = entry.key;
            final label = entry.value;
            final isActive = index <= _getStatusIndex(status);
            return Text(
              label,
              style: TextStyle(
                fontSize: 10,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
                color: isActive ? Colors.black87 : Colors.grey,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  IconData _getStatusIcon(EmergencyStatus status) {
    return status.when(
      pending: () => Icons.radar,
      connecting: () => Icons.wifi_tethering,
      acknowledged: () => Icons.check_circle,
      dispatched: () => Icons.local_shipping,
      arrived: () => Icons.location_on,
      resolved: () => Icons.task_alt,
      cancelled: () => Icons.cancel,
      failed: () => Icons.error,
    );
  }

  double _getStatusProgress(EmergencyStatus status) {
    return status.when(
      pending: () => 0.0,
      connecting: () => 0.15,
      acknowledged: () => 0.35,
      dispatched: () => 0.55,
      arrived: () => 0.8,
      resolved: () => 1.0,
      cancelled: () => 0.0,
      failed: () => 0.0,
    );
  }

  int _getStatusIndex(EmergencyStatus status) {
    return status.when(
      pending: () => 0,
      connecting: () => 0,
      acknowledged: () => 1,
      dispatched: () => 2,
      arrived: () => 3,
      resolved: () => 4,
      cancelled: () => -1,
      failed: () => -1,
    );
  }

  Widget _buildLocationInfo(BuildContext context) {
    final location = report.userLocation;
    final colorScheme = Theme.of(context).colorScheme;

    return AppCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.location_on, color: colorScheme.primary, size: 20),
              const SizedBox(width: 8),
              Text(
                'Your Shared Location',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          if (location.address?.isNotEmpty == true) ...[
            Text(
              location.address!,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 8),
          ],
          Row(
            children: [
              Expanded(
                child: _buildLocationDetail(
                  context,
                  'Latitude',
                  location.latitude.toStringAsFixed(6),
                ),
              ),
              Expanded(
                child: _buildLocationDetail(
                  context,
                  'Longitude',
                  location.longitude.toStringAsFixed(6),
                ),
              ),
              if (location.accuracy != null)
                Expanded(
                  child: _buildLocationDetail(
                    context,
                    'Accuracy',
                    '${location.accuracy!.toStringAsFixed(0)}m',
                  ),
                ),
            ],
          ),
          if (location.buildingId != null || location.floorId != null || location.roomId != null) ...[
            const SizedBox(height: 12),
            const Divider(),
            const SizedBox(height: 8),
            if (location.buildingId != null)
              _buildLocationDetail(context, 'Building', location.buildingId!),
            if (location.floorId != null)
              _buildLocationDetail(context, 'Floor', location.floorId!),
            if (location.roomId != null)
              _buildLocationDetail(context, 'Room', location.roomId!),
          ],
        ],
      ),
    );
  }

  Widget _buildLocationDetail(BuildContext context, String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
            fontFamily: 'RobotoMono',
          ),
        ),
      ],
    );
  }

  Widget _buildSafetyLocations(
    BuildContext context,
    WidgetRef ref,
    AsyncValue<AssemblyPoint?> assemblyPointAsync,
    AsyncValue<EvacuationRouteSummary?> evacuationRouteAsync,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: assemblyPointAsync.when(
            data: (point) => _AssemblyPointCard(
              point: point,
              onNavigate: point != null ? () => _navigateToSafety(context, ref, point) : null,
            ),
            loading: () => const Center(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: InlineLoading(message: 'Loading assembly point...'),
              ),
            ),
            error: (_, _) => const Center(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: InlineError(
                  title: 'Unable to load assembly point',
                  message: 'Please try again later.',
                  icon: Icons.error_outline,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: evacuationRouteAsync.when(
            data: (route) => _EvacuationRouteCard(
              route: route,
              onNavigate: route != null ? () => _navigateToSafetyViaRoute(context, ref, route) : null,
            ),
            loading: () => const Center(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: InlineLoading(message: 'Loading evacuation route...'),
              ),
            ),
            error: (_, _) => const Center(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: InlineError(
                  title: 'Unable to load evacuation route',
                  message: 'Please try again later.',
                  icon: Icons.error_outline,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _navigateToSafety(BuildContext context, WidgetRef ref, AssemblyPoint point) {
    final destination = NavigationDestination(
      id: 'assembly_${point.id}',
      name: point.name,
      type: DestinationType.assemblyPoint(),
      coordinates: point.latLng,
      description: 'Nearest Assembly Point',
      isAssemblyPoint: true,
    );

    ref.read(navigationDestinationProvider.notifier).state = destination;
    Navigator.pushNamed(context, '/navigation');
  }

  void _navigateToSafetyViaRoute(BuildContext context, WidgetRef ref, EvacuationRouteSummary route) {
    if (route.pathCoordinates.isNotEmpty) {
      final destination = NavigationDestination(
        id: 'evacuation_${route.id}',
        name: route.name,
        type: DestinationType.assemblyPoint(),
        coordinates: route.pathCoordinates.last,
        description: 'Evacuation Route: ${route.name}',
      );

      ref.read(navigationDestinationProvider.notifier).state = destination;
      Navigator.pushNamed(context, '/navigation');
    }
  }

  Widget _buildResponderInfo(BuildContext context, ResponderInfo responder) {
    final colorScheme = Theme.of(context).colorScheme;

    return AppCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.person_pin, color: colorScheme.primary, size: 20),
              const SizedBox(width: 8),
              Text(
                'Assigned Responder',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: colorScheme.primaryContainer,
                child: Text(
                  responder.name.isNotEmpty ? responder.name[0].toUpperCase() : '?',
                  style: TextStyle(
                    color: colorScheme.onPrimaryContainer,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      responder.name,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      responder.role,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              if (responder.etaMinutes != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'ETA: ${responder.etaMinutes} min',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: colorScheme.primary,
                      ),
                    ),
                    if (responder.vehicleId != null)
                      Text(
                        responder.vehicleId!,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                  ],
                ),
            ],
          ),
          if (responder.phone.isNotEmpty) ...[
            const SizedBox(height: 12),
            AppOutlinedButton(
              onPressed: () => _makePhoneCall(context, responder.phone),
              label: 'Call Responder',
              icon: Icons.call,
              size: ButtonSize.small,
            ),
          ],
        ],
      ),
    );
  }

  Future<void> _makePhoneCall(BuildContext context, String phoneNumber) async {
    final uri = Uri.parse('tel:$phoneNumber');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  Widget _buildTimeline(BuildContext context, EmergencyReport report) {
    return AppCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Timeline',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: ListView(
              children: [
                _buildTimelineItem(
                  context,
                  'Emergency Reported',
                  report.createdAt,
                  Icons.sos,
                  Colors.red,
                  isFirst: true,
                ),
                if (report.acknowledgedAt != null)
                  _buildTimelineItem(
                    context,
                    'Security Acknowledged',
                    report.acknowledgedAt!,
                    Icons.check_circle,
                    Colors.blue,
                  ),
                if (report.dispatchedAt != null)
                  _buildTimelineItem(
                    context,
                    'Help Dispatched',
                    report.dispatchedAt!,
                    Icons.local_shipping,
                    Colors.purple,
                  ),
                if (report.arrivedAt != null)
                  _buildTimelineItem(
                    context,
                    'Responder Arrived',
                    report.arrivedAt!,
                    Icons.location_on,
                    Colors.green,
                  ),
                if (report.resolvedAt != null)
                  _buildTimelineItem(
                    context,
                    'Resolved',
                    report.resolvedAt!,
                    Icons.task_alt,
                    Colors.green,
                    isLast: true,
                  ),
                if (report.cancelledAt != null)
                  _buildTimelineItem(
                    context,
                    'Cancelled',
                    report.cancelledAt!,
                    Icons.cancel,
                    Colors.grey,
                    isLast: true,
                  ),
                // Notes
                ...(report.notes?.map((note) => _buildNoteItem(context, note)) ?? []),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineItem(
    BuildContext context,
    String title,
    DateTime time,
    IconData icon,
    Color color, {
    bool isFirst = false,
    bool isLast = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                  border: Border.all(color: Theme.of(context).colorScheme.surface, width: 2),
                ),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    color: Colors.grey.withValues(alpha: 0.3),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  _formatTime(time),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNoteItem(BuildContext context, String note) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: 18), // Align with timeline dots
          const SizedBox(width: 12),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                note,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatTime(DateTime time) {
    return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}:${time.second.toString().padLeft(2, '0')}';
  }

  Widget _buildCancelButton(BuildContext context, WidgetRef ref) {
    return AppOutlinedButton(
      onPressed: () => _showCancelDialog(context, ref),
      label: 'Cancel Emergency',
      icon: Icons.cancel,
      borderColor: Theme.of(context).colorScheme.error,
      foregroundColor: Theme.of(context).colorScheme.error,
    );
  }

  void _showCancelDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Icon(Icons.warning, color: Theme.of(context).colorScheme.error),
            const SizedBox(width: 8),
            const Text('Cancel Emergency?'),
          ],
        ),
        content: const Text(
          'Are you sure you want to cancel this emergency alert? This will notify security that you no longer need assistance.',
        ),
        actions: [
          AppTextButton(
            onPressed: () => Navigator.pop(context),
            label: 'Keep Active',
          ),
          AppFilledButton(
            onPressed: () async {
              Navigator.pop(context);
              await ref.read(emergencyRepositoryProvider).cancelReport(report.id, report.userId);
              // The stream will update and navigate back to main screen
            },
            label: 'Cancel Emergency',
            backgroundColor: Theme.of(context).colorScheme.error,
            semanticLabel: 'Cancel this emergency report',
          ),
        ],
      ),
    );
  }
}