/// SAFENAV CAVITE - Campus safety graph service.
///
/// Loads the draft floor-plan graph (campus_graph_draft.json) from the app's
/// asset bundle.
library;

import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/campus_graph.dart';

/// Loads the campus safety graph from the bundled draft JSON fixture.
class CampusGraphService {
  CampusGraphService._();

  static final CampusGraphService _instance = CampusGraphService._();
  static CampusGraphService get instance => _instance;

  /// Asset path of the draft floor-plan graph fixture.
  static const String _assetPath = 'assets/data/campus_graph_draft.json';

  CampusGraph? _graph;

  /// Loads and parses the draft graph fixture.
  ///
  /// Pass [assetPath] to load a different file (useful in tests); otherwise
  /// the bundled `assets/data/campus_graph_draft.json` is used and cached.
  Future<CampusGraph> load({String? assetPath}) async {
    final path = assetPath ?? _assetPath;
    if (_graph != null && assetPath == null) {
      return _graph!;
    }
    final jsonString = await rootBundle.loadString(path);
    final Map<String, dynamic> json = jsonDecode(jsonString);
    final graph = CampusGraph.fromJson(json);
    if (assetPath == null) {
      _graph = graph;
    }
    return graph;
  }

  /// Clear the cached graph (useful in tests).
  void clearCache() {
    _graph = null;
  }
}
