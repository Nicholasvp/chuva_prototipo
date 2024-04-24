import 'package:chuva_prototipo/src/home/controller/home_controller.dart';

import 'package:chuva_prototipo/src/widgets/calendar_bar.dart';
import 'package:chuva_prototipo/src/widgets/home_app_bar.dart';
import 'package:chuva_prototipo/src/widgets/list_acitivities.dart';

import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:go_router/go_router.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  final controller = HomeController();

  @override
  void initState() {
    controller.loading();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchActivities();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: Center(
        child: ListenableBuilder(
          listenable: controller,
          builder: (context, _) {
            return Column(
              children: [
                CalendarBar(controller: controller),
                if (controller.isLoading)
                  const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                else
                  ListActivities(activities: controller.activitiesByDay),
              ],
            );
          },
        ),
      ),
    );
  }
}
