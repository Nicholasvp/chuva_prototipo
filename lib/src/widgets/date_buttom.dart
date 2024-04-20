import 'package:flutter/material.dart';

class DateButtom extends StatelessWidget {
  const DateButtom({
    super.key,
    required this.label,
    required this.onTap,
  });
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Text(
              label,
              style: const TextStyle(color: Colors.white),
            ),
          )),
    );
  }
}
