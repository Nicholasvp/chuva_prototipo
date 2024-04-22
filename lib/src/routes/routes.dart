import 'package:chuva_prototipo/src/home/page/calendar.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    // GoRoute(
    //   path: '/',
    //   builder: (context, state) => const InitialPage(),
    // ),
    GoRoute(
      path: '/',
      builder: (context, state) => const Calendar(),
    ),
  ],
);
