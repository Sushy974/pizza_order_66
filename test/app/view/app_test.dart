import 'package:flutter_test/flutter_test.dart';
import 'package:pizza_order_66/app/app.dart';
import 'package:pizza_order_66/counter/counter.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(CounterPage), findsOneWidget);
    });
  });
}
