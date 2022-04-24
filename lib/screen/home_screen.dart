import 'package:annieflutter/screen/datePicker/datePicker_main_screen.dart';
import 'package:annieflutter/screen/map/map_main_screen.dart';
import 'package:annieflutter/screen/photoAlbum/photoAlbum_main_screen.dart';
import 'package:annieflutter/screen/practice_screen.dart';
import 'package:annieflutter/screen/random/random_main_screen.dart';
import 'package:annieflutter/screen/videoCall/videoCall_main_screen.dart';
import 'package:annieflutter/screen/vidoePlayer/videoPlayer_main_screen.dart';
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
      {
        "color": Colors.lightGreen,
        "route": VideoPlayerMainScreen(),
        "icon": Icons.play_circle_fill,
        "title": "동영상"
      },
      {
        "color": Colors.pinkAccent,
        "route": MapMainScreen(),
        "icon": Icons.map,
        "title": "지도"
      },
      {
        "color": Colors.orange,
        "route": VideoCallMainScreen(),
        "icon": Icons.video_call,
        "title": "영상통화"
      },
      {
        "color": Colors.lightGreen,
        "route": PhotoAlbumMainScreen(),
        "icon": Icons.schedule,
        "title": "스케쥴러"
      },
      {
        "color": Colors.pinkAccent,
        "route": DatePickerMainScreen(),
        "icon": Icons.foggy,
        "title": "미세먼지"
      },
      {
        "color": Colors.orange,
        "route": PracticeScreen(),
        "icon": Icons.settings,
        "title": "설정"
      },
    ];
    return Scaffold(
        appBar: AppBar(title: Text("Annie App")),
        body: Container(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(bottom: 32.0),
                          child: _Row(rowList: icons.sublist(0, 3))),
                      Padding(
                          padding: const EdgeInsets.only(bottom: 32.0),
                          child: _Row(rowList: icons.sublist(3, 6))),
                      _Row(rowList: icons.sublist(6, 9))
                    ]))));
  }
}

class _Row extends StatelessWidget {
  final List<Map<String, dynamic>> rowList;

  const _Row({required this.rowList, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: rowList
          .asMap()
          .entries
          .map((icon) => Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: icon.value["color"]),
                        shape: BoxShape.circle),
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context) {
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
                    style:
                        TextStyle(color: icon.value["color"], fontSize: 20.0),
                  ),
                ],
              ))
          .toList(),
    );
  }
}
