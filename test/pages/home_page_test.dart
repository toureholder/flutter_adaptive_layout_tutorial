import 'package:adaptive_layout/adaptive_layout.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_adaptive_layout_tutorial/pages/movie_detail_page.dart';
import 'package:flutter_adaptive_layout_tutorial/pages/home_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../test_util/test_util.dart';

void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized()
          as TestWidgetsFlutterBinding;

  group('HomePage', () {
    final testableWiget = makeTestableWidget(subject: HomePage());

    testWidgets('is created', (WidgetTester tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(testableWiget);

        expect(find.byType(HomePage), findsOneWidget);
      });
    });

    group('on small screens', () {
      setUp(() {
        binding.window.physicalSizeTestValue = Size(
          AdaptiveLayout.getBreakpoints().mediumScreenMinWidth - 10,
          500,
        );

        binding.window.devicePixelRatioTestValue = 1.0;
      });

      testWidgets('navigates to detail screen when item is tapped',
          (WidgetTester tester) async {
        await mockNetworkImagesFor(() async {
          await tester.pumpWidget(testableWiget);

          final listItem = find.byKey(Key('list_item_0'));
          await tester.tap(listItem);

          // The fact that we have to call the WidgetTester `pumpAndSettle`
          // method for this test to pass gives me confidence that the
          // `MovieDetailView` is only found after navigation.
          await tester.pumpAndSettle();

          expect(find.byType(MovieDetailView), findsOneWidget);
        });
      });
    });

    group('on large screens', () {
      setUp(() {
        binding.window.physicalSizeTestValue = Size(
          AdaptiveLayout.getBreakpoints().largeScreenMinWidth + 10,
          500,
        );

        binding.window.devicePixelRatioTestValue = 1.0;
      });

      testWidgets('navigates to detail screen when item is tapped',
          (WidgetTester tester) async {
        await mockNetworkImagesFor(() async {
          await tester.pumpWidget(testableWiget);

          final listItem = find.byKey(Key('list_item_0'));
          await tester.tap(listItem);

          // The fact that this test passes without the need to call the
          // WidgetTester `pumpAndSettle` method gives me confidence that the
          // `MovieDetailView` is found without navigation.
          await tester.pump();

          expect(find.byType(MovieDetailView), findsOneWidget);
        });
      });
    });
  });
}
