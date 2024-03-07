import 'package:flutter/material.dart';

class SnackBarScreen extends StatelessWidget {
  static const String name = 'snackbar_screen';

  const SnackBarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {

    // Eliminacion los snackbar para que se oculten al dar click sobre si mismo 
    ScaffoldMessenger.of(context).clearSnackBars();

    // Busca el Scaffold más cercano y le pasa la información necesitada con el context
    final snackbar = SnackBar(
      content: const Text('Hola mundo!!'),
      action: SnackBarAction(label: 'Ok!', onPressed: () {}) ,
      duration: const Duration(seconds: 5),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y Diálogos'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}
