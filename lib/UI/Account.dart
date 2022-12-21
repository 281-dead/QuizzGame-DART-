import 'package:ailatrieuphu/widget/Colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Account extends StatefulWidget {
  Account({super.key, required this.user});
  User user;

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  late User _user;

  TextEditingController displayName = TextEditingController();
  @override
  void initState() {
    _user = widget.user;
    super.initState();
  }

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
                                size: 80,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                ),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {},
                child: Text(
                  _user.displayName!,
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
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: TextField(
                      controller: displayName,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.people, color: black),
                        border: InputBorder.none,
                        hintText: _user.displayName,
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
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email, color: black),
                        border: InputBorder.none,
                        hintText: _user.email!,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
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
                  if (_user.displayName != null && _user.email != null) {
                    _user.updateDisplayName(displayName.text);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Cập nhật thành công!')));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Có lỗi xảy ra!')));
                  }
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
