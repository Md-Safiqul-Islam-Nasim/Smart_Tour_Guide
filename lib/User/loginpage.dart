import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled/Home/homepage.dart';
import 'package:untitled/User/signuppage.dart';

class LoginPage extends StatefulWidget{
  _LoginPageState createState() => _LoginPageState();
}



class _LoginPageState extends State <LoginPage>{
  bool isRememberMe = false;
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _email = new TextEditingController();
  final TextEditingController _pass = new TextEditingController();
  final _auth = FirebaseAuth.instance;

  Widget buildemail(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(0 , 2)
                )
              ]
          ),
          height: 50,
          child: TextFormField(
            autofocus: false,
            controller: _email,
            validator: (value) {
              if (value!.isEmpty) {
                return ("Email Addressed Required");
              }
              // if (!EmailValidator.validate(value, true)) {
              //   return ("Enter Valid Email Addressed");
              // }
              return null;
            },
            onSaved: (value){
              _email.text = value!;
            },
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
                color: Colors.black
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top :14),
                prefixIcon: Icon(
                    Icons.email,
                    color: Color(0xff5bc0de)
                ),
                hintText: 'Email',
                hintStyle: TextStyle(
                    color: Colors.black87
                )
            ),
          ),
        )
      ],
    );
  }
  Widget buildpassword(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(0 , 2)
                )
              ]
          ),
          height: 50,
          child: TextFormField(
            autofocus: false,
            controller: _pass,
            validator: (value) {
              if (value!.isEmpty) {
                return ("Password is required for Signing");
              }
              if (value.length < 6) {
                return ("Minimum 6 character Required");
              }
            },
            onSaved: (value) {
              _pass.text = value!;
            },
            textInputAction: TextInputAction.next,
            obscureText: true,
            style: TextStyle(
                color: Colors.black26
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top :14),
                prefixIcon: Icon(
                    Icons.password,
                    color: Color(0xff5bc0de)
                ),
                hintText: 'Password',
                hintStyle: TextStyle(
                    color: Colors.black87
                )
            ),
          ),
        )
      ],
    );
  }
  Widget buildforgotpassword(){
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () => print("Forgot Password Pressed"),
        child : Text(
          'Forgot Password?',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
  Widget buildremembermebtn(){
    return Container(
      height: 20,
      child: Row(
        children: <Widget>[
          Theme(
              data: ThemeData(unselectedWidgetColor: Colors.white),
              child: Checkbox(
                value: isRememberMe,
                checkColor: Colors.green,
                activeColor: Colors.white,
                onChanged: (value){
                  setState((){
                    isRememberMe = value!;
                  });
                },
              )
          ),
          Text(
            'Remember Me',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
            ),
          )
        ],
      ),
    );
  }
  Widget build(BuildContext context){
    return Scaffold(
      body: AnnotatedRegion <SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: <Widget>[
              Container(
                height : double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xff5bc0de),
                      Color(0xff5bc0de),
                      Color(0xff3f869b),
                      Color(0xff3f869b),
                    ],

                  )
                ),
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 190
                  ),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Sign In',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40 ,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 40),
                        buildemail(),
                        SizedBox(height: 20),
                        buildpassword(),
                        buildforgotpassword(),
                        buildremembermebtn(),
                        SizedBox(height: 40),
                        MaterialButton(
                          color: Colors.white,
                          minWidth: 300,
                          height: 50,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          onPressed: (){
                             if(_formkey.currentState!.validate()){
                               _auth.signInWithEmailAndPassword(
                                   email: _email.text, password: _pass.text
                               ).then((uid) => {
                                     Fluttertoast.showToast(msg: "Login Successfully"),
                                 Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage())),
                               }).catchError((e){
                                     Fluttertoast.showToast(msg: "Invalid Email or Password");
                               });
                             }
                             //Navigator.push(context,MaterialPageRoute(builder: (context)=> HomePage()));

                          },
                          child: Text('Login',style: TextStyle(color: Colors.black87,fontSize: 20),),
                        ),
                        //buildLoginbtn(),
                        SizedBox(height: 20),
                        RichText(text: TextSpan(
                            text: 'Don\'t have an account?',
                            style: TextStyle(color: Colors.white,fontSize: 18),
                            children: [TextSpan(
                                text: ' Create',
                                style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),
                                recognizer: TapGestureRecognizer()..onTap=(){
                                  Navigator.push(context,MaterialPageRoute(builder: (context)=> MyRegistation()));
                                }
                            )
                            ]
                        )
                        ),
                        //buildSignupbtn(),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  //signuppage() {}
}