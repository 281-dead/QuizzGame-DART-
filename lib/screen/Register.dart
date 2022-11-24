import 'package:ailatrieuphu/screen/Login.dart';
import 'package:ailatrieuphu/widget/Colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Regester extends StatefulWidget {
  const Regester({super.key});

  @override
  State<Regester> createState() => _RegesterState();
}

class _RegesterState extends State<Regester> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  bool hiddenPass = true, isSubmit = false;
  Color currentColor = lightColor;
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
                        hintText: 'Full Name',
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
                  child: const Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.email,
                          color: black,
                        ),
                        border: InputBorder.none,
                        hintText: 'Email',
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
                    ? () {
                        setState(() {});
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
    );
  }
}
