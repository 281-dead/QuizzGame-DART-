import 'package:ailatrieuphu/UI/Login.dart';
import 'package:ailatrieuphu/UI/User_Info.dart';
import 'package:ailatrieuphu/widget/Colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class Regester extends StatefulWidget {
  const Regester({super.key});

  @override
  State<Regester> createState() => _RegesterState();
}

class _RegesterState extends State<Regester> {
  //khai báo đối tượng authentication của firebase
  final _auth = FirebaseAuth.instance;
  TextEditingController fullName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController conFilmPass = TextEditingController();
  bool isEmailValid(String email) {
    return RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$').hasMatch(email);
  }

  bool hiddenPass = true, isSubmit = false;
  Color currentColor = lightColor;

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF142850),
        title: const Text(
          'Đăng Ký',
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
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
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
                const SizedBox(
                  height: 30,
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
                      padding: const EdgeInsets.only(left: 15.0),
                      child: TextFormField(
                        controller: fullName,
                        decoration: const InputDecoration(
                          icon: Icon(
                            Icons.people,
                            color: Colors.black54,
                          ),
                          border: InputBorder.none,
                          hintText: 'Full Name',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter your Name';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
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
                        //autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: email,
                        decoration: const InputDecoration(
                          icon: Icon(
                            Icons.email,
                            color: Colors.black54,
                          ),
                          border: InputBorder.none,
                          hintText: 'Email',
                        ),
                        //maxLength: 50,
                        keyboardType: TextInputType.emailAddress,
                        validator: ((value) {
                          if (value!.isEmpty) {
                            return 'Enter your email';
                          } else {
                            return null;
                          }
                        }),
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
                      padding: const EdgeInsets.only(left: 5),
                      child: TextFormField(
                        controller: pass,
                        obscureText: hiddenPass,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: black,
                          ),
                          border: InputBorder.none,
                          hintText: 'Mật Khẩu',
                          suffixIcon: IconButton(
                            icon: hiddenPass ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
                            color: Colors.black54,
                            onPressed: () {
                              setState(() {
                                hiddenPass = !hiddenPass;
                              });
                            },
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return '                 Enter your PassWord';
                          } else if (value.length < 6) {
                            return '                 Password not enough characters';
                          } else {
                            return null;
                          }
                        },
                        onSaved: ((newValue) {
                          setState(() {
                            pass.text = newValue!;
                          });
                        }),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
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
                      padding: const EdgeInsets.only(left: 5),
                      child: TextFormField(
                        controller: conFilmPass,
                        obscureText: hiddenPass,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: black,
                          ),
                          border: InputBorder.none,
                          hintText: 'Nhập Lại Mật Khẩu',
                          suffixIcon: IconButton(
                            icon: hiddenPass ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
                            color: Colors.black54,
                            onPressed: () {
                              setState(() {
                                hiddenPass = !hiddenPass;
                              });
                            },
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return '                 Enter your ConfilmPassWord';
                          } else if (value.length < 6) {
                            return '                 Password not enough characters';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                        value: isSubmit,
                        activeColor: Colors.blue,
                        onChanged: ((value) {
                          setState(() {
                            isSubmit = !isSubmit;
                          });
                        }),
                      ),
                      Text(
                        'Bạn đồng ý với điều khoản và điều kiện của ứng dụng',
                        softWrap: true,
                        style: TextStyle(
                          fontSize: 13,
                          color: white.withOpacity(0.6),
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: currentColor,
                      minimumSize: const Size(320, 50),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                      )),
                  onPressed: isSubmit
                      ? () async {
                          final isValid = formKey.currentState!.validate();
                          if (isValid) {
                            formKey.currentState?.save();
                            if (email.text.isEmpty || pass.text.isEmpty || conFilmPass.text.isEmpty) {
                              QuickAlert.show(context: context, type: QuickAlertType.warning, text: 'Các trường  không được để trống', confirmBtnColor: kprimaryColor);
                            } else if (email.text.isNotEmpty && pass.text.isNotEmpty && conFilmPass.text.isNotEmpty) {
                              if (isEmailValid(email.text) && (pass.text == conFilmPass.text)) {
                                try {
                                  final User? user = (await _auth.createUserWithEmailAndPassword(email: email.text, password: pass.text)).user;
                                  if (user != null) {
                                    if (!user.emailVerified) {
                                      await user.sendEmailVerification();
                                    }
                                    await user.updateDisplayName(fullName.text);
                                    final user1 = _auth.currentUser!;
                                    const snackBar = SnackBar(content: Text('Đăng ký thành công'));
                                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => UserInfoScreen(user: user1)), (route) => false);
                                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                  } else {
                                    const snackBar = SnackBar(content: Text('Tài khoản không hợp lê'));
                                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                  }
                                } catch (e) {
                                  const snackBar = SnackBar(content: Text('Có lỗi xảy ra.'));
                                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                }
                              } else {
                                QuickAlert.show(context: context, type: QuickAlertType.error, confirmBtnColor: kprimaryColor, text: 'Email hoặc mật khẩu không đúng ');
                              }
                            } else {
                              QuickAlert.show(context: context, type: QuickAlertType.error, text: 'Đăng ký không thành công');
                            }
                          }
                        }
                      : null,
                  child: Text(
                    'Đăng Ký',
                    style: GoogleFonts.abel(
                      color: white.withOpacity(0.80),
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.only(right: 23),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Already have an account?",
                        style: GoogleFonts.abel(
                          color: white,
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          //route đăng ký
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()));
                        },
                        child: Text(
                          'Login',
                          style: GoogleFonts.abel(
                            color: white.withOpacity(0.9),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
