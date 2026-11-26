/// SAFENAV CAVITE - App Text Field
///
/// Reusable, themed text input component with consistent styling,
/// validation support, and accessibility.
library;

import 'package:material_ui/material_ui.dart';

import '../../core/theme/app_theme.dart';

/// Text field variant styles
enum AppTextFieldVariant { filled, outlined, underlined }

/// Text field size variants
enum AppTextFieldSize { small, medium, large }

/// A reusable, themed text input field.
///
/// Wraps [TextFormField] with consistent SAFENAV styling, themed colors,
/// and [AppSpacing] values for padding and border radius.
class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.controller,
    this.focusNode,
    this.label,
    this.hint,
    this.helperText,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.onEditingComplete,
    this.readOnly = false,
    this.obscureText = false,
    this.enabled = true,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.keyboardType,
    this.textInputAction,
    this.autofillHints,
    this.validator,
    this.variant = AppTextFieldVariant.outlined,
    this.size = AppTextFieldSize.medium,
    this.textStyle,
    this.labelStyle,
    this.hintStyle,
    this.errorStyle,
    this.semanticLabel,
    this.excludeFromSemantics = false,
  });

  final TextEditingController controller;
  final FocusNode? focusNode;
  final String? label;
  final String? hint;
  final String? helperText;
  final String? errorText;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onTap;
  final VoidCallback? onEditingComplete;
  final bool readOnly;
  final bool obscureText;
  final bool enabled;
  final int maxLines;
  final int? minLines;
  final int? maxLength;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Iterable<String>? autofillHints;
  final String? Function(String?)? validator;
  final AppTextFieldVariant variant;
  final AppTextFieldSize size;
  final TextStyle? textStyle;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final TextStyle? errorStyle;
  final String? semanticLabel;
  final bool excludeFromSemantics;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final height = _getFieldHeight();
    final fontSize = _getFontSize();
    final contentPadding = _getContentPadding();

    final effectiveTextStyle = textStyle ??
        AppTextStyles.bodyMedium(context).copyWith(
          fontSize: fontSize,
          color: colorScheme.onSurface,
        );
    final effectiveLabelStyle = labelStyle ??
        AppTextStyles.labelMedium(context).copyWith(
          color: colorScheme.onSurfaceVariant,
        );
    final effectiveHintStyle = hintStyle ??
        AppTextStyles.bodyMedium(context).copyWith(
          fontSize: fontSize,
          color: colorScheme.onSurfaceVariant.withValues(alpha: 0.6),
        );
    final effectiveErrorStyle = errorStyle ??
        AppTextStyles.labelSmall(context).copyWith(
          color: colorScheme.error,
        );

    final hasError = errorText != null && errorText!.isNotEmpty;
    final effectiveBorderColor = hasError
        ? colorScheme.error
        : (enabled ? colorScheme.outline : colorScheme.outlineVariant);

    Widget field = TextFormField(
      controller: controller,
      focusNode: focusNode,
      style: effectiveTextStyle,
      readOnly: readOnly,
      obscureText: obscureText,
      enabled: enabled,
      maxLines: maxLines,
      minLines: minLines,
      maxLength: maxLength,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      autofillHints: autofillHints,
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
      onTap: onTap,
      onEditingComplete: onEditingComplete,
      validator: validator,
      decoration: InputDecoration(
        hintText: hint,
        helperText: helperText,
        errorText: errorText,
        prefixIcon: prefixIcon != null
            ? ExcludeSemantics(child: Icon(prefixIcon, size: 20))
            : null,
        suffixIcon: suffixIcon,
        labelStyle: effectiveLabelStyle,
        hintStyle: effectiveHintStyle,
        errorStyle: effectiveErrorStyle,
        errorMaxLines: 2,
        contentPadding: contentPadding,
        filled: variant == AppTextFieldVariant.filled,
        fillColor: variant == AppTextFieldVariant.filled
            ? (enabled
                ? colorScheme.surfaceContainerHighest
                : colorScheme.surfaceContainerHighest.withValues(alpha: 0.5))
            : null,
        border: _getBorder(colorScheme, effectiveBorderColor, hasError),
        enabledBorder: _getBorder(colorScheme, effectiveBorderColor, false),
        focusedBorder: _getBorder(colorScheme, colorScheme.primary, false),
        errorBorder: _getBorder(colorScheme, colorScheme.error, true),
        focusedErrorBorder: _getBorder(colorScheme, colorScheme.error, true),
        disabledBorder: _getBorder(colorScheme, colorScheme.outlineVariant, false),
      ),
    );

    Widget content = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Padding(
            padding: EdgeInsets.only(bottom: AppSpacing.xs),
            child: Text(
              label!,
              style: effectiveLabelStyle,
            ),
          ),
        ],
        SizedBox(
          height: height,
          child: field,
        ),
        if (helperText != null && errorText == null) ...[
          const SizedBox(height: AppSpacing.xs),
          Text(
            helperText!,
            style: AppTextStyles.labelSmall(context).copyWith(
              color: colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
            ),
          ),
        ],
        if (errorText != null) ...[
          const SizedBox(height: AppSpacing.xs),
          Text(
            errorText!,
            style: effectiveErrorStyle,
          ),
        ],
      ],
    );

    if (semanticLabel != null) {
      content = Semantics(
        label: semanticLabel!,
        textField: true,
        child: content,
      );
    }

    if (excludeFromSemantics) {
      content = ExcludeSemantics(child: content);
    }

    return content;
  }

  InputBorder _getBorder(ColorScheme colorScheme, Color color, bool hasError) {
    switch (variant) {
      case AppTextFieldVariant.filled:
      case AppTextFieldVariant.outlined:
        return OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          borderSide: BorderSide(
            color: color,
            width: variant == AppTextFieldVariant.outlined ? 1.5 : 1,
          ),
        );
      case AppTextFieldVariant.underlined:
        return UnderlineInputBorder(
          borderSide: BorderSide(color: color, width: 1),
        );
    }
  }

  double _getFieldHeight() {
    switch (size) {
      case AppTextFieldSize.small:
        return 40.0;
      case AppTextFieldSize.medium:
        return 48.0;
      case AppTextFieldSize.large:
        return 56.0;
    }
  }

  double _getFontSize() {
    switch (size) {
      case AppTextFieldSize.small:
        return 14.0;
      case AppTextFieldSize.medium:
        return 16.0;
      case AppTextFieldSize.large:
        return 18.0;
    }
  }

  EdgeInsetsGeometry _getContentPadding() {
    switch (size) {
      case AppTextFieldSize.small:
        return EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.xs);
      case AppTextFieldSize.medium:
        return EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.sm);
      case AppTextFieldSize.large:
        return EdgeInsets.symmetric(horizontal: AppSpacing.lg, vertical: AppSpacing.md);
    }
  }
}
