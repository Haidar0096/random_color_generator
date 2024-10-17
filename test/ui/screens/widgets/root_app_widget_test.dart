import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:random_color_generator/ui/widgets/root_app_widget.dart';

void main() {
  testWidgets(
    'Color change test',
    (WidgetTester tester) async {
      const expectedInitialColor = Color(0xFF8F011C);
      const expectedChangedColor = Color(0xFFB37EC7);

      await tester.pumpWidget(const RootAppWidget());

      expect(find.text('Hello there'), findsOneWidget);
      expect(find.byType(Text), findsOneWidget);
      expect(find.byType(ColoredBox), findsOneWidget);
      final coloredBox = tester.widget<ColoredBox>(find.byType(ColoredBox));
      expect(coloredBox.color, expectedInitialColor);

      await tester.tap(find.byType(Text));
      await tester.pump();

      final coloredBoxAfterTap =
          tester.widget<ColoredBox>(find.byType(ColoredBox));
      expect(coloredBoxAfterTap.color, expectedChangedColor);
    },
  );
}
