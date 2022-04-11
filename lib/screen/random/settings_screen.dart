import 'package:annieflutter/constant/color.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  final int maxNumber;

  const SettingsScreen({required this.maxNumber, Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  double maxNumber = 1000;

  @override
  void initState() {
    super.initState();

    maxNumber = widget.maxNumber.toDouble();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: PRIMARY_COLOR,
        body: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _Body(maxNumber: maxNumber),
                  _Footer(
                    onSliderChanged: onSliderChanged,
                    onButtonPressed: onButtonPressed,
                    maxNumber: maxNumber,
                  )
                ],
              ),
            ),
          ),
        ));
  }

  void onSliderChanged(double val) {
    setState(() {
      maxNumber = val;
    });
  }

  void onButtonPressed() {
    Navigator.of(context).pop(maxNumber.toInt());
  }
}

class _Body extends StatelessWidget {
  final double maxNumber;

  const _Body({required this.maxNumber, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Row(
      children: [
        Text(
          maxNumber.toInt().toString(),
          style: TextStyle(color: Colors.white),
        ),
      ],
    ));
  }
}

class _Footer extends StatelessWidget {
  final ValueChanged<double>? onSliderChanged;
  final VoidCallback onButtonPressed;
  final double maxNumber;

  const _Footer(
      {required this.onSliderChanged,
      required this.maxNumber,
      required this.onButtonPressed,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Slider(
            value: maxNumber,
            min: 1000,
            max: 100000,
            onChanged: onSliderChanged),
        ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.red),
            onPressed: onButtonPressed,
            child: Text("저장")),
      ],
    );
  }
}
