import 'package:go_router/go_router.dart';
import 'package:test_wizh/screen/detail_screen.dart';
import 'package:test_wizh/screen/list_screen.dart';
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
    path: "/list/:id",
    redirect: (context, state) {
      final id = state.pathParameters["id"];
      if (id == null || int.tryParse(id) == null) {
        return "/list";
      }
      return null;
    },
    builder: (context, state) {
      final id = state.pathParameters["id"];
      int truId = int.parse(id!);
      return DetailScreen(id: truId);
    },
  ),
]);
