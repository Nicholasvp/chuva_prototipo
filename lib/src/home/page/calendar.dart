import 'package:chuva_prototipo/src/home/controller/home_controller.dart';

import 'package:chuva_prototipo/src/widgets/calendar_bar.dart';
import 'package:chuva_prototipo/src/widgets/home_app_bar.dart';

import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';

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
                  Expanded(
                    child: ListView.builder(
                      itemCount: controller.activities.length,
                      itemBuilder: (context, index) {
                        final activity = controller.activities[index]!;
                        return Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                            border: Border(
                              left: BorderSide(
                                  color: fromCssColor(
                                      activity.category.color ?? '#767a79'),
                                  width: 8),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 2,
                                offset: const Offset(0, 1),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.getLabel(activity),
                                  textAlign: TextAlign.start,
                                ),
                                Text(
                                  activity.title,
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  controller.getPeople(activity),
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: fromCssColor('#767a79'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
