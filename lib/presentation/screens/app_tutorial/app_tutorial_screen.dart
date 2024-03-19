
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {

  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo({required this.title, required this.caption, required this.imageUrl});

}


final slides = <SlideInfo> [
  SlideInfo(title: 'Busca comida', caption: 'Veniam ad ut eiusmod ut excepteur Lorem in consectetur quis est pariatur dolore duis non.', imageUrl: 'assets/images/1.png' ),
  SlideInfo(title: 'Entrega rápida', caption: 'Cillum dolore occaecat proident sunt.', imageUrl: 'assets/images/2.png' ),
  SlideInfo(title: 'Disfruta la comida', caption: 'Adipisicing dolor occaecat incididunt mollit non fugiat anim ad consectetur ad.', imageUrl: 'assets/images/3.png' )
];



class AppTutorialScreen extends StatefulWidget {

  static const String name = 'tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {

final PageController pageviewContrtoller = PageController();
bool endReached = false;


@override
  void initState( ) {
    super.initState();


    pageviewContrtoller.addListener(() {
      final page = pageviewContrtoller.page ?? 0;
      if (!endReached && page >= (slides.length - 1.5)) {
        setState(() {
          endReached = true;
        });
      }
     });

  }

  @override
  void dispose() {
    pageviewContrtoller.dispose();
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageviewContrtoller,
            physics: const BouncingScrollPhysics(),
            children: slides.map(
              (slidesData) => _Slide(
                title: slidesData.title, 
                caption: slidesData.caption, 
                imageUrl: slidesData.imageUrl
                )
              ).toList(),
          ),

          Positioned(
            top: 50,
            right: 20,
            child: TextButton(
              onPressed: () => context.pop(), 
              child: Text('Skip'))
            ),

          endReached ?
          Positioned(
            bottom: 30,
            right: 30,
            child: FadeInRight(
              from: 15,
              delay: const Duration(seconds: 1),
              child: FilledButton(
                onPressed: () => context.pop(),
                child: const Text('Comenzar'),
              ),
            )
            ): const SizedBox()  

        ],
      ),
    );
  }
}


class _Slide extends StatelessWidget {

  final String title;
  final String caption;
  final String imageUrl;

  const _Slide({
    required this.title, required this.caption, required this.imageUrl
  });

  @override
  Widget build(BuildContext context) {

    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox(height: 20),
            Text(title, style: titleStyle,),
            const SizedBox(height: 10),
            Text(caption, style: captionStyle,),
          ],
        ),
      ),
    );
  }
}