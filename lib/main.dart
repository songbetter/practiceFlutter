import 'package:annieflutter/screen/home_screen.dart';
import 'package:flutter/material.dart';

const ROUTE_HOME = '/';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: "NotoSansKR",
          textTheme: const TextTheme(
              headline1: TextStyle(
                  color: Colors.white,
                  fontSize: 70.0,
                  fontWeight: FontWeight.bold),
              headline2: TextStyle(color: Colors.white, fontSize: 25.0),
              bodyText1: TextStyle(color: Colors.white, fontSize: 20.0),
              bodyText2: TextStyle(
                  color: Colors.white,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold))),
      // home: const HomeScreen(),
      initialRoute: ROUTE_HOME,
      routes: {
        ROUTE_HOME: (context) => HomeScreen(),
      }));
}
