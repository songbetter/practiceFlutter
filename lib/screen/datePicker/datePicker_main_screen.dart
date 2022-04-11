import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DatePickerMainScreen extends StatefulWidget {
  const DatePickerMainScreen({Key? key}) : super(key: key);

  @override
  State<DatePickerMainScreen> createState() => _DatePickerMainScreenState();
}

class _DatePickerMainScreenState extends State<DatePickerMainScreen> {
  DateTime selectedDate =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pink[100],
        body: SafeArea(
            bottom: false,
            child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(children: [
                  _TopPart(
                      selectedDate: selectedDate, onPressed: onHeartPressed),
                  _BottomPart()
                ]))));
  }

  onHeartPressed() {
    final today = DateTime.now();
    showCupertinoDialog(
        context: context,
        barrierDismissible: true, // CupertinoDialog 바깥 눌렀을 때 닫힘.
        builder: (BuildContext context) {
          return Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                color: Colors.white,
                height: 300.0,
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: selectedDate,
                  maximumDate: DateTime(today.year, today.month, today.day),
                  onDateTimeChanged: (DateTime date) {
                    setState(() {
                      selectedDate = date;
                    });
                  },
                )),
          );
        });
  }
}

class _TopPart extends StatelessWidget {
  final DateTime selectedDate;
  final VoidCallback onPressed;

  _TopPart({required this.selectedDate, required this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final today = DateTime.now();

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("U & I", style: theme.textTheme.headline1),
          Column(
            children: [
              Text("Tommy랑 처음 만난 날", style: theme.textTheme.headline2),
              Text(
                  '${selectedDate.year}-${selectedDate.month}-${selectedDate.day}',
                  style: theme.textTheme.bodyText1),
            ],
          ),
          IconButton(
            onPressed: onPressed,
            icon: Icon(Icons.favorite),
            color: Colors.red,
            iconSize: 60.0,
          ),
          Text(
              'D+${DateTime(today.year, today.month, today.day).difference(selectedDate).inDays + 1}',
              style: theme.textTheme.bodyText2),
        ],
      ),
    );
  }
}

class _BottomPart extends StatelessWidget {
  const _BottomPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Image.asset('asset/img/tommy.jpeg'));
  }
}
