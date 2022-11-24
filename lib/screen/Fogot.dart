import 'package:ailatrieuphu/widget/Colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF142850),
        title: const Text(
          'Lấy Lại Mật Khẩu',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(
              0xFFFDFDFD,
            ),
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: kprimaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30.0,
            ),
            Container(
              padding: const EdgeInsets.all(15),
              child: Image.network(
                'https://image.winudf.com/v2/image1/Y29tLmFya2F5YXBwcy5mbHV0dGVycXVpenRlbXBsYXRlX2ljb25fMTYyOTI5MTc0Ml8wOTE/icon.png?w=170&fakeurl=1',
                fit: BoxFit.cover,
                height: 120,
                width: 120,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 60, left: 60),
              child: Text(
                'Bạn quên mật khẩu của mình?'
                'Chúng tôi sẽ giúp bạn...',
                softWrap: true,
                textAlign: TextAlign.center,
                style: GoogleFonts.abel(
                  color: white.withOpacity(0.7),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                decoration: BoxDecoration(
                  color: white,
                  border: Border.all(
                    color: white,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: TextField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.email, color: black),
                      hintText: 'Nhập email đã đăng ký tài khoản vào đây...',
                      hintStyle: TextStyle(
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                        color: black,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(100, 40),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  )),
              onPressed: () {},
              child: Text(
                'Gửi',
                style: GoogleFonts.abel(
                  color: white.withOpacity(0.80),
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
