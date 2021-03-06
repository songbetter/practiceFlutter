import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;
import 'package:annieflutter/const/agora.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class CamScreen extends StatefulWidget {
  const CamScreen({Key? key}) : super(key: key);

  @override
  State<CamScreen> createState() => _CamScreenState();
}

class _CamScreenState extends State<CamScreen> {
  RtcEngine? engine; // controller의 역할을 하는 것
  int? uid;
  int? otherUid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("LIVE"),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                engine?.switchCamera();
              },
              icon: Icon(Icons.switch_camera_outlined),
              iconSize: 30.0,
            )
          ],
        ),
        body: FutureBuilder(
            future: init(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              }

              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                      child: Stack(children: [
                    renderMainView(),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                          child: renderSubView(),
                          color: Colors.grey,
                          height: 160,
                          width: 120),
                    )
                  ])),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () async {
                          if (engine != null) {
                            await engine!.leaveChannel();
                          }
                          Navigator.of(context).pop();
                        },
                        child: Text("나가기")),
                  )
                ],
              );
            }));
  }

  Widget renderSubView() {
    if (otherUid == null) {
      return Center(
        child: Text(
          "대화 상대가 없습니다.",
          style: TextStyle(fontSize: 20.0),
        ),
      );
    } else {
      return RtcRemoteView.SurfaceView(
        uid: otherUid!,
        channelId: CHANNEL_NAME,
      );
    }
  }

  Widget renderMainView() {
    if (uid == null) {
      return Center(
        child: Text("채널에 입장해주세요"),
      );
    } else {
      return RtcLocalView.SurfaceView();
    }
  }

  Future<bool> init() async {
    final resp = await [Permission.camera, Permission.microphone].request();

    final cameraPermission = resp[Permission.camera];
    final microphonePermission = resp[Permission.microphone];

    if (cameraPermission != PermissionStatus.granted ||
        microphonePermission != PermissionStatus.granted) {
      throw '카메라 또는 마이크 권한이 없습니다.';
    }

    if (engine == null) {
      RtcEngineContext context = RtcEngineContext(APP_ID);

      engine = await RtcEngine.createWithContext(context);

      engine!.setEventHandler(RtcEngineEventHandler(
          joinChannelSuccess: (String channel, int uid, int elapsed) {
        print('채널에 입장했습니다. uid: $uid');
        setState(() {
          this.uid = uid;
        });
      }, leaveChannel: (state) {
        print("채널 퇴장");
        setState(() {
          uid = null;
        });
      }, userJoined: (int uid, int elapsed) {
        print('상대가 채널에 입장했습니다. uid : $uid');
        setState(() {
          otherUid = uid;
        });
      }, userOffline: (int uid, UserOfflineReason reason) {
        print('상대가 채널에서 나갔습니다. uid: $uid');
        setState(() {
          otherUid = null;
        });
      }));
      // 비디오 활성화
      await engine!.enableVideo();
      // 채널 들어가기
      // optionalUid int(0~) 0을 넣으면 자동으로 선정해준다.
      await engine!.joinChannel(TEMP_TOKEN, CHANNEL_NAME, null, 0);
    }

    return true;
  }
}
