import 'package:annieflutter/layout/main_layout.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return MainLayout(
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          foregroundColor: Colors.white,
          title: Row(
            children: [
              SizedBox(
                  width: 40.0,
                  height: 40.0,
                  child: Image.asset(
                    'asset/img/tommy.jpeg',
                  )),
              Column(
                children: [Text("Tommy")],
              )
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.video_call,
                        size: 40.0,
                        color: Colors.white,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.call_outlined,
                        size: 40.0,
                        color: Colors.white,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.info_outline,
                        size: 40.0,
                        color: Colors.white,
                      ))
                ],
              ),
            ),
          ],
        ),
        children: []);
  }
}
