import 'dart:math';

import 'package:flutter/material.dart';

class PracticeScreen extends StatefulWidget {
  const PracticeScreen({Key? key}) : super(key: key);

  @override
  State<PracticeScreen> createState() => _PracticeScreenState();
}

class _PracticeScreenState extends State<PracticeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: StreamBuilder(
        // 기존의 데이터를 캐싱.
        stream: streamNumbers(),
        builder: (context, snapshot) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "StreamBuilder",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20.0,
                  color: Colors.black),
            ),
            Text(
              "State: ${snapshot.connectionState}",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 20.0,
                  color: Colors.black),
            ),
            Text(
              "Data: ${snapshot.data}",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 20.0,
                  color: Colors.black),
            ),
            Text(
              "Error: ${snapshot.error}",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 20.0,
                  color: Colors.black),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {});
                },
                child: Text("setState"))
          ],
        ),
      ),
    ));
  }

  Future<int> getNumber() async {
    await Future.delayed(Duration(seconds: 3));
    final random = Random();

    // throw Exception("에러가 발생했습니다.");
    return random.nextInt(100);
  }

  Stream<int> streamNumbers() async* {
    for (int i = 0; i < 10; i++) {
      await Future.delayed(Duration(seconds: 1));
      yield i;
    }
  }
}
