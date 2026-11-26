/// A label recorded from the uncalibrated EARIST Cavite master site plan.
///
/// These records are reference illustration data. They intentionally have no
/// geographic or local geometry and must not be used for routing.
class CampusPlanReference {
  final String id;
  final String? officialName;
  final String labelAsVisible;
  final String planStatus;
  final String relativePosition;
  final String confidence;
  final String evidence;
  final String? notes;
  final String? source;
  final bool isFacilityAnnotation;

  const CampusPlanReference({
    required this.id,
    required this.officialName,
    required this.labelAsVisible,
    required this.planStatus,
    required this.relativePosition,
    required this.confidence,
    required this.evidence,
    required this.notes,
    required this.source,
    required this.isFacilityAnnotation,
  });

  String get displayName => officialName ?? labelAsVisible;

  /// The six categories shown in the master plan legend.
  String get legendCategory {
    final status = planStatus.toLowerCase();
    if (status.contains('proposed road access')) return 'Proposed road access';
    if (status.contains('proposed pathway') ||
        status.contains('proposed pathwalk')) {
      return 'Proposed pathway';
    }
    if (status.contains('recently accomplished') ||
        status.contains('rehabilitated')) {
      return 'Recently accomplished projects';
    }
    if (status.contains('on-going') ||
        status.contains('on going') ||
        status.contains('repair/improvement')) {
      return 'Ongoing construction / repair';
    }
    if (status.contains('existing') || status.contains('completed')) {
      return 'Completed / existing';
    }
    return 'Proposed projects';
  }

  bool get coordinatesAvailable => false;

  factory CampusPlanReference.fromJson(
    Map<String, dynamic> json, {
    required bool isFacilityAnnotation,
  }) {
    return CampusPlanReference(
      id: json['id'] as String? ?? 'unknown',
      officialName: json['official_name'] as String?,
      labelAsVisible:
          json['label_as_visible'] as String? ??
          json['observed_text'] as String? ??
          'Unclear label',
      planStatus: json['plan_status'] as String? ?? 'unknown plan status',
      relativePosition:
          json['relative_position'] as String? ??
          'Relative position unavailable in source data.',
      confidence:
          json['identification_confidence'] as String? ??
          json['confidence'] as String? ??
          'unknown',
      evidence:
          json['evidence'] as String? ??
          json['notes'] as String? ??
          'No source note available.',
      notes: json['notes'] as String?,
      source: json['source'] as String?,
      isFacilityAnnotation: isFacilityAnnotation,
    );
  }
}

class CampusPlanData {
  final String source;
  final String planTitle;
  final String northArrow;
  final String coordinatePolicy;
  final List<CampusPlanReference> entries;
  final List<Map<String, dynamic>> landmarks;
  final List<Map<String, dynamic>> pathwayClasses;

  const CampusPlanData({
    required this.source,
    required this.planTitle,
    required this.northArrow,
    required this.coordinatePolicy,
    required this.entries,
    required this.landmarks,
    required this.pathwayClasses,
  });

  factory CampusPlanData.fromJson(Map<String, dynamic> json) {
    final buildings = (json['buildings'] as List<dynamic>? ?? const [])
        .whereType<Map<String, dynamic>>()
        .map(
          (item) => CampusPlanReference.fromJson(
            item,
            isFacilityAnnotation: (item['id'] as String? ?? '').startsWith(
              'facility_',
            ),
          ),
        );
    final annotations =
        (json['facility_project_targets'] as List<dynamic>? ?? const [])
            .whereType<Map<String, dynamic>>()
            .map(
              (item) => CampusPlanReference.fromJson(
                item,
                isFacilityAnnotation: true,
              ),
            );

    // Older inventory revisions store project targets in `buildings` already.
    // Keep identifiers unique and do not synthesize missing records.
    final byId = <String, CampusPlanReference>{};
    for (final item in [...buildings, ...annotations]) {
      byId[item.id] = item;
    }

    return CampusPlanData(
      source:
          json['source'] as String? ?? 'Master site plan (source unspecified)',
      planTitle: json['plan_title'] as String? ?? 'Campus reference plan',
      northArrow:
          (json['orientation'] as Map<String, dynamic>?)?['north_arrow']
              as String? ??
          'Orientation unavailable.',
      coordinatePolicy:
          json['coordinate_policy'] as String? ??
          'No geographic coordinates are available.',
      entries: byId.values.toList(growable: false),
      landmarks: (json['landmarks'] as List<dynamic>? ?? const [])
          .whereType<Map<String, dynamic>>()
          .toList(growable: false),
      pathwayClasses: (json['pathway_classes'] as List<dynamic>? ?? const [])
          .whereType<Map<String, dynamic>>()
          .toList(growable: false),
    );
  }
}
