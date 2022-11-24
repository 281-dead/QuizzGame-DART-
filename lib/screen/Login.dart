import 'package:ailatrieuphu/widget/Colors.dart';
import 'package:ailatrieuphu/screen/Fogot.dart';
import 'package:ailatrieuphu/screen/Register.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  bool hiddenPass = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: kprimaryColor,
        centerTitle: true,
      ),
      backgroundColor: kprimaryColor,
      body: SingleChildScrollView(
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
                          padding: EdgeInsets.only(left: 15.0),
                          child: TextField(
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.people,
                                color: Colors.black54,
                              ),
                              border: InputBorder.none,
                              hintText: 'Tài Khoản',
                            ),
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
                          child: TextField(
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
                          ),
                        ),
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Login(),
                          ),
                        );
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
        ),
      ),
    );
  }
}
