import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Timer? timer;
  PageController controller = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      int currentPage = controller.page!.toInt();
      int nextPage = currentPage + 1;
      if (nextPage > 4) {
        nextPage = 0;
      }

      controller.animateToPage(nextPage,
          duration: Duration(milliseconds: 400), curve: Curves.linear);
    });
  }

  @override
  void dispose() {
    controller.dispose(); // 메모리 누수 방지
    if (timer != null) {
      timer!.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark); // 상태바 색상
    return Scaffold(
        body: PageView(
      controller: controller,
      children: [
        Image.asset('asset/img/tommy.jpeg', fit: BoxFit.cover),
        Image.asset('asset/img/tommy.jpeg'),
        Image.asset('asset/img/tommy.jpeg'),
        Image.asset('asset/img/tommy.jpeg'),
        Image.asset('asset/img/tommy.jpeg')
      ],
    ));
  }
}
