import 'package:get/get.dart';

class Routes {
  static String splash = '/';
  static String login = '/login';
  static String home = '/home';
}

final List<GetPage> routes = [
  GetPage(
    name: Routes.splash,
    page: () => const SplashScreen(),
  ),
  GetPage(
    name: Routes.home,
    page: () => const HomeScreen(),
    binding: HomeBinding(),
  ),
];
