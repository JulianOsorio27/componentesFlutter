import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {

  static const String name = 'buttons_screen';

  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Screen'),
      ),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: () { 
          // Volvemos a la pantalla anterior
          context.pop();
         },
        
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {

    final colors =Theme.of(context).colorScheme;


    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          spacing: 15,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: const Text('Elevated')),
            const ElevatedButton(onPressed: null, child: Text('Elevated Disable')),
            ElevatedButton.icon(onPressed: () {
              
            }, icon: const Icon(Icons.accessibility_sharp),
             label: const Text('Elevated Icon')),

             FilledButton(onPressed: () {
               
             }, child: const Text('Filled')),

             FilledButton.icon(onPressed: () {} ,
              icon: const Icon(Icons.scale_outlined),
              label: const Text('Filled Icon')),

              OutlinedButton(onPressed: () {},
               child: const Text('Outline')),

              OutlinedButton.icon(onPressed: () {},
               icon: const Icon(Icons.add_moderator_sharp),
              label: const Text('Outline Icon')), 

              TextButton(onPressed: () {}, child: const Text('Text')),
              TextButton.icon(onPressed: () {}, 
              icon: const Icon(Icons.workspaces), 
              label: const Text('Text Icon')),

              // TODO: Custom button

              IconButton(onPressed: () {}, icon: const Icon(Icons.app_registration_rounded)),

              IconButton(onPressed: () {},
               icon: const Icon(Icons.webhook),
               style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(colors.primary),
                iconColor: const MaterialStatePropertyAll( Colors.white )
               ),
                )


          ],
        ),
      ),
    );
  }
}