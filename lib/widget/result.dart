import 'package:ailatrieuphu/widget/Colors.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({super.key, required this.result, required this.questionLenght, required this.onPress});
  final int result;
  final int questionLenght;
  final VoidCallback onPress;
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
              backgroundColor: result == questionLenght * 10
                  ? correct
                  : result > 0
                      ? const Color.fromARGB(255, 170, 160, 48)
                      : incorrect,
              child: Text(
                '$result/${questionLenght * 10}',
                style: const TextStyle(
                  fontSize: 30,
                  color: white,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Text(
              result == questionLenght * 10
                  ? 'Giỏi Quá!'
                  : result > 0
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
              onTap: onPress,
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
