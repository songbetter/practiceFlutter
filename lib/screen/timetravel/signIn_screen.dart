import 'package:annieflutter/component/signform.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SignForm(
      title: "로그인",
    );
  }

  void onSubmitSignIn() {
    print("로그인 완료");
  }
}
