

import 'package:flutter/material.dart';
import 'package:untitled/Home/homepage.dart';
import 'package:untitled/User/signuppage.dart';
import 'package:untitled/User/splash_screen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:untitled/provider/confirm_car_provider.dart';
import 'package:untitled/provider/confirm_hotel_provider.dart';
import 'package:untitled/provider/confirm_tour_provider.dart';
import '../User/loginpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ConfirmTourProvider>
          (create: (context)=> ConfirmTourProvider()),
        ChangeNotifierProvider<ConfirmHotelProvider>
          (create: (context)=> ConfirmHotelProvider()),
        ChangeNotifierProvider<ConfirmCarProvider>
          (create: (context)=> ConfirmCarProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'splash_screen',
        routes: {
          'splash_screen': (context) => SplashScreen(),
          'signuppage': (context) => MyRegistation(),
          'loginpage': (context) => LoginPage(),
          'homepage': (context) => HomePage(),

          // 'homepage': (context) => MyLogin(),
          //'home' : (context) => HomePage()
        },
      ),
    ),
  );
}
