import 'package:chuva_prototipo/src/home/controller/activity_controller.dart';
import 'package:flutter/material.dart';

class FavoriteButtom extends StatelessWidget {
  const FavoriteButtom({
    super.key,
    required this.controller,
  });

  final ActivityController controller;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (context, _) {
        return Container(
          padding: const EdgeInsets.all(10),
          child: ElevatedButton.icon(
            onPressed: () =>
                controller.isLoading ? null : controller.toggleFavorite(),
            style: ElevatedButton.styleFrom(
              alignment: Alignment.center,
              fixedSize: const Size(double.maxFinite, 40),
              backgroundColor:
                  controller.isLoading ? Colors.grey : Colors.blueAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            icon: controller.isLoading
                ? const Icon(
                    Icons.restart_alt_rounded,
                    color: Colors.white,
                  )
                : controller.favorited
                    ? const Icon(
                        Icons.star,
                        color: Colors.white,
                      )
                    : const Icon(
                        Icons.star_outline,
                        color: Colors.white,
                      ),
            label: controller.isLoading
                ? const Text(
                    'Caregando...',
                    style: TextStyle(color: Colors.white),
                  )
                : // Add this line
                Text(
                    controller.favorited
                        ? 'Remover da sua agenda'
                        : 'Adicionar à sua agenda',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
          ),
        );
      },
    );
  }
}
