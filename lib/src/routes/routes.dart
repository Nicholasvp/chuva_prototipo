import 'package:chuva_prototipo/src/home/page/activity.dart';
import 'package:chuva_prototipo/src/home/page/calendar.dart';
import 'package:chuva_prototipo/src/home/page/people_page.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Calendar(),
    ),
    GoRoute(
      path: '/activity',
      builder: (context, state) {
        Map<String, dynamic> activity = state.extra as Map<String, dynamic>;
        return Activity(
          activity: activity,
        );
      },
    ),
    GoRoute(
      path: '/activity/people',
      builder: (context, state) {
        Map<String, dynamic> people = state.extra as Map<String, dynamic>;
        return PeoplePage(
          people: people,
        );
      },
    ),
  ],
);
