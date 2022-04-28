import 'package:annieflutter/layout/main_layout.dart';
import 'package:flutter/material.dart';

class AnswerScreen extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final VoidCallback doneEvent;

  const AnswerScreen(
      {required this.title,
      required this.children,
      required this.doneEvent,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
        appBar: AppBar(
          backgroundColor: Colors.white,
          shadowColor: Colors.black,
          foregroundColor: Colors.black,
          title: Text(title),
          actions: [
            TextButton(
                child: Text("완료"),
                onPressed: () {
                  Navigator.of(context).pop();
                  doneEvent;
                }),
          ],
        ),
        children: children);
  }
}
