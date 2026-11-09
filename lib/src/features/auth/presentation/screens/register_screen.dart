/// SAFENAV CAVITE - Register Screen
///
/// User registration with role selection (Student/Faculty) and validation.
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/core.dart';
import '../../../../shared/models/models.dart';
import '../../auth_state.dart';

/// Register screen widget
class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _middleInitialController = TextEditingController();
  final _studentIdController = TextEditingController();
  final _employeeIdController = TextEditingController();
  final _departmentController = TextEditingController();
  final _phoneController = TextEditingController();

  UserRole _selectedRole = UserRole.student;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _middleInitialController.dispose();
    _studentIdController.dispose();
    _employeeIdController.dispose();
    _departmentController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  bool _showStudentFields() => _selectedRole == UserRole.student;
  bool _showFacultyFields() =>
      _selectedRole == UserRole.faculty || _selectedRole == UserRole.security;

  Future<void> _handleRegister() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    final result = await ref.read(authNotifierProvider.notifier).register(
          email: _emailController.text.trim(),
          password: _passwordController.text,
          firstName: _firstNameController.text.trim(),
          lastName: _lastNameController.text.trim(),
          middleInitial: _middleInitialController.text.trim().isEmpty
              ? null
              : _middleInitialController.text.trim().toUpperCase(),
          role: _selectedRole,
          studentId: _showStudentFields()
              ? _studentIdController.text.trim().isEmpty
                  ? null
                  : _studentIdController.text.trim()
              : null,
          employeeId: _showFacultyFields()
              ? _employeeIdController.text.trim().isEmpty
                  ? null
                  : _employeeIdController.text.trim()
              : null,
          department: _showFacultyFields()
              ? _departmentController.text.trim().isEmpty
                  ? null
                  : _departmentController.text.trim()
              : null,
          phoneNumber: _phoneController.text.trim().isEmpty
              ? null
              : _phoneController.text.trim(),
        );

    if (!mounted) return;
    setState(() => _isLoading = false);

    result.fold(
      (failure) => _showErrorSnackBar(failure.message),
      (user) => context.go(AppRoutes.verifyEmail),
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
        title: const Text('Create Account'),
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
                // Header
                _buildHeader(context),

                const SizedBox(height: 24),

                // Role Selection
                _buildRoleSelection(context),

                const SizedBox(height: 24),

                // Personal Information Section
                _buildSectionTitle(context, 'Personal Information'),

                const SizedBox(height: 16),

                // First Name
                TextFormField(
                  controller: _firstNameController,
                  textInputAction: TextInputAction.next,
                  textCapitalization: TextCapitalization.words,
                  decoration: const InputDecoration(
                    labelText: 'First Name *',
                    hintText: 'Juan',
                    prefixIcon: Icon(Icons.person_outlined),
                  ),
                  validator: (value) => validateName(value, fieldName: 'First Name').errorMessage,
                  enabled: !_isLoading,
                ),

                const SizedBox(height: 16),

                // Last Name
                TextFormField(
                  controller: _lastNameController,
                  textInputAction: TextInputAction.next,
                  textCapitalization: TextCapitalization.words,
                  decoration: const InputDecoration(
                    labelText: 'Last Name *',
                    hintText: 'Dela Cruz',
                    prefixIcon: Icon(Icons.person_outlined),
                  ),
                  validator: (value) => validateName(value, fieldName: 'Last Name').errorMessage,
                  enabled: !_isLoading,
                ),

                const SizedBox(height: 16),

                // Middle Initial (Optional)
                TextFormField(
                  controller: _middleInitialController,
                  textInputAction: TextInputAction.next,
                  textCapitalization: TextCapitalization.characters,
                  maxLength: 1,
                  decoration: const InputDecoration(
                    labelText: 'Middle Initial (Optional)',
                    hintText: 'M',
                    prefixIcon: Icon(Icons.badge_outlined),
                    counterText: '',
                  ),
                  enabled: !_isLoading,
                ),

                const SizedBox(height: 24),

                // Role-specific fields
                if (_showStudentFields()) _buildStudentFields(context),
                if (_showFacultyFields()) _buildFacultyFields(context),

                const SizedBox(height: 24),

                // Contact Information Section
                _buildSectionTitle(context, 'Contact Information'),

                const SizedBox(height: 16),

                // Email
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    labelText: 'Email *',
                    hintText: 'student@earist.edu.ph',
                    prefixIcon: Icon(Icons.email_outlined),
                  ),
                  validator: (value) => validateEmail(value).errorMessage,
                  enabled: !_isLoading,
                ),

                const SizedBox(height: 16),

                // Phone (Optional)
                TextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    labelText: 'Phone Number (Optional)',
                    hintText: '09123456789',
                    prefixIcon: Icon(Icons.phone_outlined),
                  ),
                  validator: (value) {
                    if (value != null && value.trim().isNotEmpty) {
                      return validatePhone(value).errorMessage;
                    }
                    return null;
                  },
                  enabled: !_isLoading,
                ),

                const SizedBox(height: 24),

                // Password Section
                _buildSectionTitle(context, 'Security'),

                const SizedBox(height: 16),

                // Password
                TextFormField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: 'Password *',
                    hintText: 'Min 8 chars, upper, lower, number',
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
                  validator: (value) => validatePassword(value).errorMessage,
                  enabled: !_isLoading,
                ),

                const SizedBox(height: 16),

                // Confirm Password
                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: _obscureConfirmPassword,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password *',
                    hintText: 'Re-enter password',
                    prefixIcon: const Icon(Icons.lock_outlined),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureConfirmPassword
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                      ),
                      onPressed: () => setState(
                          () => _obscureConfirmPassword = !_obscureConfirmPassword),
                    ),
                  ),
                  validator: (value) => validateConfirmPassword(value, _passwordController.text)
                      .errorMessage,
                  enabled: !_isLoading,
                  onFieldSubmitted: (_) => _handleRegister(),
                ),

                const SizedBox(height: 32),

                // Register Button
                FilledButton(
                  onPressed: _isLoading ? null : _handleRegister,
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: _isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text('Create Account', style: TextStyle(fontSize: 16)),
                ),

                const SizedBox(height: 24),

                // Login Link
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                    TextButton(
                      onPressed: _isLoading
                          ? null
                          : () => context.go(AppRoutes.login),
                      child: const Text('Sign In'),
                    ),
                  ],
                ),
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
          'Create your account',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    final theme = Theme.of(context);
    return Text(
      title,
      style: theme.textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.w600,
        color: theme.colorScheme.primary,
      ),
    );
  }

  Widget _buildRoleSelection(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Register As *',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: colorScheme.primary,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: UserRole.values
              .where((r) => r != UserRole.admin) // Admin not self-registerable
              .map((role) => _RoleCard(
                    role: role,
                    isSelected: _selectedRole == role,
                    onTap: () => setState(() => _selectedRole = role),
                  ))
              .toList(),
        ),
      ],
    );
  }

  Widget _buildStudentFields(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(context, 'Student Information'),
        const SizedBox(height: 16),
        TextFormField(
          controller: _studentIdController,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            labelText: 'Student ID *',
            hintText: '2024-00001',
            prefixIcon: Icon(Icons.badge_outlined),
          ),
          validator: (value) => validateStudentId(value).errorMessage,
          enabled: !_isLoading,
        ),
      ],
    );
  }

  Widget _buildFacultyFields(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(context, 'Employee Information'),
        const SizedBox(height: 16),
        TextFormField(
          controller: _employeeIdController,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            labelText: 'Employee ID *',
            hintText: 'EMP-0001',
            prefixIcon: Icon(Icons.badge_outlined),
          ),
          validator: (value) => validateRequired(value, 'Employee ID').errorMessage,
          enabled: !_isLoading,
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: _departmentController,
          textInputAction: TextInputAction.next,
          textCapitalization: TextCapitalization.words,
          decoration: const InputDecoration(
            labelText: 'Department/College *',
            hintText: 'College of Engineering',
            prefixIcon: Icon(Icons.apartment_outlined),
          ),
          validator: (value) => validateRequired(value, 'Department').errorMessage,
          enabled: !_isLoading,
        ),
      ],
    );
  }
}

