// Importamos la liberia de math
import 'dart:math' show Random;

import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {
  static const String name = 'animated';

  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double width = 50;
  double height = 50;
  Color color = Colors.indigo;
  double borderRadius = 10.0;

  // Método para general datos aleatorios para que se cambie de forma nuestro contenedor

  void changeStatus() {
    final random = Random();

    width = random.nextInt(300) + 120;
    height = random.nextInt(300) + 120;
    borderRadius = random.nextInt(300) + 20;

    color = Color.fromRGBO(
        random.nextInt(255) , // Red
        random.nextInt(255) , // Green
        random.nextInt(255) , // Blue
        1 // Opacity
      );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.elasticOut,
          width: width <= 0 ? 0 : width ,
          height: height  <= 0 ? 0 : height,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(borderRadius < 0 ? 0 : borderRadius )),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: changeStatus,
        child: const Icon(Icons.play_arrow_rounded),
      ),
    );
  }
}
