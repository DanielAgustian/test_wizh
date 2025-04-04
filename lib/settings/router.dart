import 'package:go_router/go_router.dart';
import 'package:test_wizh/data/model/trips_model.dart';
import 'package:test_wizh/screen/details/detail_screen.dart';
import 'package:test_wizh/screen/list/list_screen.dart';
import 'package:test_wizh/screen/splash_screen.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(
    path: "/",
    builder: (context, state) => const SplashScreen(),
  ),
  GoRoute(
    path: "/list",
    builder: (context, state) => ListScreen(),
  ),
  GoRoute(
    path: "/list/detail",
  
    builder: (context, state) {
      final data = state.extra as TripsModel;
      return DetailScreen(model: data);
    },
  ),
]);
