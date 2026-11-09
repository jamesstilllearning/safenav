/// SAFENAV CAVITE - Email Verification Screen
///
/// Email verification flow with resend capability.
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/core.dart';
import '../../auth_state.dart';

/// Email verification screen widget
class VerifyEmailScreen extends ConsumerStatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  ConsumerState<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends ConsumerState<VerifyEmailScreen> {
  bool _isLoading = false;
  bool _emailSent = false;
  int _resendCooldown = 0;

  @override
  void initState() {
    super.initState();
    _sendVerificationEmail();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _sendVerificationEmail() async {
    setState(() => _isLoading = true);

    final result = await ref.read(authNotifierProvider.notifier).sendEmailVerification();

    if (!mounted) return;
    setState(() {
      _isLoading = false;
      if (result.isSuccess) {
        _emailSent = true;
        _startResendCooldown();
      } else {
        _showErrorSnackBar(result.failure.message);
      }
    });
  }

  void _startResendCooldown() {
    _resendCooldown = 60;
    Future.doWhile(() async {
      await Future.delayed(const Duration(seconds: 1));
      if (!mounted) return false;
      setState(() => _resendCooldown--);
      return _resendCooldown > 0;
    });
  }

  Future<void> _handleResend() async {
    if (_resendCooldown > 0) return;
    await _sendVerificationEmail();
  }

  Future<void> _checkVerificationStatus() async {
    // Reload user to check if email is verified
    await ref.read(authServiceProvider).signOut();
    // In a real app, you'd check auth state or use a stream
    if (mounted) {
      _showInfoSnackBar('Please check your email and click the verification link.');
    }
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

  void _showInfoSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Theme.of(context).colorScheme.primary,
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
        title: const Text('Verify Email'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 48),

              // Icon
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: colorScheme.primaryContainer,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.email_outlined,
                  size: 50,
                  color: colorScheme.onPrimaryContainer,
                ),
              ),

              const SizedBox(height: 24),

              Text(
                'Verify Your Email',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.primary,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 16),

              Text(
                _emailSent
                    ? 'We\'ve sent a verification email to your inbox. Please check your email and click the link to verify your account.'
                    : 'Sending verification email...',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 32),

              // Verification Status Check
              FilledButton.icon(
                onPressed: _isLoading ? null : _checkVerificationStatus,
                icon: const Icon(Icons.refresh),
                label: const Text('I\'ve Verified My Email'),
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),

              const SizedBox(height: 16),

              // Resend Email
              TextButton.icon(
                onPressed: _isLoading || _resendCooldown > 0 ? null : _handleResend,
                icon: _resendCooldown > 0
                    ? SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: colorScheme.primary,
                        ),
                      )
                    : const Icon(Icons.send),
                label: Text(
                  _resendCooldown > 0
                      ? 'Resend in $_resendCooldown s'
                      : 'Resend Verification Email',
                ),
              ),

              const Spacer(),

              // Help Text
              Text(
                'Didn\'t receive the email? Check your spam folder or make sure you entered the correct email address during registration.',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 24),

              // Back to Login (for unverified users who want to re-login)
              TextButton(
                onPressed: () => context.go(AppRoutes.login),
                child: const Text('Back to Sign In'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}