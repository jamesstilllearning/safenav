import 'package:material_ui/material_ui.dart';

import '../../data/models/campus_plan_reference.dart';
import '../../data/services/campus_plan_reference_service.dart';

class CampusPlanReferenceView extends StatefulWidget {
  final VoidCallback onClose;
  final CampusPlanData? planData;

  const CampusPlanReferenceView({
    super.key,
    required this.onClose,
    this.planData,
  });

  @override
  State<CampusPlanReferenceView> createState() =>
      _CampusPlanReferenceViewState();
}

class _CampusPlanReferenceViewState extends State<CampusPlanReferenceView> {
  late Future<CampusPlanData> _data;
  final _search = TextEditingController();
  String _query = '';
  CampusPlanReference? _selected;

  @override
  void initState() {
    super.initState();
    _data = widget.planData == null
        ? CampusPlanReferenceService().load()
        : Future.value(widget.planData);
  }

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ColoredBox(
      color: colors.surface,
      child: SafeArea(
        child: FutureBuilder<CampusPlanData>(
          future: _data,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return _loadError(context, snapshot.error);
            }
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            final data = snapshot.data!;
            return LayoutBuilder(
              builder: (context, constraints) => constraints.maxWidth >= 900
                  ? _wideLayout(context, data)
                  : _compactLayout(context, data),
            );
          },
        ),
      ),
    );
  }

  Widget _loadError(BuildContext context, Object? error) => Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.map_outlined, size: 44),
          const SizedBox(height: 12),
          const Text('Campus reference map is unavailable'),
          const SizedBox(height: 8),
          Text('$error', textAlign: TextAlign.center),
          TextButton(
            onPressed: () =>
                setState(() => _data = CampusPlanReferenceService().load()),
            child: const Text('Retry'),
          ),
          TextButton(
            onPressed: widget.onClose,
            child: const Text('Back to live map'),
          ),
        ],
      ),
    ),
  );

  Widget _header(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 6, 12, 8),
      child: Row(
        children: [
          IconButton(
            onPressed: widget.onClose,
            tooltip: 'Back to live map',
            icon: const Icon(Icons.arrow_back),
          ),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'EARIST Cavite · Master site plan',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                Text(
                  'Reference illustration · Not for navigation',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.north_east,
            semanticLabel: 'North points upper-right in source plan',
          ),
          const SizedBox(width: 4),
          const Text('N'),
        ],
      ),
    );
  }

  Widget _planImage() => LayoutBuilder(
    builder: (context, constraints) => ClipRect(
      child: InteractiveViewer(
        key: const Key('masterPlanInteractiveViewer'),
        minScale: 0.7,
        maxScale: 5,
        boundaryMargin: const EdgeInsets.all(80),
        child: SizedBox(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          child: Image.asset(
            'assets/maps/earist_master_site_plan.png',
            key: const Key('masterPlanImage'),
            fit: BoxFit.contain,
            errorBuilder: (context, error, stack) => const Center(
              child: Text('Master plan image could not be loaded.'),
            ),
          ),
        ),
      ),
    ),
  );

  Widget _wideLayout(BuildContext context, CampusPlanData data) => Column(
    children: [
      _header(context),
      Expanded(
        child: Row(
          children: [
            Expanded(flex: 7, child: _planImage()),
            SizedBox(
              width: 370,
              child: _directory(context, data, expanded: true),
            ),
          ],
        ),
      ),
      _legend(context),
    ],
  );

  Widget _compactLayout(BuildContext context, CampusPlanData data) => Column(
    children: [
      _header(context),
      Expanded(child: _planImage()),
      _legend(context),
      Padding(
        padding: const EdgeInsets.fromLTRB(12, 6, 12, 12),
        child: SizedBox(
          width: double.infinity,
          child: FilledButton.icon(
            onPressed: () => _showDirectory(context, data),
            icon: const Icon(Icons.search),
            label: Text(
              _selected == null
                  ? 'Search buildings and facilities'
                  : 'Selected: ${_selected!.displayName}',
            ),
          ),
        ),
      ),
      if (_selected != null) _selectionSummary(context, _selected!),
    ],
  );

  Widget _directory(
    BuildContext context,
    CampusPlanData data, {
    bool expanded = false,
  }) {
    final query = _query.trim().toLowerCase();
    final entries = data.entries
        .where(
          (entry) =>
              query.isEmpty ||
              entry.id.toLowerCase().contains(query) ||
              entry.displayName.toLowerCase().contains(query) ||
              entry.labelAsVisible.toLowerCase().contains(query) ||
              entry.planStatus.toLowerCase().contains(query),
        )
        .toList();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: TextField(
            controller: _search,
            onChanged: (value) => setState(() => _query = value),
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: 'Search plan labels',
              border: OutlineInputBorder(),
              isDense: true,
            ),
          ),
        ),
        Expanded(
          child: entries.isEmpty
              ? const Center(child: Text('No plan labels match this search.'))
              : ListView.separated(
                  itemCount: entries.length,
                  separatorBuilder: (_, __) => const Divider(height: 1),
                  itemBuilder: (context, index) {
                    final entry = entries[index];
                    return Material(
                      color: Colors.transparent,
                      child: ListTile(
                        selected: _selected?.id == entry.id,
                        leading: _statusDot(entry.legendCategory),
                        title: Text(
                          entry.displayName,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        subtitle: Text(
                          '${entry.id} · ${entry.isFacilityAnnotation ? 'Plan annotation' : 'Building label'}',
                        ),
                        onTap: () => setState(() => _selected = entry),
                      ),
                    );
                  },
                ),
        ),
        if (_selected != null) _selectionDetails(context, _selected!),
      ],
    );
  }

  void _showDirectory(BuildContext context, CampusPlanData data) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (context) => SafeArea(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.78,
          child: _directory(context, data, expanded: true),
        ),
      ),
    );
  }

  Widget _selectionSummary(BuildContext context, CampusPlanReference entry) =>
      Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
        child: Text(
          '${entry.id} · ${entry.legendCategory}',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      );

  Widget _selectionDetails(BuildContext context, CampusPlanReference entry) =>
      Container(
        constraints: const BoxConstraints(maxHeight: 300),
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                entry.displayName,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              _detail(
                context,
                entry.isFacilityAnnotation ? 'Record ID' : 'Building ID',
                entry.id,
              ),
              _detail(context, 'Plan status', entry.planStatus),
              _detail(context, 'Category', entry.legendCategory),
              _detail(context, 'Relative location', entry.relativePosition),
              _detail(
                context,
                'Verification',
                'Plan label only; current physical status not verified',
              ),
              _detail(context, 'Identification confidence', entry.confidence),
              _detail(
                context,
                'Source',
                'EARIST CAVITE Master Site.png · ${entry.evidence}',
              ),
              if (entry.notes != null) _detail(context, 'Notes', entry.notes!),
              _detail(
                context,
                'Coordinates',
                'Unavailable (null); no geographic location assigned',
              ),
            ],
          ),
        ),
      );

  Widget _detail(BuildContext context, String label, String value) => Padding(
    padding: const EdgeInsets.only(top: 5),
    child: Text('$label: $value', style: Theme.of(context).textTheme.bodySmall),
  );

  Widget _legend(BuildContext context) => SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    child: Row(
      children: [
        for (final category in _categoryColors.keys)
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _statusDot(category),
                const SizedBox(width: 5),
                Text(category, style: Theme.of(context).textTheme.labelSmall),
              ],
            ),
          ),
      ],
    ),
  );

  Widget _statusDot(String category) => Container(
    width: 14,
    height: 14,
    decoration: BoxDecoration(
      color: _categoryColors[category],
      border: Border.all(color: Colors.black54),
    ),
  );

  static const _categoryColors = <String, Color>{
    'Proposed projects': Color(0xFFF39B21),
    'Ongoing construction / repair': Color(0xFF35C4CF),
    'Completed / existing': Color(0xFF9D0B12),
    'Recently accomplished projects': Color(0xFFE52585),
    'Proposed road access': Color(0xFFFFF3A4),
    'Proposed pathway': Color(0xFFF05A24),
  };
}
