import 'package:chuva_prototipo/src/domain/models/activity_model.dart';
import 'package:chuva_prototipo/src/home/controller/activity_controller.dart';
import 'package:chuva_prototipo/src/widgets/favorite_buttom.dart';
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
      body: SingleChildScrollView(
        child: Column(
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
                const Icon(
                  Icons.access_time_rounded,
                  color: Colors.blue,
                ),
                const SizedBox(width: 10),
                Text(controller.getStart(activityEntity))
              ],
            ),
            Row(
              children: [
                const SizedBox(width: 10),
                const Icon(
                  Icons.location_on_rounded,
                  color: Colors.blue,
                ),
                const SizedBox(width: 10),
                Text(activityEntity.locations),
              ],
            ),
            FavoriteButtom(controller: controller),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                  controller.extractContent(activityEntity.description ?? '') ??
                      ''),
            ),
            const SizedBox(
              height: 30,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: activityEntity.listPeopleModel.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => context.push(
                    '/activity/people',
                    extra: activityEntity.listPeopleModel[index]?.toMap(),
                  ),
                  child: ListTile(
                    title: Text(activityEntity.listPeopleModel[index]!.name),
                    subtitle: Text(
                        activityEntity.listPeopleModel[index]?.institution ??
                            ''),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(activityEntity
                              .listPeopleModel[index]?.picture ??
                          'https://cdn-icons-png.freepik.com/256/1077/1077114.png'),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
