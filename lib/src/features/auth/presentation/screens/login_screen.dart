/// SAFENAV CAVITE - Login Screen
///
/// Email/password login with validation and error handling.
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/core.dart';
import '../../auth_state.dart';
import '../../../../shared/models/user.dart';

/// Login screen widget
class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  /// Handle Demo Mode login - debug only, creates a read-only demo user
  Future<void> _handleDemoMode() async {
    if (!kDebugMode) return;

    setState(() => _isLoading = true);

    try {
      // Use the auth service to set a demo mock user
      final authService = ref.read(authServiceProvider);
      await authService.setMockUserForDev(
        id: 'demo-user-001',
        email: 'demo@earist.edu.ph',
        firstName: 'Demo',
        lastName: 'User',
        role: UserRole.student, // Read-only student role
        middleInitial: null,
        studentId: 'DEMO-STU-001',
        employeeId: null,
        department: null,
        phoneNumber: '09000000000',
      );

      if (!mounted) return;
      setState(() => _isLoading = false);

      // Navigate to home
      context.go(AppRoutes.home);
    } catch (e) {
      if (!mounted) return;
      setState(() => _isLoading = false);
      _showErrorSnackBar('Demo mode failed: $e');
    }
  }

  Future<void> _handleLogin() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    final result = await ref.read(authNotifierProvider.notifier).signIn(
          _emailController.text.trim(),
          _passwordController.text,
        );

    if (!mounted) return;
    setState(() => _isLoading = false);

    result.fold(
      (failure) => _showErrorSnackBar(failure.message),
      (user) => context.go(AppRoutes.home),
    );
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Theme.of(context).colorScheme.error,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Logo & Title
                _buildHeader(context),

                const SizedBox(height: 32),

                // Email Field
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    hintText: 'student@earist.edu.ph',
                    prefixIcon: Icon(Icons.email_outlined),
                  ),
                  validator: (value) => validateEmail(value).errorMessage,
                  enabled: !_isLoading,
                ),

                const SizedBox(height: 16),

                // Password Field
                TextFormField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    prefixIcon: const Icon(Icons.lock_outlined),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                      ),
                      onPressed: () =>
                          setState(() => _obscurePassword = !_obscurePassword),
                    ),
                  ),
                  validator: (value) => validateRequired(value, 'Password').errorMessage,
                  enabled: !_isLoading,
                  onFieldSubmitted: (_) => _handleLogin(),
                ),

                const SizedBox(height: 8),

                // Forgot Password
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: _isLoading
                        ? null
                        : () => GoRouter.of(context).push(AppRoutes.forgotPassword),
                    child: const Text('Forgot Password?'),
                  ),
                ),

                const SizedBox(height: 24),

                // Login Button
                FilledButton(
                  onPressed: _isLoading ? null : _handleLogin,
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: _isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text('Sign In', style: TextStyle(fontSize: 16)),
                ),

                const SizedBox(height: 24),

                // Divider
                Row(
                  children: [
                    const Expanded(child: Divider()),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'OR',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                    const Expanded(child: Divider()),
                  ],
                ),

                const SizedBox(height: 24),

                // Register Link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Text(
                        "Don't have an account? ",
                        style: theme.textTheme.bodyMedium
                            ?.copyWith(color: colorScheme.onSurfaceVariant),
                      ),
                    ),
                    Flexible(
                      child: TextButton(
                        onPressed: _isLoading
                            ? null
                            : () => GoRouter.of(context).push(AppRoutes.register),
                        child: const Text('Sign Up'),
                      ),
                    ),
                  ],
                ),

                // Demo Mode Button (Debug Only)
                if (kDebugMode) ...[
                  const SizedBox(height: 24),
                  const Divider(),
                  const SizedBox(height: 16),
                  OutlinedButton.icon(
                    onPressed: _isLoading ? null : _handleDemoMode,
                    icon: const Icon(Icons.science_outlined),
                    label: const Text('Enter Demo Mode (Read-Only)'),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      foregroundColor: colorScheme.primary,
                      side: BorderSide(color: colorScheme.primary),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Demo mode provides read-only access to all features\nwithout requiring an account. Data is not saved.',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Icon(
            Icons.map_outlined,
            size: 40,
            color: colorScheme.onPrimaryContainer,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'SAFENAV CAVITE',
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: colorScheme.primary,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Campus Navigation & Emergency Evacuation',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          'Sign in to continue',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}