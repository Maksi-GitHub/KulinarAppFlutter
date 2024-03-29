import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kulinar/pages/home_page.dart';
import 'firebase_options.dart';

void main() async{
  runApp(const MyApp()); 
  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        cardColor: Colors.red, // Цвет курсора
        textSelectionTheme: const TextSelectionThemeData(
          selectionColor: Colors.red, // Цвет выделения текста
        ),
      ),
      home: HomePage(),
    );
  }
}