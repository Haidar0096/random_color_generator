import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:random_color_generator/services/dependency_injection/dependency_injection.dart';
import 'package:random_color_generator/services/environments/environment.dart';
import 'package:random_color_generator/ui/widgets/root_app_widget.dart';

import '../../../utils/mocks.dart';

void main() {
  setUp(
    () {
      final storage = MockStorage();
      when(
        () => storage.write(any(), any<dynamic>()),
      ).thenAnswer(
        // ignore: no_empty_block
        (_) async {},
      );
      HydratedBloc.storage = storage;
    },
  );

  testWidgets(
    'Color change test',
    (WidgetTester tester) async {
      TestWidgetsFlutterBinding.ensureInitialized();

      await ServiceProvider.init(environment: const ProductionEnvironment());

      const expectedInitialColor = Colors.blue;
      const expectedChangedColor = Color(0xFF47C12B);

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
