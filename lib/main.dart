import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'View/Screens/home_screen.dart';
import 'firebase_options.dart';

void main() async {
WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mes Pro',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontFamily: 'Lexend'),
          bodyMedium: TextStyle(fontFamily: 'Lexend'),
          bodySmall: TextStyle(fontFamily: 'Lexend'),
          displayLarge: TextStyle(fontFamily: 'Lexend'),
          displayMedium: TextStyle(fontFamily: 'Lexend'),
          displaySmall: TextStyle(fontFamily: 'Lexend'),
          titleSmall: TextStyle(fontFamily: 'Lexend'),
          titleMedium: TextStyle(fontFamily: 'Lexend'),
          titleLarge: TextStyle(fontFamily: 'Lexend'),
          labelLarge: TextStyle(fontFamily: 'Lexend'),
          labelMedium: TextStyle(fontFamily: 'Lexend'),
          labelSmall: TextStyle(fontFamily: 'Lexend'),
          headlineLarge: TextStyle(fontFamily: 'Lexend'),
          headlineMedium: TextStyle(fontFamily: 'Lexend'),
          headlineSmall: TextStyle(fontFamily: 'Lexend'),
        ),
        useMaterial3: false,
      ),
      home: const HomeScreen(),
    );
  }
}
