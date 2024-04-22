import 'package:chuva_prototipo/src/home/controller/home_controller.dart';
import 'package:flutter/material.dart';

class DateButtom extends StatelessWidget {
  const DateButtom({
    super.key,
    required this.label,
    required this.onTap,
    required this.controller,
  });
  final String label;
  final VoidCallback onTap;
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Text(
              label,
              style: TextStyle(
                  color: controller.day == label ? Colors.white : Colors.grey),
            ),
          )),
    );
  }
}
