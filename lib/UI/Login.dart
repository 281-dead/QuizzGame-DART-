import 'package:ailatrieuphu/UI/User_Info.dart';
import 'package:ailatrieuphu/UI/Welcome.dart';
import 'package:ailatrieuphu/utils/authentication.dart';
import 'package:ailatrieuphu/widget/Colors.dart';
import 'package:ailatrieuphu/UI/Fogot.dart';
import 'package:ailatrieuphu/UI/Register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:flutter/material.dart';

import '../widget/GoogleSignInButton.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuth Auth = FirebaseAuth.instance;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool hiddenPass = true;
  final String loginStatus = "";
  bool isEmailValid(String email) {
    return RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$').hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: kprimaryColor,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WelcomeScreen(),
                  ),
                  (route) => false,
                );
              },
              icon: const Icon(Icons.exit_to_app_outlined))
        ],
      ),
      backgroundColor: kprimaryColor,
      body: Form(
        key: formKey,
        child: ListView(children: [
          Column(
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
              Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 60, left: 60),
                      child: Text(
                        ' Bạn đã quay trở lại,'
                        'đăng nhập và vượt qua thử thách nào',
                        softWrap: true,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lato(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: white.withOpacity(0.7),
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      decoration: BoxDecoration(
                        color: white,
                        border: Border.all(
                          color: white,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(
                        padding: const EdgeInsets.only(left: 10),
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
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      decoration: BoxDecoration(
                        color: white,
                        border: Border.all(
                          color: white,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextFormField(
                        controller: password,
                        //autovalidateMode: AutovalidateMode.onUserInteraction,
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
                            return 'Password not enough characters';
                          } else {
                            return null;
                          }
                        },
                        onSaved: ((newValue) {
                          setState(() {
                            password.text = newValue!;
                          });
                        }),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              //route sang forgot
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const ForgotPassword()));
                            },
                            child: Text(
                              'Forgot PassWord',
                              style: GoogleFonts.abel(
                                color: white.withOpacity(0.9),
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: lightColor,
                          minimumSize: const Size(320, 50),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                          )),
                      onPressed: () async {
                        //Lưu trạng thái hiện tại của form khi thỏa mãn validator
                        final isValid = formKey.currentState!.validate();
                        if (isValid) {
                          formKey.currentState?.save();
                        }
                        if (email.text.isEmpty || password.text.isEmpty) {
                          QuickAlert.show(context: context, type: QuickAlertType.warning, text: 'Email hoặc mật khẩu không được để trống', confirmBtnColor: kprimaryColor);
                        } else if (email.text.isNotEmpty && password.text.isNotEmpty) {
                          if (isEmailValid(email.text)) {
                            signInWithEmailPassword(context);
                          } else {
                            QuickAlert.show(context: context, type: QuickAlertType.error, confirmBtnColor: kprimaryColor, text: 'Email hoặc mật khẩu không đúng ');
                          }
                        } else {
                          QuickAlert.show(context: context, type: QuickAlertType.error, text: 'Đăng nhập không thành công');
                        }
                      },
                      child: Text(
                        'Login',
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
                            "Don't have an account?",
                            style: GoogleFonts.abel(
                              color: white,
                              fontSize: 16,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              //route đăng ký
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const Regester()));
                            },
                            child: Text(
                              'Sign up',
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
              const SizedBox(
                width: 10,
              ),
              FutureBuilder(
                  future: Authentication.initializeFirebase(context: context),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Text('Error initializing Firebase');
                    } else if (snapshot.connectionState == ConnectionState.done) {
                      return GoogleSignInButton();
                    }
                    return const CircularProgressIndicator(
                      color: incorrect,
                    );
                  }),
            ],
          ),
        ]),
      ),
    );
  }

  void signInWithEmailPassword(BuildContext context) async {
    try {
      final User user = (await Auth.signInWithEmailAndPassword(email: email.text, password: password.text)).user!;
      if (!user.emailVerified) {
        await user.sendEmailVerification();
      }
      const snackBar = SnackBar(content: Text('Đăng nhập thành công'));
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => UserInfoScreen(user: user)));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } catch (e) {
      print(e);
    }
  }
}
