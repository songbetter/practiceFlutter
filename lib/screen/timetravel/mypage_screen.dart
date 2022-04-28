import 'package:annieflutter/screen/timetravel/chatList_screen.dart';
import 'package:flutter/material.dart';

class MypageScreen extends StatefulWidget {
  const MypageScreen({Key? key}) : super(key: key);

  @override
  State<MypageScreen> createState() => _MypageScreenState();
}

class _MypageScreenState extends State<MypageScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: Icon(
              Icons.display_settings,
              color: Colors.black,
              size: 28.0,
            ),
          )
        ],
        backgroundColor: Colors.grey[200],
        elevation: 0,
      ),
      backgroundColor: Colors.grey[200],
      drawerScrimColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.question_answer), label: "Chat"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Like"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "mypage"),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
        child: selectedIndex == 0 ? _ProfileScreen() : ChatListScreen(),
      ),
    );
  }

  List<Widget> WidgetOptions = [_ProfileScreen(), ChatListScreen()];
}

class _ProfileScreen extends StatelessWidget {
  const _ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: Colors.green[900],
          padding: const EdgeInsets.symmetric(vertical: 26.0, horizontal: 30.0),
          child: Row(
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text("프로필 수정"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                ),
              ),
              SizedBox(
                width: 40.0,
              ),
              SizedBox(
                width: 170.0,
                child: Text(
                  "프로필을 완성하고 더 많은 사람을 만나보세요.",
                  style: TextStyle(fontSize: 14.0),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            "Tommy",
            style: TextStyle(color: Colors.black, fontSize: 20.0),
          ),
        ),
        Container(
          color: Colors.teal,
          height: 330.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_left),
                iconSize: 60.0,
                onPressed: () {},
                color: Colors.white,
              ),
              IconButton(
                icon: Icon(Icons.arrow_right),
                iconSize: 60.0,
                onPressed: () {},
                color: Colors.white,
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              "3/6 of profile images",
              style: TextStyle(color: Colors.black, fontSize: 14.0),
            ),
          ),
        ),
        Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 6.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.cake),
                      SizedBox(
                        width: 8.0,
                      ),
                      Text(
                        "22",
                        style: TextStyle(color: Colors.black, fontSize: 14.0),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.person),
                      SizedBox(
                        width: 8.0,
                      ),
                      Text(
                        "Women",
                        style: TextStyle(color: Colors.black, fontSize: 14.0),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.height),
                      SizedBox(
                        width: 8.0,
                      ),
                      Text(
                        "170cm",
                        style: TextStyle(color: Colors.black, fontSize: 14.0),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined),
                      SizedBox(
                        width: 8.0,
                      ),
                      Text(
                        "Seoul",
                        style: TextStyle(color: Colors.black, fontSize: 14.0),
                      ),
                    ],
                  )
                ],
              ),
              Row(children: [
                Icon(Icons.book),
                SizedBox(
                  width: 13.0,
                ),
                Text(
                  "전자공학과 졸업",
                  style: TextStyle(color: Colors.black, fontSize: 14.0),
                ),
              ]),
              Row(children: [
                Icon(Icons.school),
                SizedBox(
                  width: 13.0,
                ),
                Text(
                  "서울대하교",
                  style: TextStyle(color: Colors.black, fontSize: 14.0),
                ),
              ])
            ],
          ),
        ),
      ],
    );
  }
}
