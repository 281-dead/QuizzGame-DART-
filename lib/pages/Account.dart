import 'package:ailatrieuphu/widget/Colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kprimaryColor,
        title: Text(
          'Quản Lý Tài Khoản',
          style: GoogleFonts.abel(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: white,
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
              const SizedBox(height: 60),
              ClipOval(
                child: Image.asset(
                  'assets/images/avatar.png',
                  fit: BoxFit.cover,
                  height: 180,
                  width: 180,
                ),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Đổi hình đại diện',
                  style: TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    color: Colors.yellow.withOpacity(0.8),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 30),
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
                        prefixIcon: Icon(Icons.people, color: black),
                        border: InputBorder.none,
                        hintText: 'Tài Khoản',
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
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
                        prefixIcon: Icon(Icons.email, color: black),
                        border: InputBorder.none,
                        hintText: 'Email',
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
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
                        prefixIcon: Icon(Icons.lock, color: black),
                        border: InputBorder.none,
                        hintText: 'Mật Khẩu',
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
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
                        prefixIcon: Icon(Icons.lock, color: black),
                        border: InputBorder.none,
                        hintText: 'Nhập Lại Mật Khẩu',
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
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
                  'Cập Nhật',
                  style: GoogleFonts.abel(
                    color: white,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
