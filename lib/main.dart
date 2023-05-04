import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:yathaarth_gyaanam/intro/firstpage.dart';
import 'package:yathaarth_gyaanam/screen/Choice.dart';
import 'package:yathaarth_gyaanam/screen/videoplay.dart';
import 'package:yathaarth_gyaanam/screen/vidframe.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options:  const FirebaseOptions(apiKey:"AIzaSyCVX-IwWJiblUzwJMzq3D9VzTuRz2XAyzM",
        appId: "1:886705306547:android:cdd8999434b0b89bca69c6",
        messagingSenderId: "886705306547",
        projectId: "major-8c498"),

  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yathaarth Gyaanam',

      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.

        primarySwatch: Colors.orange,
      ),
      home:FirstPage(),
    );
  }
}

