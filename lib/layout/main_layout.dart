import 'package:flutter/material.dart';

class MainLayout extends StatelessWidget {
  final AppBar appBar;
  final List<Widget> children;

  const MainLayout({required this.appBar, required this.children, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar,
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: children))));
  }
}
