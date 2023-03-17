import 'package:get/get.dart';

const String splashScreen = '/';
const String homeScreen = '/home';

List<GetPage> routes() => [
      GetPage(
        name: splashScreen,
        page: () => const SplashScreen(),
      ),
      GetPage(
        name: homeScreen,
        page: () => const HomeScreen(),
      ),
    ];
