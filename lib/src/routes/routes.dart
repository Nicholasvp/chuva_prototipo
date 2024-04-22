import 'package:chuva_prototipo/src/home/page/activity.dart';
import 'package:chuva_prototipo/src/home/page/calendar.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Calendar(),
    ),
    GoRoute(
        path: '/activiy',
        builder: (context, state) {
          Map<String, dynamic> activity = state.extra as Map<String, dynamic>;
          return Activity(
            activity: activity,
          );
        }),
  ],
);
