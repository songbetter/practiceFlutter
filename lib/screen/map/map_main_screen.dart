import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapMainScreen extends StatefulWidget {
  const MapMainScreen({Key? key}) : super(key: key);

  @override
  State<MapMainScreen> createState() => _MapMainScreenState();
}

class _MapMainScreenState extends State<MapMainScreen> {
  bool isChecked = false;
  GoogleMapController? mapController;

  static final LatLng companyLatLng =
      LatLng(37.34147198864791, 127.28906872785737);
  static final CameraPosition initialPosition =
      CameraPosition(target: companyLatLng, zoom: 15);

  static final double okdistance = 100;
  static final Circle withinDistanceCircle = Circle(
      circleId: CircleId('withinCircle'),
      center: companyLatLng,
      fillColor: Colors.blue.withOpacity(0.5),
      radius: okdistance,
      // 지름
      strokeColor: Colors.blue,
      // 둘레
      strokeWidth: 1);

  static final Circle notWithinDistanceCircle = withinDistanceCircle.copyWith(
    strokeColorParam: Colors.red,
    fillColorParam: Colors.red.withOpacity(0.5),
  );

  static final Circle checkedCircle = withinDistanceCircle.copyWith(
    strokeColorParam: Colors.green,
    fillColorParam: Colors.green.withOpacity(0.5),
  );

  static final Marker marker =
      Marker(markerId: MarkerId("marker"), position: companyLatLng);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: renderAppBar(),
        body: FutureBuilder<String>(
            future: checkPermission(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.data == "위치 권한이 허가 되었습니다.") {
                return StreamBuilder<Position>(
                    stream:
                        Geolocator.getPositionStream(), // position이 바뀔때마다 실행
                    builder: (context, snapshot) {
                      bool isWithinRange = false;

                      if (snapshot.hasData) {
                        final start = snapshot.data!;
                        final end = companyLatLng;

                        final distance = Geolocator.distanceBetween(
                            start.latitude,
                            start.longitude,
                            end.latitude,
                            end.longitude);

                        if (distance < okdistance) {
                          isWithinRange = true;
                        }
                      }

                      return Column(
                        children: [
                          _GoogleMap(
                            initialPosition: initialPosition,
                            circle: isChecked
                                ? checkedCircle
                                : isWithinRange
                                    ? withinDistanceCircle
                                    : notWithinDistanceCircle,
                            marker: marker,
                            onMapCreated: onMapCreated,
                          ),
                          _Button(
                              isWithinRange: isWithinRange,
                              isChecked: isChecked,
                              onPressed: onPressedButton)
                        ],
                      );
                    });
              }
              return Center(
                child: Text(
                  snapshot.data,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400),
                ),
              );
            }));
  }

  onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  onPressedButton() async {
    final result = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("출근하기"),
            content: Text("출근을 하시겠습니까?"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: Text("취소")),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("출근하기"))
            ],
          );
        });

    if (result) {
      setState(() {
        isChecked = true;
      });
    }
  }

  Future<String> checkPermission() async {
    final isLocationEnabled = await Geolocator.isLocationServiceEnabled();

    if (isLocationEnabled) {
      return "위치 서비스를 활성화 해주세요.";
    }

    LocationPermission checkedPermission = await Geolocator.checkPermission();

    if (checkedPermission == LocationPermission.denied) {
      checkedPermission = await Geolocator.requestPermission();

      if (checkedPermission == LocationPermission.denied) {
        return "위치 권한을 허가해주세요.";
      }
    }

    if (checkedPermission == LocationPermission.deniedForever) {
      return "앱의 위치 권한을 세팅에서 허가해주세요.";
    }

    return "위치 권한이 허가되었습니다.";
  }

  AppBar renderAppBar() {
    return AppBar(
      title: Text("화담숲 지도"),
      actions: [
        IconButton(
            onPressed: () async {
              if (mapController == null) {
                return;
              }

              final location = await Geolocator.getCurrentPosition();

              mapController!.animateCamera(CameraUpdate.newLatLng(
                  LatLng(location.latitude, location.longitude)));
            },
            icon: Icon(Icons.my_location))
      ],
    );
  }
}

class _GoogleMap extends StatelessWidget {
  final CameraPosition initialPosition;
  final Circle circle;
  final Marker marker;
  final MapCreatedCallback onMapCreated;

  const _GoogleMap(
      {required this.circle,
      required this.marker,
      required this.initialPosition,
      required this.onMapCreated,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: initialPosition,
          myLocationEnabled: true,
          // 현재 위치
          circles: Set.from([circle]),
          markers: Set.from([marker]),
          onMapCreated: onMapCreated),
    );
  }
}

class _Button extends StatelessWidget {
  final bool isWithinRange;
  final bool isChecked;
  final VoidCallback onPressed;

  const _Button(
      {required this.isWithinRange,
      required this.isChecked,
      required this.onPressed,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.timelapse_outlined,
              size: 50.0, color: isWithinRange ? Colors.blue : Colors.red),
          SizedBox(
            height: 20.0,
          ),
          if (isWithinRange)
            TextButton(
              onPressed: onPressed,
              child: Text(
                "출근",
                style: TextStyle(color: Colors.black),
              ),
            ),
        ],
      ),
    );
  }
}
