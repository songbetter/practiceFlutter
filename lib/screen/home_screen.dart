import 'package:annieflutter/screen/datePicker/datePicker_main_screen.dart';
import 'package:annieflutter/screen/photoAlbum/photoAlbum_main_screen.dart';
import 'package:annieflutter/screen/random/random_main_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> icons = [
      {
        "color": Colors.lightGreen,
        "route": PhotoAlbumMainScreen(),
        "icon": Icons.photo_album,
        "title": "액자"
      },
      {
        "color": Colors.pinkAccent,
        "route": DatePickerMainScreen(),
        "icon": Icons.date_range,
        "title": "U & I"
      },
      {
        "color": Colors.orange,
        "route": RandomMainScreen(),
        "icon": Icons.workspaces_filled,
        "title": "랜덤숫자"
      },
    ];
    return Scaffold(
        body: Container(
            width: MediaQuery.of(context).size.width,
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(bottom: 32.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: icons
                                .asMap()
                                .entries
                                .map((icon) => Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: icon.value["color"]),
                                              shape: BoxShape.circle),
                                          child: IconButton(
                                            onPressed: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(builder:
                                                      (BuildContext context) {
                                                return icon.value["route"];
                                              }));
                                            },
                                            icon: Icon(icon.value["icon"]),
                                            color: icon.value["color"],
                                            iconSize: 50.0,
                                          ),
                                        ),
                                        Text(
                                          icon.value["title"],
                                          style: TextStyle(
                                              color: icon.value["color"],
                                              fontSize: 20.0),
                                        ),
                                      ],
                                    ))
                                .toList(),
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: icons
                            .asMap()
                            .entries
                            .map((icon) => Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: icon.value["color"]),
                                          shape: BoxShape.circle),
                                      child: IconButton(
                                        onPressed: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(builder:
                                                  (BuildContext context) {
                                            return icon.value["route"];
                                          }));
                                        },
                                        icon: Icon(icon.value["icon"]),
                                        color: icon.value["color"],
                                        iconSize: 50.0,
                                      ),
                                    ),
                                    Text(
                                      icon.value["title"],
                                      style: TextStyle(
                                          color: icon.value["color"],
                                          fontSize: 20.0),
                                    ),
                                  ],
                                ))
                            .toList(),
                      )
                    ]))));
  }
}
