import 'package:flutter/material.dart';
import 'package:google_login/view/home.dart';
import 'package:google_login/view/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_login/view/news.dart';
import 'package:google_login/view/profie.dart';
import 'package:google_login/view/signin.dart';
import 'package:google_login/view/splash.dart';
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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Splash(),
    );
  }
}

