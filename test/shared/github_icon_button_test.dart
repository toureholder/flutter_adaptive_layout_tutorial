import 'package:flutter_adaptive_layout_tutorial/main.dart';
import 'package:flutter_adaptive_layout_tutorial/shared/github_icon_button.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../test_util/test_util.dart';

void main() {
  group('GitHubIconButton', () {
    // No need to over complicate things trying to spy on url_launcher methods.
    // Just tap the button to get test coverage.
    testWidgets('tapping github action doesn\'t blow anything up',
        (WidgetTester tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(makeTestableWidget(subject: MyApp()));

        final githubButton = find.byType(GitHubIconButton);

        await tester.tap(githubButton);
      });
    });
  });
}
