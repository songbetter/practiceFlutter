import 'package:annieflutter/screen/timetravel/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({Key? key}) : super(key: key);

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Chat",
          style: TextStyle(color: Colors.black, fontSize: 22.0),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.grey[200],
            padding: const EdgeInsets.symmetric(vertical: 21.0),
          ),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => ChatScreen()));
          },
          child: Row(children: [
            Expanded(
              flex: 1,
              child: SizedBox(
                  width: 67.0,
                  height: 67.0,
                  child: Image.asset(
                    'asset/img/tommy.jpeg',
                  )),
            ),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "TO-MMY",
                    style: TextStyle(fontSize: 20.0, color: Colors.black),
                  ),
                  Text(
                    "나랑 별보러 가지 않을래",
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        overflow: TextOverflow.ellipsis),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Text("8:00 PM",
                  style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                      fontWeight: FontWeight.normal)),
            ),
          ]),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.grey[200],
            padding: const EdgeInsets.symmetric(vertical: 21.0),
          ),
          onPressed: () {},
          child: Row(children: [
            Expanded(
              flex: 1,
              child: SizedBox(
                  width: 67.0,
                  height: 67.0,
                  child: Image.asset('asset/img/tommy.jpeg')),
            ),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "TO-MMY",
                    style: TextStyle(fontSize: 20.0, color: Colors.black),
                  ),
                  Text(
                    "나랑 별보러 가지 않을래",
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        overflow: TextOverflow.ellipsis),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Text("8:00 PM",
                  style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                      fontWeight: FontWeight.normal)),
            ),
          ]),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.grey[200],
            padding: const EdgeInsets.symmetric(vertical: 21.0),
          ),
          onPressed: () {},
          child: Row(children: [
            Expanded(
              flex: 1,
              child: SizedBox(
                  width: 67.0,
                  height: 67.0,
                  child: Image.asset('asset/img/tommy.jpeg')),
            ),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "TO-MMY",
                    style: TextStyle(fontSize: 20.0, color: Colors.black),
                  ),
                  Text(
                    "나랑 별보러 가지 않을래",
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        overflow: TextOverflow.ellipsis),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Text("8:00 PM",
                  style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                      fontWeight: FontWeight.normal)),
            ),
          ]),
        ),
      ],
    );
  }
}
