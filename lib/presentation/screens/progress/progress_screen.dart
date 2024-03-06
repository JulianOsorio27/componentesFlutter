import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  static const String name = 'progress_screen';

  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Indicators '),
      ),
      body: const _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          SizedBox(height: 30),
          Text('Circular Progress Indicator'),
          SizedBox(height: 10),
          CircularProgressIndicator(
            backgroundColor: Colors.black38,
          ),
          SizedBox(height: 30),
          Text('Circular y Linear Progress Indicator Controlado'),
          SizedBox(height: 10),
          __ControlledProgressIndicator()
        ],
      ),
    );
  }
}

class __ControlledProgressIndicator extends StatelessWidget {
  const __ControlledProgressIndicator();

  @override
  Widget build(BuildContext context) {
    // Este widget se ejecuta en tiempo de ejecución
    return StreamBuilder(
      // Esta asociado a stream: Que es un flujo de informacion en este caso de forma periodica
      // Cada periodo de tiempo va a emitir un valor segun que
      stream: Stream.periodic(const Duration(milliseconds: 300), (value) {
        return (value * 2) / 100; // 0.0 1.0
        // Toma valores hasta que el value sea menor que 100
      }).takeWhile((value) => value < 100),
      builder: (context, snapshot) {

        final progressValue = snapshot.data ?? 0;

        return  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                value: progressValue,
                strokeWidth: 2,
                backgroundColor: Colors.black12,
              ),
              const SizedBox(
                width: 20,
              ),
              // Este widget toma todo el espacio disponible que le de el padre
              Expanded(
                child: LinearProgressIndicator(
                value: progressValue,
              ))
            ],
          ),
        );
      },
    );
  }
}
