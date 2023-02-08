import 'package:ailatrieuphu/UI/Welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main(args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

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
