import 'package:ailatrieuphu/models/Question_models.dart';
import 'package:ailatrieuphu/widget/Colors.dart';
import 'package:ailatrieuphu/widget/nextButton.dart';
import 'package:ailatrieuphu/widget/question_widget.dart';
import 'package:ailatrieuphu/widget/result.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Widget/option_Card.dart';

class PlayGame extends StatefulWidget {
  PlayGame({super.key, required this.user, required this.credit});
  User user;
  final double credit;

  @override
  State<PlayGame> createState() => _PlayGameState();
}

class _PlayGameState extends State<PlayGame> {
  //Khai báo authentication của flutterAuth
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //Khai báo đối tượng user
  late User _user;
  //Credit
  late double _credit = 0;
  //List question Lịch Sử
  List<Question> lsQuestion = [
    Question(
      id: 1,
      title: ' Ai là người đặt tên nước ta là Vạn Xuân?',
      options: {'Lí Bạch': false, 'Lý Bôn': true, 'Ngô Quyền': false, 'Lý Công Uẩn': false},
    ),
    Question(
      id: 2,
      title: 'Quê của Đại Tướng Võ Nguyên Giáp ở đâu?',
      options: {'Quảng Bình': true, 'Quảng Ngãi': false, 'Đà Nẵng': false, 'Thanh Hoá': false},
    ),
    Question(
      id: 3,
      title: ' Tên thật của nữ vương đầu tiên và cuối cùng của nước ta?',
      options: {'Lý Phật Thiên': false, 'Lý Phật Kim': false, 'Trưng Trắc': true, 'Trưng Nhị': false},
    ),
    Question(
      id: 4,
      title: '. Có bao nhiêu đời vua vào thời Lý?',
      options: {'9': true, '10': false, '12': false, '5': false},
    ),
    Question(
      id: 5,
      title: 'Ai là người đánh đuổi quân Thanh?',
      options: {'Nguyễn Nhạc': false, 'Nguyễn Huệ': true, 'Nguyễn Lữ': false, 'Nguyễn Ánh': false},
    ),
    Question(
      id: 6,
      title: 'Bố Cái Đại Vương là ai?',
      options: {'Phùng Hải': false, 'Ngô Quyền': false, 'Phùng Hưng': true, 'Lý Bí': false},
    ),
    Question(
      id: 7,
      title: 'Vua Đen là ai?',
      options: {'Mai Thúc Loan': true, 'Lê Long Việt': false, 'Đà Nẵng': false, 'Quảng Nam': false},
    ),
    Question(
      id: 8,
      title: 'Vị vua nào là con rối của người Pháp?',
      options: {'Hàm Nghi': false, 'Đồng Khánh': true, 'Thành Thái': false, 'Thiệu Trị': false},
    ),
    Question(
      id: 9,
      title: 'Quân đội Đồng minh các nước vào nước ta sau năm 1945 là?',
      options: {'quân Anh, quân Mĩ': false, 'quân Pháp, quân Anh': false, 'Quân Anh, quân Trung Hoa Dân quốc': true, 'quân Pháp, quân Trung Hoa Dân quốc': false},
    ),
    Question(
      id: 10,
      title: 'Sau cách mạng tháng Tám, Bác Hồ đã từng nói: “Một dân tộc dốt là một dân tộc?',
      options: {' Đói': false, 'Yếu': true, 'Thất Bại': false, 'Dốt': false},
    ),
  ];

  //index cho loop
  int index = 0;
  //diem
  int score = 0;
  //check boolean when user clicked
  bool isPress = false;
  bool isAlreadyselect = false;
  //khai báo số lượt chơi của người chơi
  int demHeart = 5;

