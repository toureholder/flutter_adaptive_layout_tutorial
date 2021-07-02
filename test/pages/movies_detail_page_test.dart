import 'package:flutter_adaptive_layout_tutorial/model/movie.dart';
import 'package:flutter_adaptive_layout_tutorial/pages/movie_detail_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../test_util/test_util.dart';

void main() {
  group('MovieDetailPage', () {
    testWidgets('is created', (WidgetTester tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          makeTestableWidget(
            subject: MovieDetailPage(
              Movie(
                id: 1,
                title: 'any title',
                overview: 'any overview',
                posterPath: '/path.jpg',
              ),
            ),
          ),
        );

        expect(find.byType(MovieDetailPage), findsOneWidget);
      });
    });
  });
}
