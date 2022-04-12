import 'package:annieflutter/layout/main_layout.dart';
import 'package:flutter/material.dart';

class PracticeScreen extends StatelessWidget {
  const PracticeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(title: "Annie App", children: [
      ElevatedButton(
        onPressed: () {},
        child: Text("ElevatedButton"),
        style: ElevatedButton.styleFrom(
            primary: Colors.pinkAccent,
            onPrimary: Colors.black,
            shadowColor: Colors.green,
            elevation: 30.0,
            padding: EdgeInsets.all(16.0),
            side: BorderSide(color: Colors.black, width: 4.0)),
      ),
      OutlinedButton(
        onPressed: () {},
        child: Text("OutlinedButton"),
        style: OutlinedButton.styleFrom(
            primary: Colors.green,
            backgroundColor: Colors.yellow,
            elevation: 10.0),
      ),
      TextButton(
        onPressed: () {},
        child: Text("TextButton"),
        style: TextButton.styleFrom(primary: Colors.blue),
      )
    ]);
  }
}
