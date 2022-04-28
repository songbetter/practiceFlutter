import 'package:annieflutter/screen/timetravel/signIn_screen.dart';
import 'package:annieflutter/screen/timetravel/signUp_screen.dart';
import 'package:flutter/material.dart';

class TimeTravelMainScreen extends StatefulWidget {
  const TimeTravelMainScreen({Key? key}) : super(key: key);

  @override
  State<TimeTravelMainScreen> createState() => _TimeTravelMainScreenState();
}

class _TimeTravelMainScreenState extends State<TimeTravelMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[800],
      body: Padding(
        padding: const EdgeInsets.fromLTRB(38.0, 100.0, 38.0, 38.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "TIME MACHINE",
              style: TextStyle(fontSize: 76.0, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 360.0,
            ),
            Text(
              "이 앱을 가입하면 당사의 이용 약관에 동의하는 것입니다. 개인정보 보호정책에서 당사의 데이터 사용 방식을 확인하세요",
              style: TextStyle(fontWeight: FontWeight.w100, fontSize: 14.0),
            ),
            SizedBox(
              height: 27.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(36),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => SignUpScreen()));
                      });
                    },
                    child: Text(
                      "회원가입",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 9.0,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(36),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => SignInScreen()));
                      });
                    },
                    child: Text(
                      "로그인",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