/// Role selection card widget
class _RoleCard extends StatelessWidget {
  const _RoleCard({
    required this.role,
    required this.isSelected,
    required this.onTap,
  });

  final UserRole role;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 150,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? colorScheme.primary : colorScheme.outline,
            width: isSelected ? 2 : 1,
          ),
          color: isSelected
              ? colorScheme.primaryContainer.withValues(alpha: 0.5)
              : colorScheme.surfaceContainerHighest,
        ),
        child: Column(
          children: [
            Icon(
              _getRoleIcon(role),
              size: 32,
              color: isSelected ? colorScheme.primary : colorScheme.onSurfaceVariant,
            ),
            const SizedBox(height: 8),
            Text(
              role.displayName,
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
                color: isSelected ? colorScheme.primary : colorScheme.onSurface,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              _getRoleDescription(role),
              style: theme.textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  IconData _getRoleIcon(UserRole role) {
    switch (role) {
      case UserRole.student:
        return Icons.school_outlined;
      case UserRole.faculty:
        return Icons.cast_for_education_outlined;
      case UserRole.security:
        return Icons.security_outlined;
      case UserRole.admin:
        return Icons.admin_panel_settings_outlined;
    }
  }

  String _getRoleDescription(UserRole role) {
    switch (role) {
      case UserRole.student:
        return 'EARIST Student';
      case UserRole.faculty:
        return 'Faculty/Staff';
      case UserRole.security:
        return 'Security Personnel';
      case UserRole.admin:
        return 'Administrator';
    }
  }
}