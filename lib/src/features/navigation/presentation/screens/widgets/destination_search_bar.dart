/// SAFENAV CAVITE - Destination Search Bar
///
/// Search bar widget for finding navigation destinations.
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../shared/widgets/widgets.dart';

/// Search bar for navigation destinations
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
                hintText: 'Search buildings, locations...',
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

  void _handleVoiceSearch() {
    // TODO: Implement voice search
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Voice search coming soon')),
    );
  }
}