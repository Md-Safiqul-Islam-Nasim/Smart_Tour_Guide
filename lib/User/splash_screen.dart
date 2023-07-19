import 'package:flutter/material.dart';
import 'package:untitled/User/splash_services.dart';


class SplashScreen extends StatefulWidget{
  const SplashScreen({key}) : super(key : key);

  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>{

  SplashServices splashScreen = SplashServices();
  void initState(){
    super.initState();
    splashScreen.isLogin(context);
  }

  Widget build(BuildContext context){
    return const Scaffold(
      backgroundColor: Color(0xff133337),
      body: Center(
        child: Text("Smart Tour Guide", style: TextStyle(fontSize: 30 , fontWeight: FontWeight.bold , color: Colors.white),),
      ),
    );
  }
}