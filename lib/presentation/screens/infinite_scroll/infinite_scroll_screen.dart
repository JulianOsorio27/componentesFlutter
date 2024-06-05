import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const String name = 'infinite_screen';

  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  List<int> imagesIds = [1, 2, 3, 4, 5];
  bool isloading = false;
  bool isMounted = true;

  ScrollController scrollControler = ScrollController();

  @override
  void initState() {
    super.initState();

    scrollControler.addListener(() {
      if ((scrollControler.position.pixels + 500 >=
          scrollControler.position.maxScrollExtent)) {
        // Load next image
        loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    scrollControler.dispose();
    isMounted = false;
    super.dispose();
  }

// Función que carga las siguientes imagenes
  Future loadNextPage() async {
    if (isloading) return;

    isloading = true;

    setState(() {});

    await Future.delayed(const Duration(seconds: 2));

    addFiveImages();
    isloading = false;
    // Revisamos si el componnete o widget esta montado
    if (!isMounted) return;

    setState(() {});

   moveScrollToBottom();
  }

  // Refrezca las imagenes
  Future<void> onRefresh() async {
    isloading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 3));
    if (!isMounted) return;

    isloading = false;
    final lastId = imagesIds.last;
    imagesIds.clear();
    imagesIds.add(lastId + 1);
    addFiveImages();

    setState(() {});
    
  }

  void moveScrollToBottom() {
    if (scrollControler.position.pixels + 150 <=
        scrollControler.position.maxScrollExtent) return;

    scrollControler.animateTo(scrollControler.position.pixels + 120,
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn);
  }

  void addFiveImages() {
    final lastId = imagesIds.last;

    imagesIds.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: RefreshIndicator(
          onRefresh: onRefresh,
          edgeOffset: 5,
          strokeWidth: 2,
          child: ListView.builder(
            controller: scrollControler,
            itemCount: imagesIds.length,
            itemBuilder: (context, index) {
              return FadeInImage(
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 300,
                  placeholder:
                      const AssetImage('assets/images/jar-loading.gif'),
                  image: NetworkImage(
                      'https://picsum.photos/id/${imagesIds[index]}/500/300'));
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        child: isloading
            ? SpinPerfect(
                infinite: true, child: const Icon(Icons.refresh_outlined))
            : FadeIn(child: const Icon(Icons.arrow_back_ios_new_outlined)),
      ),
    );
  }
}
