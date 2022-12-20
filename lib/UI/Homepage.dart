import 'package:ailatrieuphu/UI/Account.dart';
import 'package:ailatrieuphu/UI/BuyCredit.dart';
import 'package:ailatrieuphu/UI/History.dart';
import 'package:ailatrieuphu/UI/Rank.dart';
import 'package:ailatrieuphu/UI/Welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'NewGame.dart';
import 'package:ailatrieuphu/widget/Colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  double credit;
  final User user;
  HomePage({Key? key, required this.user, required this.credit}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late User _user;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final double _creditCurrent = 0;
  double _credit = 0;

  @override
  void initState() {
    _user = widget.user;
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
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () async {
                    signOut().whenComplete(() {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const WelcomeScreen()));
                    });
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
              child: Material(
                color: Colors.grey.withOpacity(0.3),
                child: _user.photoURL != null
                    ? ClipOval(
                        child: Material(
                          color: Colors.grey.withOpacity(0.3),
                          child: Image.network(
                            _user.photoURL!,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      )
                    : ClipOval(
                        child: Material(
                          color: Colors.grey.withOpacity(0.3),
                          child: const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Icon(
                              Icons.person,
                              size: 60,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
              ),
            ),
            const SizedBox(height: 15),
            Text(
              widget.user.displayName!,
              style: GoogleFonts.abel(
                fontSize: 20,
                color: white.withOpacity(0.9),
              ), //CustomTextStyle.styleBoldWhite,
            ),
            const SizedBox(height: 10),
            Text(
              widget.user.email!,
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
                  _credit.round().toString(),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromRGBO(233, 211, 11, 1).withOpacity(0.8),
                  ),
                )
              ],
            ),
            const SizedBox(height: 50),
            //quản lý tài khoản
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
                  MaterialPageRoute(builder: (context) => const Account()),
                );
              },
              child: Text(
                'Quản lý tài khoản',
                style: GoogleFonts.abel(
                  color: white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 15),
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
                    builder: (context) => LinhVuc(user: _user, credit: _credit),
                  ),
                );
              },
              child: Text(
                'Trò chơi mới',
                style: GoogleFonts.abel(
                  color: white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 15),
            //Lịch Sử
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => const History()));
              },
              child: Text(
                'Lịch sử chơi',
                style: GoogleFonts.abel(
                  color: white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 15),
            //Bảng  xếp hạng
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Rank()));
              },
              child: Text(
                'Bảng xếp hạng',
                style: GoogleFonts.abel(
                  color: white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 15),
            //Mua credit
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
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BuyCredit(
                              user: _user,
                              credit: _credit,
                            )),
                    (route) => false);
              },
              child: Text(
                'Mua Credit',
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

  Future signOut() async {
    await _auth.signOut();
  }
}
