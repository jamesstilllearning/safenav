import 'package:flutter/gestures.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:safenav_cavite/src/features/map/data/services/campus_plan_reference_service.dart';
import 'package:safenav_cavite/src/features/map/presentation/widgets/campus_plan_reference_view.dart';

void main() {
  testWidgets(
    'reference map loads, searches and displays selected source details',
    (tester) async {
      tester.view.physicalSize = const Size(1200, 900);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      final planData = await CampusPlanReferenceService().load();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CampusPlanReferenceView(onClose: () {}, planData: planData),
          ),
        ),
      );
      await tester.pump(const Duration(seconds: 1));

      expect(
        find.byKey(const Key('masterPlanInteractiveViewer')),
        findsOneWidget,
      );
      expect(
        find.text('Reference illustration · Not for navigation'),
        findsOneWidget,
      );
      expect(find.text('Proposed projects'), findsOneWidget);

      final image = find.byKey(const Key('masterPlanImage'));
      final beforePan = tester.getRect(image);
      await tester.drag(image, const Offset(50, 30));
      await tester.pump(const Duration(milliseconds: 100));
      final afterPan = tester.getRect(image);
      expect((afterPan.left - beforePan.left).abs(), greaterThan(10));
      final beforeZoomWidth = afterPan.width;
      final center = tester.getCenter(image);
      final leftTouch = await tester.createGesture(
        pointer: 1,
        kind: PointerDeviceKind.touch,
      );
      final rightTouch = await tester.createGesture(
        pointer: 2,
        kind: PointerDeviceKind.touch,
      );
      await leftTouch.down(center.translate(-10, 0));
      await rightTouch.down(center.translate(10, 0));
      await tester.pump();
      await leftTouch.moveTo(center.translate(-40, 0));
      await rightTouch.moveTo(center.translate(40, 0));
      await tester.pump(const Duration(milliseconds: 100));
      await leftTouch.up();
      await rightTouch.up();
      await tester.pump();
      expect(tester.getRect(image).width, greaterThan(beforeZoomWidth));

      await tester.enterText(find.byType(TextField), 'building_003');
      await tester.pump();
      await tester.tap(find.text('EXISTING CANTEEN STALLS').first);
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.textContaining('Building ID: building_003'), findsOneWidget);
      expect(
        find.textContaining('Coordinates: Unavailable (null)'),
        findsOneWidget,
      );
      expect(
        find.textContaining('current physical status not verified'),
        findsOneWidget,
      );
      await tester.pumpWidget(const SizedBox.shrink());
      await tester.pump(const Duration(milliseconds: 500));
    },
  );

  testWidgets('compact layout opens searchable building directory', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    final planData = await CampusPlanReferenceService().load();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CampusPlanReferenceView(onClose: () {}, planData: planData),
        ),
      ),
    );
    await tester.pump(const Duration(seconds: 1));
    await tester.tap(find.text('Search buildings and facilities'));
    await tester.pump(const Duration(milliseconds: 500));

    expect(find.byType(TextField), findsOneWidget);
    await tester.enterText(find.byType(TextField), 'building_016');
    await tester.pump();
    expect(find.text('building_016'), findsOneWidget);
    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump(const Duration(milliseconds: 500));
  });
}
