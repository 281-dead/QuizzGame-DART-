import 'package:ailatrieuphu/pages/Welcome.dart';
import 'package:ailatrieuphu/widget/Colors.dart';
import 'package:ailatrieuphu/screen/Fogot.dart';
import 'package:ailatrieuphu/screen/Register.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import '../pages/Homepage.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool hiddenPass = true;
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
                          autovalidateMode: AutovalidateMode.onUserInteraction,
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
                        autovalidateMode: AutovalidateMode.onUserInteraction,
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
                            return 'Enter your PassWord';
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
                      onPressed: () {
                        //Lưu trạng thái hiện tại của form khi thỏa mãn validator
                        final isValid = formKey.currentState!.validate();
                        if (isValid) {
                          formKey.currentState?.save();
                        }

                        if (email.text.isEmpty || password.text.isEmpty) {
                          QuickAlert.show(context: context, type: QuickAlertType.warning, text: 'Email hoặc mật khẩu không được để trống', confirmBtnColor: kprimaryColor);
                        } else if (email.text.isNotEmpty && password.text.isNotEmpty) {
                          if (isEmailValid(email.text) && password.text == '123456') {
                            //QuickAlert.show(
                            //   context: context, type: QuickAlertType.loading, text: 'Đăng nhập thành công', confirmBtnColor: kprimaryColor, autoCloseDuration: const Duration(seconds: 2));
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomePage(),
                                ),
                                (route) => false);
                          } else {
                            QuickAlert.show(context: context, type: QuickAlertType.error, confirmBtnColor: kprimaryColor, text: 'Email hoặc mật khẩu không đúng ');
                          }
                        } else {
                          QuickAlert.show(context: context, type: QuickAlertType.error, text: 'Đăng nhập không thành công');
                        }

                        // var message = const SnackBar(
                        //   content: Text('Login success!'),
                        // );
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      'assets/images/facebook.png',
                      fit: BoxFit.cover,
                      height: 50,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      'assets/images/google.jpg',
                      fit: BoxFit.cover,
                      height: 50,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
