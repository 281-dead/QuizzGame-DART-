import 'package:ailatrieuphu/pages/Account.dart';
import 'package:ailatrieuphu/pages/History.dart';
import 'package:ailatrieuphu/pages/NewGame.dart';
import 'package:ailatrieuphu/pages/Rank.dart';
import 'package:ailatrieuphu/screen/Login.dart';
import 'package:ailatrieuphu/widget/Colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kprimaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Login(),
                        ),
                        (route) => false);
                  },
                  icon: Icon(
                    Icons.exit_to_app_rounded,
                    color: white.withOpacity(0.8),
                    size: 30.0,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ClipOval(
              child: Image.asset(
                'assets/images/avatar.png',
                fit: BoxFit.cover,
                height: 150,
                width: 150,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              'UserName',
              style: GoogleFonts.abel(
                fontSize: 20,
                color: white.withOpacity(0.9),
              ), //CustomTextStyle.styleBoldWhite,
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.diamond,
                  color: Colors.yellow.withOpacity(0.8),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  '2000',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromRGBO(233, 211, 11, 1).withOpacity(0.8),
                  ),
                )
              ],
            ),
            const SizedBox(height: 30),
            //quản lý tài khoản
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
                  MaterialPageRoute(builder: (context) => const Account()),
                );
              },
              child: Text(
                'Quản lý tài khoản',
                style: GoogleFonts.abel(
                  color: white,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 10),
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
                'Trò chơi mới',
                style: GoogleFonts.abel(
                  color: white,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 10),
            //Lịch Sử
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => const History()));
              },
              child: Text(
                'Lịch sử chơi',
                style: GoogleFonts.abel(
                  color: white,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 10),
            //Bảng  xếp hạng
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Rank()));
              },
              child: Text(
                'Bảng xếp hạng',
                style: GoogleFonts.abel(
                  color: white,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 10),
            //Mua credit
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
              onPressed: () {},
              child: Text(
                'Mua Credit',
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
