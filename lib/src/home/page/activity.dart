import 'package:chuva_prototipo/src/domain/models/activity_model.dart';
import 'package:chuva_prototipo/src/home/controller/activity_controller.dart';
import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:go_router/go_router.dart';

class Activity extends StatelessWidget {
  const Activity({super.key, required this.activity});
  final Map<String, dynamic> activity;

  @override
  Widget build(BuildContext context) {
    final controller = ActivityController();
    ActivityEntity activityEntity = ActivityEntity.fromRoute(activity);
    return Scaffold(
      appBar: AppBar(
          elevation: 5,
          centerTitle: true,
          backgroundColor: fromCssColor('#4975b1'),
          title: Text(
            'Chuva 💜 Flutter',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20,
                color: fromCssColor('#ffffff'),
                fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
            onPressed: () => context.pop(),
          )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            color: fromCssColor(activityEntity.category.color ?? '#ffffff'),
            width: double.maxFinite,
            child: Text(
              activityEntity.category.title,
              style: const TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            activityEntity.title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const SizedBox(width: 10),
              const Icon(Icons.access_time_rounded),
              const SizedBox(width: 10),
              Text(controller.getStart(activityEntity))
            ],
          ),
          Row(
            children: [
              const SizedBox(width: 10),
              const Icon(Icons.location_on_rounded),
              const SizedBox(width: 10),
              Text(activityEntity.locations),
            ],
          ),
          const Text('Maputo'),
          const Text('Astrofísica e Cosmologia'),
          ElevatedButton.icon(
            onPressed: () {},
            icon: controller.favorited
                ? const Icon(Icons.star)
                : const Icon(Icons.star_outline),
            label: Text(controller.favorited
                ? 'Remover da sua agenda'
                : 'Adicionar à sua agenda'),
          )
        ],
      ),
    );
  }
}
