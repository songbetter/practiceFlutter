import 'package:annieflutter/component/CustomVideoPlayer.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class VideoPlayerMainScreen extends StatefulWidget {
  const VideoPlayerMainScreen({Key? key}) : super(key: key);

  @override
  State<VideoPlayerMainScreen> createState() => _VideoPlayerMainScreenState();
}

class _VideoPlayerMainScreenState extends State<VideoPlayerMainScreen> {
  XFile? video;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: video == null ? renderEmpty() : renderVideo());
  }

  Widget renderVideo() {
    return Center(
        child: CustomVideoPlayer(
      video: video!,
      onNewVideoPressed: onNewVideoPressed,
    ));
  }

  Widget renderEmpty() {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: getBoxDecoration(),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          _Logo(onTap: onNewVideoPressed),
          const SizedBox(height: 20.0),
          const _Title()
        ]));
  }

  void onNewVideoPressed() async {
    final video = await ImagePicker().pickVideo(source: ImageSource.gallery);

    if (video != null) {
      // 비디오를 골랐을 때
      setState(() {
        this.video = video;
      });
    }
  }

  BoxDecoration getBoxDecoration() {
    return const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF2A3A7C), Colors.pinkAccent]));
  }
}

class _Logo extends StatelessWidget {
  final VoidCallback onTap;

  const _Logo({required this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.play_circle_fill_outlined),
      iconSize: 200.0,
      onPressed: onTap,
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(fontWeight: FontWeight.w100, fontSize: 30.0);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "VIDEO",
          style: textStyle,
        ),
        Text("PLAYER", style: textStyle.copyWith(fontWeight: FontWeight.w700))
      ],
    );
  }
}
