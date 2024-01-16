import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_code_challenge/home_page.dart';
import 'package:flutter_code_challenge/dice_provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => DiceProvider())],
      child: const MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.white,
          body: HomePage(),
        ),
      ),
    );
  }
}
