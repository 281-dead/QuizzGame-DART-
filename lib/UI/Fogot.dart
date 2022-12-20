import 'package:ailatrieuphu/widget/Colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  bool isEmailValid(String email) {
    return RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$').hasMatch(email);
  }

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
      body: Form(
        key: formKey,
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
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: email,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.email, color: black),
                      hintText: 'Nhập email đã đăng ký tài khoản vào đây...',
                      hintStyle: TextStyle(
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                        color: black,
                      ),
                      border: InputBorder.none,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your email';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (newValue) {
                      setState(() {
                        email.text = newValue!;
                      });
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: lightColor,
                  minimumSize: const Size(100, 40),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  )),
              onPressed: () {
                final isValid = formKey.currentState!.validate();
                if (isValid) {
                  formKey.currentState?.save();
                }
                if (isEmailValid(email.text) == false) {
                  QuickAlert.show(context: context, type: QuickAlertType.error, text: 'Email không đúng định dạng', confirmBtnColor: kprimaryColor);
                } else {
                  QuickAlert.show(context: context, type: QuickAlertType.success, text: 'GỬi thành công', confirmBtnColor: kprimaryColor);
                }
              },
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

  // SnackBar Success() {
  //   return const SnackBar(
  //     duration: Duration(seconds: 3),
  //     backgroundColor: Colors.green,
  //     content: Text(
  //       'Success',
  //       style: TextStyle(color: Colors.white),
  //     ),
  //   );
  // }
}
