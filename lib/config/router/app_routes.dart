import 'package:go_router/go_router.dart';

final appRoutes = GoRouter(
  redirect: (context, state) {
    if (state == '/login') {
      return '/login';
    } else {
      return '/home';
    }
  },
  initialLocation: '/',
  routes: [],
);
