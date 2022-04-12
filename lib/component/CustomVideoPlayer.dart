import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class CustomVideoPlayer extends StatefulWidget {
  final XFile video; // ImagePlcker에서만 사용하는 File type
  final VoidCallback onNewVideoPressed;

  const CustomVideoPlayer(
      {required this.video, required this.onNewVideoPressed, Key? key})
      : super(key: key);

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  VideoPlayerController? videoController;
  Duration currentPosition = Duration();
  bool showControls = false;

  @override
  void initState() {
    super.initState();

    initializeController(); // initState는 async를 사용할 수 없다.
  }

  @override
  void didUpdateWidget(covariant CustomVideoPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.video.path != widget.video.path) {
      initializeController();
    }
  }

  initializeController() async {
    currentPosition - Duration(); // resetPosition

    videoController = VideoPlayerController.file(File(widget.video.path));

    await videoController!.initialize();

    videoController!.addListener(() {
      final currentPosition = videoController!.value.position;

      setState(() {
        this.currentPosition = currentPosition;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (videoController == null) {
      return CircularProgressIndicator();
    }
    return AspectRatio(
        aspectRatio: videoController!.value.aspectRatio,
        child: GestureDetector(
          onTap: () {
            setState(() {
              showControls = !showControls;
            });
          },
          child: Stack(
            children: [
              VideoPlayer(videoController!),
              if (showControls)
                _Controls(
                    onReversePressed: onReversePressed,
                    onPlayPressed: onPlayPressed,
                    onForwardPressed: onForwardPressed,
                    isPlaying: videoController!.value.isPlaying),
              if (showControls) _NewVideo(onPressed: widget.onNewVideoPressed),
              _SliderButton(
                  onSliderChanged: onSliderChanged,
                  currentPosition: currentPosition,
                  maxPosition: videoController!.value.duration)
            ],
          ),
        ));
  }

  void onSliderChanged(double val) {
    // setState(() {
    //   currentPosition = Duration(seconds: val.toInt());
    // });
    videoController!.seekTo(Duration(seconds: val.toInt()));
  }

  void onReversePressed() {
    final currentPosition = videoController!.value.position;

    Duration position = Duration();

    if (currentPosition.inSeconds > 3) {
      position = currentPosition - Duration(seconds: 3);
    }

    videoController!.seekTo(position);
  }

  void onPlayPressed() {
    setState(() {
      if (videoController!.value.isPlaying) {
        videoController!.pause();
      } else {
        videoController!.play();
      }
    });
  }

  void onForwardPressed() {
    final maxPosition = videoController!.value.duration;
    final currentPosition = videoController!.value.position;

    Duration position = maxPosition;

    if ((maxPosition - Duration(seconds: 3)).inSeconds >
        currentPosition.inSeconds) {
      position = currentPosition + Duration(seconds: 3);
    }

    videoController!.seekTo(position);
  }
}

class _Controls extends StatelessWidget {
  final VoidCallback onReversePressed;
  final VoidCallback onPlayPressed;
  final VoidCallback onForwardPressed;
  final bool isPlaying;

  const _Controls(
      {required this.onForwardPressed,
      required this.onPlayPressed,
      required this.onReversePressed,
      required this.isPlaying,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          renderIconButton(
              onPressed: onReversePressed, iconData: Icons.rotate_left),
          renderIconButton(
              onPressed: onPlayPressed,
              iconData: isPlaying ? Icons.pause : Icons.play_arrow),
          renderIconButton(
              onPressed: onForwardPressed, iconData: Icons.rotate_right)
        ]);
  }

  Widget renderIconButton({
    required VoidCallback onPressed,
    required IconData iconData,
  }) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(iconData),
      color: Colors.white,
      iconSize: 30.0,
    );
  }
}

class _NewVideo extends StatelessWidget {
  final VoidCallback onPressed;

  const _NewVideo({required this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(Icons.photo_camera_back),
        color: Colors.white,
        iconSize: 30.0,
      ),
    );
  }
}

class _SliderButton extends StatelessWidget {
  final ValueChanged<double> onSliderChanged;
  final Duration currentPosition;
  final Duration maxPosition;

  const _SliderButton(
      {required this.onSliderChanged,
      required this.currentPosition,
      required this.maxPosition,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Row(
        children: [
          renderPadLeftText(position: currentPosition),
          Slider(
              value: currentPosition.inSeconds.toDouble(),
              onChanged: onSliderChanged,
              max: maxPosition.inSeconds.toDouble(),
              min: 0),
          renderPadLeftText(position: maxPosition),
        ],
      ),
    );
  }

  Widget renderPadLeftText({required Duration position}) {
    return Text(
      '${position.inMinutes}:${(position.inSeconds % 60).toString().padLeft(2, '0')}',
      style: TextStyle(fontSize: 20.0),
    );
  }
}
