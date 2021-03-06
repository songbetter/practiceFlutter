import 'package:annieflutter/const/question.dart';
import 'package:annieflutter/layout/main_layout.dart';
import 'package:annieflutter/screen/timetravel/answer_screen.dart';
import 'package:annieflutter/screen/timetravel/mypage_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int stage = 0;
  String name = "";
  int age = 0;
  final textController = TextEditingController();
  XFile? image;

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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.mail_outline, color: Colors.grey[300]),
            ...ICON_LIST
                .asMap()
                .entries
                .map(
                  (icon) => Icon(
                    icon.value["icon"],
                    color: stage > icon.value["id"]
                        ? Colors.grey[300]
                        : stage == icon.value["id"]
                            ? Colors.black
                            : Colors.white,
                  ),
                )
                .toList(),
            Icon(
              Icons.question_mark,
              color: stage == 11 ? Colors.black : Colors.white,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 13.0),
          child: Text(
            TITLE_LIST[stage],
            style: TextStyle(fontSize: 22.0, color: Colors.black),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 13.0, bottom: 37.5),
          child: Column(children: [renderAnswer()]),
        ),
        Expanded(
            child: Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    stage == 0 ? Navigator.of(context).pop() : stage -= 1;
                  });
                },
                child: Icon(
                  Icons.arrow_circle_left,
                  size: 68.0,
                  color: Colors.teal[100],
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    stage == 11
                        ? Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => (MypageScreen())))
                        : stage += 1;
                  });
                },
                child: Icon(
                  Icons.arrow_circle_right,
                  size: 68.0,
                  color: Colors.teal,
                ),
              ),
            ],
          ),
        )),
      ],
    );
  }

  Widget renderAnswer() {
    switch (stage) {
      case 1:
        return Column(
          children: [
            TextFormField(
                decoration: const InputDecoration(
              hintText: "??????????????? ???????????????.",
              hintStyle: TextStyle(fontSize: 22.0, color: Colors.grey),
            )),
            Align(
                alignment: Alignment.centerRight,
                child:
                    ElevatedButton(onPressed: () {}, child: Text("???????????? ??????"))),
            TextFormField(
                decoration: const InputDecoration(
              hintText: "??????????????? ???????????????.",
              hintStyle: TextStyle(fontSize: 22.0, color: Colors.grey),
            )),
            SizedBox(
              height: 45.0,
            ),
            Text(
              "??????????????? ????????? ??????????????? ???????????? ?????? ????????? ????????????.",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400),
            ),
          ],
        );
        break;
      case 2:
        return Column(
          children: [
            Container(
              height: 300.0,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                initialDateTime: DateTime(DateTime.now().year,
                    DateTime.now().month, DateTime.now().day),
                onDateTimeChanged: (DateTime date) {
                  setState(() {
                    age =
                        (DateTime.now().difference(date).inDays / 365).toInt();
                  });
                },
              ),
            ),
            Text(
              '?????? $age',
              style: TextStyle(color: Colors.black),
            ),
            Text(
              "?????? ??? ????????? ??? ????????????.",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400),
            ),
          ],
        );
        break;
      case 3:
        return Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 92.25),
            child: Column(
              children: [
                Icon(
                  Icons.add_location_outlined,
                  size: 117.0,
                ),
                Text(
                  "????????? ???????????????.",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        );
      case 4:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "????????? ????????? ?????? ??? ???????????? ????????? ????????????????",
              style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w400),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Woman"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(36),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 9.0,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Man"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal[800],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(36),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Text(
              "????????? ???????????? ??????????",
              style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w400),
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Woman"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(36),
                    ),
                  ),
                ),
                SizedBox(
                  width: 9.0,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Man"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.teal[800],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(36),
                    ),
                  ),
                )
              ],
            ),
          ],
        );
      case 5:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "175cm",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black),
            ),
            Text(
              "180cm",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black),
            ),
            Text(
              "185cm",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black),
            )
          ],
        );
      case 6:
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("???????????? ??????",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  )),
              Icon(Icons.check_box_outline_blank),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("???????????? ??????",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  )),
              Icon(Icons.check_box_outline_blank),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("??????",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  )),
              Icon(Icons.check_box_outline_blank),
            ],
          ),
          SizedBox(
            height: 24.0,
          ),
          Row(
            children: [
              Icon(Icons.check_box),
              Text("???????????? ??????",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  )),
            ],
          ),
          SizedBox(
            height: 24.0,
          ),
          Text(
            "???????????? ????????? ?????????????",
            style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
                fontWeight: FontWeight.w400),
          ),
          TextFormField(
              decoration: const InputDecoration(
            hintText: "?????? ????????? ???????????????",
            hintStyle: TextStyle(fontSize: 22.0, color: Colors.grey),
          )),
          SizedBox(
            height: 24.0,
          ),
          Row(
            children: [
              Icon(Icons.check_box),
              Text("???????????? ??????",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  )),
            ],
          ),
          SizedBox(
            height: 24.0,
          ),
          Text(
            "???????????? ??????????????? ?????????????",
            style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
                fontWeight: FontWeight.w400),
          ),
          TextFormField(
              decoration: const InputDecoration(
            hintText: "?????? ????????? ???????????????",
            hintStyle: TextStyle(fontSize: 22.0, color: Colors.grey),
          )),
          SizedBox(
            height: 24.0,
          ),
          Row(
            children: [
              Icon(Icons.check_box),
              Text("???????????? ??????",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  )),
            ],
          )
        ]);
      case 7:
        return Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("?????? ??????",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  )),
              Icon(Icons.check_box_outline_blank),
            ],
          ),
          SizedBox(
            height: 24.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("?????? ??????",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  )),
              Icon(Icons.check_box_outline_blank),
            ],
          ),
          SizedBox(
            height: 24.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("???????????? ?????? ??????",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  )),
              Icon(Icons.check_box_outline_blank),
            ],
          ),
          SizedBox(
            height: 24.0,
          ),
          Row(
            children: [
              Icon(Icons.check_box),
              Text("???????????? ??????",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  )),
            ],
          ),
        ]);
      case 8:
        return Column(
          children: [
            TextFormField(
                controller: textController,
                onChanged: (string) {
                  setState(() {
                    name = textController.text;
                  });
                },
                decoration: const InputDecoration(
                  hintText: "????????? ???????????????.",
                  hintStyle: TextStyle(fontSize: 22.0, color: Colors.grey),
                )),
            SizedBox(
              height: 24.0,
            ),
            Row(
              children: [
                Icon(Icons.check_box),
                Text("???????????? ??????",
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    )),
              ],
            ),
          ],
        );
      case 9:
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "?????? ?????????????",
            style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
                fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 24.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("???",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  )),
              Icon(Icons.check_box_outline_blank),
            ],
          ),
          SizedBox(
            height: 24.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("??????",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  )),
              Icon(Icons.check_box_outline_blank),
            ],
          ),
          SizedBox(
            height: 24.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("?????????",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  )),
              Icon(Icons.check_box_outline_blank),
            ],
          ),
          SizedBox(
            height: 24.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("???????????? ?????? ??????",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  )),
              Icon(Icons.check_box_outline_blank),
            ],
          ),
          SizedBox(
            height: 24.0,
          ),
          Row(
            children: [
              Icon(Icons.check_box),
              Text("???????????? ??????",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  )),
            ],
          ),
          SizedBox(
            height: 24.0,
          ),
          Text(
            "????????? ?????????????",
            style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
                fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 24.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("???",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  )),
              Icon(Icons.check_box_outline_blank),
            ],
          ),
          SizedBox(
            height: 24.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("??????",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  )),
              Icon(Icons.check_box_outline_blank),
            ],
          ),
          SizedBox(
            height: 24.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("?????????",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  )),
              Icon(Icons.check_box_outline_blank),
            ],
          ),
          SizedBox(
            height: 24.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("???????????? ?????? ??????",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  )),
              Icon(Icons.check_box_outline_blank),
            ],
          ),
          SizedBox(
            height: 24.0,
          ),
          Row(
            children: [
              Icon(Icons.check_box),
              Text("???????????? ??????",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  )),
            ],
          ),
          SizedBox(
            height: 24.0,
          ),
        ]);
      case 10:
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 24.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.all(27.0),
                        ),
                        onPressed: () {},
                        child: Icon(Icons.add_photo_alternate_outlined)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.all(27.0),
                        ),
                        onPressed: () {},
                        child: Icon(Icons.add_photo_alternate_outlined)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.all(27.0),
                        ),
                        onPressed: () {},
                        child: Icon(Icons.add_photo_alternate_outlined)),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.all(27.0),
                        ),
                        onPressed: () {},
                        child: Icon(Icons.add_photo_alternate_outlined)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.all(27.0),
                        ),
                        onPressed: () {},
                        child: Icon(Icons.add_photo_alternate_outlined)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.all(27.0),
                        ),
                        onPressed: () async {
                          final image = await ImagePicker()
                              .pickImage(source: ImageSource.gallery);

                          if (image != null) {
                            // ???????????? ????????? ???
                            setState(() {
                              this.image = image;
                            });
                          }
                        },
                        child: Icon(Icons.add_photo_alternate_outlined)),
                  ),
                ],
              ),
              Text("6?????? ?????? ?????? ???????????? ???????????????.",
                  style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                      fontWeight: FontWeight.normal)),
              SizedBox(
                height: 82.0,
              ),
              Icon(
                Icons.lightbulb_outline,
              ),
              SizedBox(
                height: 18.0,
              ),
              Text("????????? ???????????? ??????????????? ???????????? ????????? ????????? ?????? ?????? ?????? ?????? ??? ???????????????.",
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                      fontWeight: FontWeight.normal)),
            ],
          ),
        );
      case 11:
        return Column(
          children: [
            OutlinedButton(
              style: OutlinedButton.styleFrom(primary: Colors.black),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (_) => (AnswerScreen(
                            title: "????????????",
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24.0, vertical: 50.0),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                          width: 1.0,
                                        )),
                                        padding: EdgeInsets.all(8.0),
                                        child: Text("?????? ???????????? ???",
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.black,
                                                fontWeight: FontWeight.normal)),
                                      ),
                                      SizedBox(height: 14.0),
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                          width: 1.0,
                                        )),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 17.0),
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Text('0:00/00:30',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: 14.0,
                                                    color: Colors.black,
                                                  )),
                                              SizedBox(
                                                height: 100.0,
                                                child: IconButton(
                                                    onPressed: () {},
                                                    icon: Icon(Icons.mic,
                                                        color: Colors.black,
                                                        size: 80.0)),
                                              ),
                                              Text('????????? ?????? ????????? ???????????????',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.normal)),
                                            ]),
                                      )
                                    ]),
                              ),
                            ],
                            doneEvent: () {
                              setState(() {
                                print("???");
                              });
                            },
                          ))),
                );
              },
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text("?????? ???????????? ???",
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                            fontWeight: FontWeight.normal)),
                    SizedBox(
                      height: 14.0,
                    )
                  ]),
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(primary: Colors.black),
              onPressed: () {},
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text("?????? ???????????? ???",
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                            fontWeight: FontWeight.normal)),
                    SizedBox(
                      height: 14.0,
                    )
                  ]),
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(primary: Colors.black),
              onPressed: () {},
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text("?????? ???????????? ???",
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                            fontWeight: FontWeight.normal)),
                    SizedBox(
                      height: 14.0,
                    )
                  ]),
            ),
          ],
        );
      default:
        return TextFormField(
            controller: textController,
            onChanged: (string) {
              setState(() {
                name = textController.text;
              });
            },
            decoration: const InputDecoration(
              hintText: "????????? ???????????????.",
              hintStyle: TextStyle(fontSize: 22.0, color: Colors.grey),
            ));
    }
  }
}
