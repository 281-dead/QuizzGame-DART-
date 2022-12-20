import 'package:ailatrieuphu/UI/Homepage.dart';
import 'package:ailatrieuphu/UI/PlayGame.dart';
import 'package:ailatrieuphu/widget/Colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LinhVuc extends StatefulWidget {
  final double credit;
  final User user;
  const LinhVuc({super.key, required this.user, required this.credit});

  @override
  State<LinhVuc> createState() => _LinhVucState();
}

class _LinhVucState extends State<LinhVuc> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late User user;
  late double _credit;
  int iconHeart = 5;

  //Gán đối tượng cho user
  @override
  void initState() {
    user = widget.user;
    _credit = widget.credit;
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
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(
                          user: user,
                          credit: _credit,
                        ),
                      ),
                      (route) => false);
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
                  width: 250,
                  padding: const EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: white),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.user.displayName!,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
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
                    const SizedBox(width: 3),
                    Icon(
                      Icons.diamond_outlined,
                      size: 20,
                      color: Colors.yellow.withOpacity(0.8),
                    ),
                  ],
                ),
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
                    builder: (context) => PlayGame(
                      user: user,
                      credit: _credit,
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
                    builder: (context) => PlayGame(
                      user: user,
                      credit: _credit,
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
                    builder: (context) => PlayGame(
                      user: user,
                      credit: _credit,
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
                    builder: (context) => PlayGame(
                      user: user,
                      credit: _credit,
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
