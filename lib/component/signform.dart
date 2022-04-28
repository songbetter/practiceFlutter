import 'package:annieflutter/layout/main_layout.dart';
import 'package:annieflutter/screen/timetravel/question_screen.dart';
import 'package:annieflutter/screen/timetravel/signIn_screen.dart';
import 'package:flutter/material.dart';

class SignForm extends StatelessWidget {
  final String title;

  const SignForm({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      children: [
        Row(
          children: [
            Icon(Icons.mail_outline),
            // Icon(Icons.person, color: Colors.white),
            // Icon(Icons.phone_android, color: Colors.white),
            // Icon(Icons.cake, color: Colors.white),
            // Icon(Icons.location_on, color: Colors.white),
            // Icon(Icons.g_mobiledata, color: Colors.white),
            // Icon(Icons.height, color: Colors.white),
            // Icon(Icons.school, color: Colors.white),
            // Icon(Icons.child_care, color: Colors.white),
            // Icon(Icons.home, color: Colors.white),
            // Icon(Icons.policy, color: Colors.white),
            // Icon(Icons.wine_bar, color: Colors.white),
            // Icon(Icons.photo, color: Colors.white),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 13.0),
          child: Text(
            title,
            style: TextStyle(fontSize: 22.0, color: Colors.black),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 13.0, bottom: 37.5),
          child: Column(
            children: [
              TextFormField(
                  decoration: const InputDecoration(
                hintText: "이메일 주소를 입력하세요.",
                hintStyle: TextStyle(fontSize: 22.0, color: Colors.grey),
              )),
              TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: "비밀번호를 입력하세요.",
                    hintStyle: TextStyle(fontSize: 22.0, color: Colors.grey),
                  )),
              title == "회원가입"
                  ? TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: "비밀번호를 확인해주세요.",
                        hintStyle:
                            TextStyle(fontSize: 22.0, color: Colors.grey),
                      ))
                  : TextButton(
                      style: TextButton.styleFrom(primary: Colors.black),
                      onPressed: () {},
                      child: Text("비밀번호를 잊으셨나요?")),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
          child: SizedBox(
            width: double.infinity,
            child: OutlinedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) =>
                          title == "회원가입" ? SignInScreen() : QuestionScreen()));
                },
                child: Text(
                  "계속하기",
                  style: TextStyle(fontSize: 18.0),
                ),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(width: 3.0),
                  primary: Colors.black,
                  padding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 36.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(36),
                  ),
                )),
          ),
        ),
        Center(
          heightFactor: 4.0,
          child: Text(
            "or",
            style: TextStyle(
                color: Colors.black,
                fontSize: 14.0,
                fontWeight: FontWeight.normal),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                primary: Color(0xff395498),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(36),
                ),
              ),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.facebook),
                  SizedBox(width: 13.0),
                  Text(
                    '페이스북 계정으로 $title하기',
                    style: TextStyle(fontSize: 18.0),
                  )
                ],
              )),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                primary: Color(0xffFFE812),
                onPrimary: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(36),
                ),
              ),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.facebook),
                  SizedBox(width: 13.0),
                  Text(
                    '카카오 계정으로 $title하기',
                    style: TextStyle(fontSize: 18.0),
                  )
                ],
              )),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                primary: Color(0xff2CAD02),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(36),
                ),
              ),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.facebook),
                  SizedBox(width: 13.0),
                  Text(
                    '네이버 계정으로 $title하기',
                    style: TextStyle(fontSize: 18.0),
                  )
                ],
              )),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                primary: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(36),
                ),
              ),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.facebook),
                  SizedBox(width: 13.0),
                  Text(
                    'G메일 계정으로 ${title}하기',
                    style: TextStyle(fontSize: 18.0),
                  )
                ],
              )),
        )
      ],
    );
  }
}
