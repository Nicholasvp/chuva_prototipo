import 'package:chuva_prototipo/src/domain/models/activity_model.dart';
import 'package:chuva_prototipo/src/home/controller/home_controller.dart';
import 'package:chuva_prototipo/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:go_router/go_router.dart';

class ListActivities extends StatelessWidget {
  const ListActivities({
    super.key,
    required this.activities,
  });

  final List<ActivityEntity?> activities;

  @override
  Widget build(BuildContext context) {
    Utils utils = Utils();
    return activities.isNotEmpty
        ? Expanded(
            child: ListView.builder(
              itemCount: activities.length,
              itemBuilder: (context, index) {
                final activity = activities[index];
                return InkWell(
                  onTap: () => context.push(
                    '/activity',
                    extra: activity.toMap(),
                  ),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      border: Border(
                        left: BorderSide(
                            color: fromCssColor(
                                activity!.category.color ?? '#767a79'),
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
                            utils.getLabel(activity),
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
                            utils.getPeople(activity),
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: fromCssColor('#767a79'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        : const Center(child: LinearProgressIndicator());
  }
}
