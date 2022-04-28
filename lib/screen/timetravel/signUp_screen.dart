import 'package:annieflutter/component/signform.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SignForm(
      title: "회원가입",
    );
  }
}
