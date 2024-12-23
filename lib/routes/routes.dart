import 'package:get/get.dart';
import '../screens/welcome_screen.dart';

class Routes {
  static const String welcome = '/welcome';
  static const String splash = '/';
  static const String login = '/login';
  static const String home = '/home';
}

final List<GetPage> routes = [
  GetPage(
    name: Routes.welcome,
    page: () => const WelcomeScreen(),
  ),
  GetPage(
    name: Routes.splash,
    page: () => const SplashScreen(),
  ),
  GetPage(
    name: Routes.home,
    page: () => const HomeScreen(),
    binding: HomeBinding(),
  ),
  GetPage(
    name: Routes.login,
    page: () => const LoginScreen(),
  ),
];
