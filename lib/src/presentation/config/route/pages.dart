import 'package:get/get.dart';

import '../../global_widgets/splash_screend.dart';
import '../../modules/home/home_screen.dart';
import 'routes.dart';

/// Keeps the available routes of app.
final List<GetPage> pages = [
  GetPage(
    name: Routes.home.value,
    page: () => const HomeScreen(),
    transition: Transition.zoom,
  ),
  GetPage(
    name: Routes.splash.value,
    page: () => const SplashScreen(),
    transition: Transition.zoom,
  ),
];
