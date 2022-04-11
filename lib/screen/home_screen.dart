import 'dart:math';

import 'package:annieflutter/constant/color.dart';
import 'package:annieflutter/screen/settings_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int maxNumber = 1000;
  List<int> randomNumbers = [123, 456, 789];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: Container(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _Header(onPressed: onSettingsPop),
                _Body(randomNumbers: randomNumbers),
                _Footer(onPressed: onPressedCreateButton),
              ],
            ),
          )),
    );
  }

  void onPressedCreateButton() {
    final rand = Random();

    final Set<int> newNumbers = {}; // 중복 리스트를 없애기 위해 List 대신 Set 사용

    while (newNumbers.length != 3) {
      // 3개의 숫자가 모두 나올 수 있도록, for 대신 while 루프 사용
      final number = rand.nextInt(maxNumber); // 최대값: 1000

      newNumbers.add(number);
    }

    setState(() {
      randomNumbers = newNumbers.toList();
    });
  }

  void onSettingsPop() async {
    final result = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return SettingsScreen(maxNumber: maxNumber);
    }));

    if (result != null) {
      setState(() {
        maxNumber = result;
      });
    }
  }
}

class _Header extends StatelessWidget {
  final VoidCallback onPressed;

  const _Header({required this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "랜덤숫자 생성기",
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        ),
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            Icons.settings,
            color: Colors.red,
          ),
        )
      ],
    );
  }
}

class _Body extends StatelessWidget {
  final List<int> randomNumbers;

  const _Body({required this.randomNumbers, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: randomNumbers
              .map((x) =>
                  Text(x.toString(), style: TextStyle(color: Colors.white)))
              .toList()),
    );
  }
}

class _Footer extends StatelessWidget {
  final VoidCallback onPressed;

  const _Footer({required this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Colors.red),
          onPressed: onPressed,
          child: Text(
            "생성하기",
          ),
        ));
  }
}
