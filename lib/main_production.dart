import 'package:random_color_generator/main_common.dart';
import 'package:random_color_generator/services/environments/environment.dart';

Future<void> main() async {
  // run the app with the production environment
  await mainCommon(const ProductionEnvironment());
}
