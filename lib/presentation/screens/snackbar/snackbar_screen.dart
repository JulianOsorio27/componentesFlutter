import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackBarScreen extends StatelessWidget {
  static const String name = 'snackbar_screen';

  const SnackBarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    // Eliminacion los snackbar para que se oculten al dar click sobre si mismo
    ScaffoldMessenger.of(context).clearSnackBars();

    // Busca el Scaffold más cercano y le pasa la información necesitada con el context
    // final snackbar = SnackBar(
    //   content: const Text('Hola mundo!!'),
    //   action: SnackBarAction(label: 'Ok!', onPressed: () {}) ,
    //   duration: const Duration(seconds: 5),
    // );

    final snackbar = SnackBar(
      content: const Column(
        children: [
          CircleAvatar(
            // Se usa para colocar imagenes
            backgroundImage: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRyOpeH2UOhsdsPTlg-UCxw-BqOCoW3kbIx4Q&usqp=CAU'),
            maxRadius: 70,
          ),
          SizedBox(height: 20),
          Text('Muchas Gracias Afición Esto es Para Vosotros'),
        ],
      ),
      action: SnackBarAction(label: 'SIIIIIUUUUUU!', onPressed: () {}),
      duration: const Duration(seconds: 10),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  // Metodo para realizar un dialogo
  void openDialog ( BuildContext context ){
    showDialog(
      context: context, 
      // Obliga al usuario a dar click sobre una opción
      barrierDismissible: false,
      builder: (context) =>  AlertDialog(
        title: const Text('¿Estás Seguro?'),
        content: const Text( 'Anim reprehenderit duis excepteur adipisicing commodo pariatur reprehenderit deserunt. Id aliqua adipisicing nisi sint culpa. Consectetur esse Lorem nulla fugiat cupidatat culpa ipsum elit velit ullamco pariatur aliqua. Commodo excepteur occaecat eu laborum amet irure ea eiusmod culpa esse enim sit excepteur.' ),
        actions: [
          TextButton(onPressed: () => context.pop(), child: const Text('Cancelar') ),
          FilledButton(onPressed: () => context.pop(), child: const Text('Aceptar') ),
        ],
      ) ,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y Diálogos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            FilledButton.tonal(
                onPressed: () {
                  // Mostrar las licencias que usa flutter
                  showAboutDialog(context: context, children: [
                    const Column(
                      children: [
                        CircleAvatar(
                          // Se usa para colocar imagenes
                          backgroundImage: NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTK976XiG_e11RnwWAmCwwnRtQnXvv2zCCtMbE43rHdfatHwLzWFrr47aEiFLoF7G7GLbs&usqp=CAU'),
                          maxRadius: 70,
                        ),
                        SizedBox(height: 20),
                        Text('Anda pa allá BOBO '),
                      ],
                    ),
                  ]);
                },
                child: const Text('Licencias Usadas')
              ),
            FilledButton.tonal(
                onPressed: () => openDialog(context),
                child: const Text('Mostrar Diálogo')),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}
