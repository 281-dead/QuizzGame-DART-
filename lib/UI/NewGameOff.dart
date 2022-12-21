import 'package:ailatrieuphu/UI/PlayGameOff.dart';
import 'package:ailatrieuphu/UI/Welcome.dart';
import 'package:ailatrieuphu/models/Question_models.dart';
import 'package:ailatrieuphu/widget/Colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/db_connect.dart';

class LinhVucOff extends StatefulWidget {
  const LinhVucOff({super.key});

  @override
  State<LinhVucOff> createState() => _LinhVucOffState();
}

class _LinhVucOffState extends State<LinhVucOff> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  int iconHeart = 5;
  var db = DbConnect();
  late Future question1;
  late Future question2;
  late Future question3;
  late Future question4;
  //get data lich su
  Future<List<Question>> getData() async {
    return db.fetchQuestion();
  }

  //get van hoa -xh
  Future<List<Question>> getData1() async {
    return db.fetchQuestionvanhoa();
  }

  //get khoa hoc
  Future<List<Question>> getData2() async {
    return db.fetchQuestionkhoahoc();
  }

  //get the thao
  Future<List<Question>> getData3() async {
    return db.fetchQuestionthethao();
  }

  //Gán đối tượng cho user
  @override
  void initState() {
    question1 = getData();
    question2 = getData1();
    question3 = getData2();
    question4 = getData3();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kprimaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 25,
            ),
            Container(
              margin: const EdgeInsets.only(right: 310, bottom: 5),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WelcomeScreen(),
                    ),
                  );
                },
                icon: Icon(
                  Icons.arrow_circle_left_outlined,
                  color: white.withOpacity(0.8),
                  size: 35.0,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 18),
                  width: 350,
                  height: 45,
                  padding: const EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: white),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'User Name',
                        style: GoogleFonts.abel(
                          color: white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Container(
                        padding: const EdgeInsets.only(left: 2.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ...List.generate(
                                iconHeart,
                                (index) => Icon(
                                      Icons.heart_broken,
                                      color: Colors.red.withOpacity(0.8),
                                      size: 20.0,
                                    )),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(width: 15),
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            Text(
              'Chọn lĩnh vực',
              style: GoogleFonts.abel(
                color: white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            //Lịch sử - địa lý
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: incorrect,
                minimumSize: const Size(300, 50),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlayGameOff(
                      lsQuestion: question1,
                    ),
                  ),
                );
              },
              child: Text(
                'Lịch Sử - Địa Lý',
                style: GoogleFonts.abel(
                  color: white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 15),
            //Văn hóa - Xã hội - Nghệ thuật
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: incorrect,
                minimumSize: const Size(300, 50),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlayGameOff(
                      lsQuestion: question2,
                    ),
                  ),
                );
              },
              child: Text(
                'Văn Hóa - Xã Hội - Nghệ Thuật',
                style: GoogleFonts.abel(
                  color: white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 15),
            //Khoa học vũ trụ
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: incorrect,
                minimumSize: const Size(300, 50),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlayGameOff(
                      lsQuestion: question3,
                    ),
                  ),
                );
              },
              child: Text(
                'Khoa Học Vũ Trụ',
                style: GoogleFonts.abel(
                  color: white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 15),
            //Thể thao
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: incorrect,
                minimumSize: const Size(300, 50),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlayGameOff(
                      lsQuestion: question4,
                    ),
                  ),
                );
              },
              child: Text(
                'Thể Thao',
                style: GoogleFonts.abel(
                  color: white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
