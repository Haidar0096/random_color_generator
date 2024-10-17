import 'package:random_color_generator/main_common.dart';
import 'package:random_color_generator/services/environments/environments.dart';

Future<void> main() async {
  // run the app with the development environment
  await mainCommon(const DevelopmentEnvironment());
}
