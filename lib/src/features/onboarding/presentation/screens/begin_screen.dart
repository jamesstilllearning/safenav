/// SAFENAV CAVITE - Begin Screen
///
/// Introductory welcome screen that replaces the login/registration experience.
/// Users tap BEGIN to enter the app without creating an account or authenticating.
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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Page header (top-left aligned)
                PageHeader(
                  title: 'SAFENAV CAVITE',
                  subtitle: 'Navigate Safely. Evacuate Confidently.',
                  icon: Icons.map_outlined,
                ),
                const SizedBox(height: AppSpacing.lg),
                Text(
                  'Your campus, your safety, your guide.',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: AppSpacing.xxl),
                // BEGIN button
                AppFilledButton(
                  onPressed: () => context.go(AppRoutes.home),
                  label: 'BEGIN',
                  icon: Icons.login,
                  iconPosition: IconPosition.trailing,
                  size: ButtonSize.large,
                  semanticLabel: 'Begin using SAFENAV CAVITE',
                ),
                const SizedBox(height: AppSpacing.md),
                Text(
                  'Tap Begin to explore the campus',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
