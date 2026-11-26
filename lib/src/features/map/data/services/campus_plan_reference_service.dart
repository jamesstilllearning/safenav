import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/campus_plan_reference.dart';

class CampusPlanReferenceService {
  static const assetPath = 'assets/data/campus_buildings.json';

  Future<CampusPlanData> load({AssetBundle? bundle}) async {
    final contents = await (bundle ?? rootBundle).loadString(assetPath, cache: false);
    final decoded = jsonDecode(contents);
    if (decoded is! Map<String, dynamic>) {
      throw const FormatException(
        'Campus plan reference must be a JSON object.',
      );
    }
    return CampusPlanData.fromJson(decoded);
  }
}
