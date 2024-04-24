import 'package:chuva_prototipo/src/domain/models/people_model.dart';
import 'package:flutter/material.dart';

class PeopleHeader extends StatelessWidget {
  const PeopleHeader({
    super.key,
    required this.peopleModel,
  });

  final PeopleModel peopleModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage(peopleModel.picture ??
              'https://cdn-icons-png.freepik.com/256/1077/1077114.png'),
        ),
        const SizedBox(width: 20),
        Flexible(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                peopleModel.name,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                peopleModel.institution ?? '',
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
