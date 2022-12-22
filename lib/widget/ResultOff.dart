import 'package:ailatrieuphu/UI/Homepage.dart';
import 'package:ailatrieuphu/UI/NewGameOff.dart';
import 'package:ailatrieuphu/widget/Colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ResultOff extends StatefulWidget {
  const ResultOff({
    super.key,
    required this.result,
    required this.questionLenght,
    required this.onPress,
  });
  final int result;
  final int questionLenght;
  final VoidCallback onPress;

  @override
  State<ResultOff> createState() => _ResultOffState();
}

class _ResultOffState extends State<ResultOff> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: background,
      content: Padding(
        padding: const EdgeInsets.all(60),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Kết Quả',
              style: TextStyle(color: white, fontSize: 25),
            ),
            const SizedBox(height: 20),
            CircleAvatar(
              radius: 70,
              backgroundColor: widget.result == widget.questionLenght * 10
                  ? correct
                  : widget.result > 0
                      ? const Color.fromARGB(255, 170, 160, 48)
                      : incorrect,
              child: Text(
                '${widget.result}/${widget.questionLenght * 10}',
                style: const TextStyle(
                  fontSize: 30,
                  color: white,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Text(
              widget.result == widget.questionLenght * 10
                  ? 'Giỏi Quá!'
                  : widget.result > 0
                      ? 'Cố gắng hơn nữa!'
                      : 'Thử lại nào!',
              style: const TextStyle(
                color: white,
                fontSize: 18,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 28),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LinhVucOff()));
              },
              child: const Text(
                'Bắt đầu lại',
                style: TextStyle(
                  color: lightBlue,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.7, //khoảng cách giữa các ký tự
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
