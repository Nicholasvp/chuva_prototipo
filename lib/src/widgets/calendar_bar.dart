import 'package:chuva_prototipo/src/home/controller/home_controller.dart';
import 'package:chuva_prototipo/src/widgets/date_buttom.dart';
import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';

class CalendarBar extends StatelessWidget {
  const CalendarBar({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: fromCssColor('#3d5ddb'),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            color: Colors.white,
            child: Column(
              children: [
                Text(
                  controller.month,
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  controller.year,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          DateButtom(
            controller: controller,
            onTap: () {
              controller.changeDate(
                DateTime(2023, 11, 26),
              );
            },
            label: '26',
          ),
          const SizedBox(width: 10),
          DateButtom(
            controller: controller,
            onTap: () {
              controller.changeDate(
                DateTime(2023, 11, 27),
              );
            },
            label: '27',
          ),
          const SizedBox(width: 10),
          DateButtom(
            controller: controller,
            onTap: () {
              controller.changeDate(
                DateTime(2023, 11, 28),
              );
            },
            label: '28',
          ),
          const SizedBox(width: 10),
          DateButtom(
            controller: controller,
            onTap: () {
              controller.changeDate(
                DateTime(2023, 11, 29),
              );
            },
            label: '29',
          ),
          const SizedBox(width: 10),
          DateButtom(
            controller: controller,
            onTap: () {
              controller.changeDate(
                DateTime(2023, 11, 30),
              );
            },
            label: '30',
          ),
        ],
      ),
    );
  }
}
