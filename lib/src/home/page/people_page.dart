import 'package:chuva_prototipo/src/domain/models/people_model.dart';
import 'package:chuva_prototipo/src/home/controller/people_controller.dart';
import 'package:chuva_prototipo/src/widgets/list_acitivities.dart';
import 'package:chuva_prototipo/src/widgets/people_header.dart';
import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:go_router/go_router.dart';

class PeoplePage extends StatefulWidget {
  const PeoplePage({super.key, required this.people});
  final Map<String, dynamic> people;

  @override
  State<PeoplePage> createState() => _PeoplePageState();
}

class _PeoplePageState extends State<PeoplePage> {
  @override
  Widget build(BuildContext context) {
    PeopleModel peopleModel = PeopleModel.fromRoute(widget.people);
    final controller = PeopleController();

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
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PeopleHeader(peopleModel: peopleModel),
            const SizedBox(height: 20),
            if (peopleModel.bio != null)
              const Text(
                'Bio',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            const SizedBox(height: 10),
            Text(
              controller.extractContent(peopleModel.bio),
            ),
            const SizedBox(height: 20),
            const Text(
              'Atividades',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 20),
            ListenableBuilder(
              listenable: controller,
              builder: (context, _) {
                controller.filterActivitiesByPeople(peopleModel);
                return ListActivities(activities: controller.filterActivities);
              },
            )
          ],
        ),
      ),
    );
  }
}
