import 'package:flutter/material.dart';
import 'package:untitled/Home/homepage.dart';
import 'package:untitled/User/signuppage.dart';
import 'package:untitled/User/splash_screen.dart';

import 'package:firebase_core/firebase_core.dart';

import '../User/loginpage.dart';
void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'splash_screen',
    routes: {
      'splash_screen':(context) => SplashScreen(),
      'signuppage': (context) => MyRegistation(),
      'loginpage': (context) => LoginPage(),
      'homepage' : (context) => HomePage(),
     // 'homepage': (context) => MyLogin(),
      //'home' : (context) => HomePage()
    },
  ));
}