  //funtcion chuyen cau hoi
  void nextQuestion() {
    if (index == lsQuestion.length - 1) {
      //diaglog khi het cau hoi
      showDialog(
          barrierDismissible: false, //dialog se tat  khi user click ngoai pham vi diaglog
          context: context,
          builder: (context) => Result(
                result: score,
                questionLenght: lsQuestion.length,
                onPress: startOver,
              ));
    } else {
      if (isPress) {
        setState(() {
          index++;
          isPress = false;
          isAlreadyselect = false;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            'Chọn đáp án của bạn',
          ),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.symmetric(vertical: 10),
        ));
      }
    }
  }

  //function change color
  void CheckAndUpdateAnswer(bool value) {
    if (isAlreadyselect) {
      return;
    } else {
      if (value == true) {
        score += 10;
      }
      setState(() {
        isPress = true;
        isAlreadyselect = true;
      });
    }
  }

  //function start over (chơi lại)
  void startOver() {
    setState(() {
      index = 0;
      score = 0;
      isPress = false;
      isAlreadyselect = false;
    });
    Navigator.pop(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    _user = widget.user;
    _credit = widget.credit;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kprimaryColor,
      appBar: AppBar(
        title: const Text('Ai Là Triệu Phú'),
        backgroundColor: kprimaryColor,
        shadowColor: Colors.transparent,
        actions: [
          //Điểm
          Padding(
            padding: const EdgeInsets.all(18),
            child: Text(
              'Score : $score',
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: white,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    widget.user.displayName!,
                    style: GoogleFonts.abel(
                      color: white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Row(
                    children: [
                      Container(
                        child: Text(
                          _credit.round().toString(),
                          style: GoogleFonts.abel(
                            color: white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.diamond_outlined,
                        size: 20,
                        color: Colors.yellow.withOpacity(0.8),
                      ),
                    ],
                  ),
                  //const SizedBox(width: 20),

                  const SizedBox(width: 20),
                  Container(
                    padding: const EdgeInsets.only(left: 2.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        //generate list icons (mỗi icon tương ứng với một lượt chơi)
                        ...List.generate(
                          demHeart,
                          (index) => Icon(
                            Icons.heart_broken,
                            color: Colors.red.withOpacity(0.8),
                            size: 20.0,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 25.0,
            ),
            QuestionWidget(
              question: lsQuestion[index].title,
              indexAction: index,
              totalQuestions: lsQuestion.length,
            ),
            const Divider(
              color: white,
            ),
            const SizedBox(
              height: 40,
            ),
            for (int i = 0; i < lsQuestion[index].options.length; i++)
              GestureDetector(
                onTap: () => CheckAndUpdateAnswer(lsQuestion[index].options.values.toList()[i]),
                child: OptionCard(
                  option: lsQuestion[index].options.keys.toList()[i],
                  color: isPress
                      ? lsQuestion[index].options.values.toList()[i] == true
                          ? correct
                          : incorrect
                      : white,
                ),
              ),
            const SizedBox(height: 80.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    showDialog5050(context);
                  },
                  child: Image.asset(
                    'assets/images/50-50.png',
                    fit: BoxFit.cover,
                    height: 55,
                    width: 70,
                  ),
                ),
                const SizedBox(width: 25.0),
                GestureDetector(
                  onTap: () {
                    showDialogCall(context);
                  },
                  child: Image.asset(
                    'assets/images/phone.png',
                    fit: BoxFit.cover,
                    height: 55,
                    width: 70,
                  ),
                ),
                const SizedBox(width: 25.0),
                GestureDetector(
                  onTap: () {
                    showDialogHelp(context);
                  },
                  child: Image.asset(
                    'assets/images/help.png',
                    fit: BoxFit.cover,
                    height: 55,
                    width: 70,
                  ),
                ),
              ],
            ),
            //const SizedBox(height: 10.3),
          ],
        ),
      ),
      floatingActionButton: Container(
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: NextButton(
            nextQuestion: nextQuestion,
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  //dialog 50/50
  void showDialog5050(BuildContext context) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: background,
          content: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 0),
                decoration: const BoxDecoration(
                  color: boldBlue,
                ),
                height: 50,
                width: double.infinity,
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Trợ giúp',
                    style: TextStyle(
                      fontSize: 20,
                      color: white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'Bạn chọn trợ giúp ',
                      style: TextStyle(color: white),
                    ),
                    TextSpan(
                      text: '50/50',
                      style: TextStyle(color: white),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: lightBlue,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Hủy bỏ'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: lightBlue,
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Chọn',
                      style: TextStyle(
                        color: Colors.yellow,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
  //Dialog gọi điện thoại
  void showDialogCall(BuildContext context) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: background,
          content: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 0),
                decoration: const BoxDecoration(
                  color: boldBlue,
                ),
                height: 50,
                width: double.infinity,
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Trợ giúp',
                    style: TextStyle(
                      fontSize: 20,
                      color: white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'Bạn chọn trợ giúp ',
                      style: TextStyle(color: white),
                    ),
                    TextSpan(
                      text: 'GỌI ĐIỆN THOẠI',
                      style: TextStyle(color: white),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: lightBlue,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Hủy bỏ'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: lightBlue,
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Chọn',
                      style: TextStyle(
                        color: Colors.yellow,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
  //Dialog hỏi ý kiến khán giả
  void showDialogHelp(BuildContext context) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: background,
          content: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 0),
                decoration: const BoxDecoration(
                  color: boldBlue,
                ),
                height: 50,
                width: double.infinity,
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Trợ giúp',
                    style: TextStyle(
                      fontSize: 20,
                      color: white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'Bạn chọn trợ giúp ',
                      style: TextStyle(color: white),
                    ),
                    TextSpan(
                      text: 'HỎI Ý KIẾN KHÁN GIẢ',
                      style: TextStyle(color: white),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: lightBlue,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Hủy bỏ'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: lightBlue,
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Chọn',
                      style: TextStyle(
                        color: Colors.yellow,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
