// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_adaptive_layout_tutorial/main.dart';
import 'package:flutter_adaptive_layout_tutorial/shared/github_icon_button.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

import 'test_util/test_util.dart';

void main() {
  group('MyApp', () {
    testWidgets('is created', (WidgetTester tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(makeTestableWidget(subject: MyApp()));

        expect(find.byType(MyApp), findsOneWidget);
      });
    });

    testWidgets('has github button', (WidgetTester tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(makeTestableWidget(subject: MyApp()));

        expect(find.byType(GitHubIconButton), findsOneWidget);
      });
    });
  });
}
