import 'package:go_router/go_router.dart';
import 'package:test_wizh/screen/splash_screen.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(
    path: "/",
    builder: (context, state) => const SplashScreen(),
  )
]);
