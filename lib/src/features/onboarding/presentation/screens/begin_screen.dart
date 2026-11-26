/// SAFENAV CAVITE - Begin Screen
///
/// Introductory welcome screen that replaces the login/registration experience.
/// Users tap BEGIN to enter the app without creating an account or authenticating.
///
/// Visual design follows the Figma "Splashscreen" reference:
/// - Center-aligned brand mark + "SAFENAV CAVITE" in brand green
/// - Tagline: "Navigate safely, Evacuate confidently."
/// - Subtagline: "YOUR CAMPUS. YOUR SAFETY. YOUR GUIDE."
/// - Pill-shaped brand-green "BEGIN" button
/// - Subtext: "Tap begin to explore the campus"
library;

import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/core.dart';
import '../../../../shared/widgets/widgets.dart';

/// Begin screen - the app's entry experience
class BeginScreen extends ConsumerWidget {
  const BeginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Brand mark — Figma shows the EARIST seal beside a green
                  // SAFENAV navigation icon, side by side.
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // EARIST seal (actual project asset).
                      Image.asset(
                        'assets/earist_logo/earist logo.jpg',
                        width: 72,
                        height: 72,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(width: AppSpacing.sm),
                      // Green SAFENAV navigation icon.
                      Icon(
                        Icons.explore,
                        color: AppColors.primaryLight,
                        size: 56,
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.lg),

                  // "SAFENAV CAVITE" — brand green, per Figma.
                  Text(
                    'SAFENAV CAVITE',
                    style: textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryLight,
                      letterSpacing: 0.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppSpacing.sm),

                  // Tagline — "Navigate safely, Evacuate confidently."
                  Text(
                    'Navigate safely, Evacuate confidently.',
                    style: textTheme.bodyLarge?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppSpacing.xs),

                  // Subtagline — "YOUR CAMPUS. YOUR SAFETY. YOUR GUIDE."
                  Text(
                    'YOUR CAMPUS. YOUR SAFETY. YOUR GUIDE.',
                    style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppSpacing.xxl),

                  // BEGIN button — pill-shaped, brand green, per Figma.
                  AppFilledButton(
                    onPressed: () => context.go(AppRoutes.home),
                    label: 'BEGIN',
                    icon: Icons.login,
                    iconPosition: IconPosition.trailing,
                    size: ButtonSize.large,
                    backgroundColor: AppColors.primaryLight,
                    borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
                    semanticLabel: 'Begin using SAFENAV CAVITE',
                  ),
                  const SizedBox(height: AppSpacing.md),

                  // "Tap Begin to explore the campus"
                  Text(
                    'Tap begin to explore the campus',
                    style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
