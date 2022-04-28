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
              hintText: "전화번호를 입력하세요.",
              hintStyle: TextStyle(fontSize: 22.0, color: Colors.grey),
            )),
            Align(
                alignment: Alignment.centerRight,
                child:
                    ElevatedButton(onPressed: () {}, child: Text("인증코드 전송"))),
            TextFormField(
                decoration: const InputDecoration(
              hintText: "인증번호를 입력하세요.",
              hintStyle: TextStyle(fontSize: 22.0, color: Colors.grey),
            )),
            SizedBox(
              height: 45.0,
            ),
            Text(
              "휴대전화로 전송된 인증번호를 입력하고 다음 버튼을 누르세요.",
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
              '나이 $age',
              style: TextStyle(color: Colors.black),
            ),
            Text(
              "가입 후 변경할 수 없습니다.",
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
                  "위치를 조정하세요.",
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
              "당신의 성별을 가장 잘 설명하는 단어는 무엇인가요?",
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
              "누구와 대화하고 싶나요?",
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
              Text("고등학교 졸업",
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
              Text("고등학교 자퇴",
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
              Text("학사",
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
              Text("공개하지 않음",
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
            "어디에서 학교를 다녔나요?",
            style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
                fontWeight: FontWeight.w400),
          ),
          TextFormField(
              decoration: const InputDecoration(
            hintText: "학교 이름을 입력하세요",
            hintStyle: TextStyle(fontSize: 22.0, color: Colors.grey),
          )),
          SizedBox(
            height: 24.0,
          ),
          Row(
            children: [
              Icon(Icons.check_box),
              Text("공개하지 않음",
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
            "어디에서 직장생활을 하시나요?",
            style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
                fontWeight: FontWeight.w400),
          ),
          TextFormField(
              decoration: const InputDecoration(
            hintText: "회사 이름을 입력하세요",
            hintStyle: TextStyle(fontSize: 22.0, color: Colors.grey),
          )),
          SizedBox(
            height: 24.0,
          ),
          Row(
            children: [
              Icon(Icons.check_box),
              Text("공개하지 않음",
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
              Text("자녀 있음",
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
              Text("자녀 없음",
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
              Text("대답하고 싶지 않음",
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
              Text("공개하지 않음",
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
                  hintText: "고향을 입력하세요.",
                  hintStyle: TextStyle(fontSize: 22.0, color: Colors.grey),
                )),
            SizedBox(
              height: 24.0,
            ),
            Row(
              children: [
                Icon(Icons.check_box),
                Text("공개하지 않음",
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
            "술을 드시나요?",
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
              Text("네",
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
              Text("가끔",
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
              Text("아니오",
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
              Text("대답하고 싶지 않음",
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
              Text("공개하지 않음",
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
            "담배를 피시나요?",
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
              Text("네",
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
              Text("가끔",
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
              Text("아니오",
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
              Text("대답하고 싶지 않음",
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
              Text("공개하지 않음",
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
                            // 비디오를 골랐을 때
                            setState(() {
                              this.image = image;
                            });
                          }
                        },
                        child: Icon(Icons.add_photo_alternate_outlined)),
                  ),
                ],
              ),
              Text("6개의 사진 혹은 비디오를 올려주세요.",
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
              Text("당신의 프로필을 동영상으로 제공하여 당신이 누군지 어떤 삶을 살아 왔는 지 보여줍니다.",
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
                            title: "답변하기",
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
                                        child: Text("내가 하고싶은 말",
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
                                              Text('여기를 눌러 녹음을 시작하세요',
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
                                print("끝");
                              });
                            },
                          ))),
                );
              },
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text("내가 하고싶은 말",
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
                    Text("내가 하고싶은 말",
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
                    Text("내가 하고싶은 말",
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
              hintText: "이름을 입력하세요.",
              hintStyle: TextStyle(fontSize: 22.0, color: Colors.grey),
            ));
    }
  }
}
