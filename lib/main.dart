import 'package:flutter/material.dart';
import 'pages/Welcome.dart';

void main() {
  runApp(const altp());
}

class altp extends StatelessWidget {
  const altp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}
