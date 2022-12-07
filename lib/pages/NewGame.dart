import 'package:ailatrieuphu/pages/Homepage.dart';
import 'package:ailatrieuphu/widget/Colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LinhVuc extends StatelessWidget {
  const LinhVuc({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kprimaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.only(right: 310, bottom: 5),
              child: IconButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                      (route) => false);
                },
                icon: Icon(
                  Icons.arrow_circle_left_outlined,
                  color: white.withOpacity(0.8),
                  size: 28.0,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 200,
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
                        'User',
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
                            Icon(
                              Icons.heart_broken_rounded,
                              color: Colors.red.withOpacity(0.8),
                              size: 20.0,
                            ),
                            Icon(
                              Icons.heart_broken_rounded,
                              color: Colors.red.withOpacity(0.8),
                              size: 20.0,
                            ),
                            Icon(
                              Icons.heart_broken_rounded,
                              color: Colors.red.withOpacity(0.8),
                              size: 20.0,
                            ),
                            Icon(
                              Icons.heart_broken_rounded,
                              color: Colors.red.withOpacity(0.8),
                              size: 20.0,
                            ),
                            Icon(
                              Icons.heart_broken_rounded,
                              color: Colors.red.withOpacity(0.8),
                              size: 20.0,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(width: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      child: Text(
                        '2000',
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
              height: 30,
            ),
            Text(
              'ĐIỂM:0',
              style: GoogleFonts.abel(color: white, fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Câu Hỏi',
              style: GoogleFonts.abel(
                color: white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: 150,
              height: 120,
              decoration: BoxDecoration(
                  color: lightColor.withOpacity(0.8),
                  border: Border.all(
                    color: white,
                  )),
              child: Text(
                '1',
                style: TextStyle(
                  fontSize: 70,
                  color: white.withOpacity(0.8),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              'Chọn lĩnh vực',
              style: GoogleFonts.abel(
                color: white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: lightColor,
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
                    builder: (context) => const LinhVuc(),
                  ),
                );
              },
              child: Text(
                'Lịch Sử - Địa Lý',
                style: GoogleFonts.abel(
                  color: white,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: lightColor,
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
                    builder: (context) => const LinhVuc(),
                  ),
                );
              },
              child: Text(
                'Văn Hóa - Xã Hội - Nghệ Thuật',
                style: GoogleFonts.abel(
                  color: white,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: lightColor,
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
                    builder: (context) => const LinhVuc(),
                  ),
                );
              },
              child: Text(
                'Khoa Học Vũ Trụ',
                style: GoogleFonts.abel(
                  color: white,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: lightColor,
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
                    builder: (context) => const LinhVuc(),
                  ),
                );
              },
              child: Text(
                'Thể Thao',
                style: GoogleFonts.abel(
                  color: white,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
