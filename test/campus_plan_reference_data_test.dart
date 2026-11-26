import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:safenav_cavite/src/features/map/data/services/campus_plan_reference_service.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test(
    'loads the documented 20 reference identifiers without coordinates',
    () async {
      final data = await CampusPlanReferenceService().load();

      expect(data.entries, hasLength(20));
      expect(
        data.entries.map((entry) => entry.id),
        containsAll([
          for (var index = 1; index <= 16; index++)
            'building_${index.toString().padLeft(3, '0')}',
          for (var index = 17; index <= 20; index++)
            'facility_${index.toString().padLeft(3, '0')}',
        ]),
      );
      expect(
        data.entries.every((entry) => !entry.coordinatesAvailable),
        isTrue,
      );
    },
  );

  test('preserves clipped names and current status uncertainty', () async {
    final data = await CampusPlanReferenceService().load();
    final partial = data.entries.firstWhere(
      (entry) => entry.id == 'building_011',
    );
    final existing = data.entries.firstWhere(
      (entry) => entry.id == 'building_003',
    );

    expect(partial.officialName, isNull);
    expect(partial.labelAsVisible, contains('…'));
    expect(existing.planStatus, contains('current status unverified'));
    expect(existing.legendCategory, 'Completed / existing');
  });

  test(
    'missing inventory data produces an empty, non-geographic reference',
    () async {
      final data = await CampusPlanReferenceService().load(
        bundle: _TestAssetBundle('{}'),
      );
      expect(data.entries, isEmpty);
      expect(data.northArrow, 'Orientation unavailable.');
    },
  );
}

class _TestAssetBundle extends CachingAssetBundle {
  final String contents;

  _TestAssetBundle(this.contents);

  @override
  Future<ByteData> load(String key) async =>
      ByteData.sublistView(Uint8List.fromList(contents.codeUnits));
}
