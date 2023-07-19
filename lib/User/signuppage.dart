
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled/Home/homepage.dart';
//import 'loginpage.dart';



class MyRegistation extends StatefulWidget {
  const MyRegistation({Key? key}) : super(key: key);

  @override
  State<MyRegistation> createState() => _MyRegistationState();
}

class _MyRegistationState extends State<MyRegistation> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _name = new TextEditingController();
  final TextEditingController _email = new TextEditingController();
  final TextEditingController _phone = new TextEditingController();
  final TextEditingController _pass = new TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Color(0xff5bc0de),
            Color(0xff5bc0de),
                Color(0xff3f869b),
                Color(0xff3f869b),
            ]
          )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(

              padding: EdgeInsets.only(left : 120 , top: 150),
              child:  Text(
                'Sign Up',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40 ,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(

                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height *0.30,
                    right : 35 ,
                    left: 35
                ),

                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 0,
                      ),

                      Text(
                        '',
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
                          controller: _name,
                          validator: (value){
                            if(value!. isEmpty){
                              return ("Please Enter Your Name");
                            }
                            return null;
                          },
                          onSaved: (value){
                            _name.text = value!;
                          },
                          textInputAction: TextInputAction.next,
                          obscureText: false,
                          style: TextStyle(
                              color: Colors.black
                          ),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(top :14),
                              prefixIcon: Icon(
                                  Icons.person,
                                  color: Color(0xff5bc0de)
                              ),
                              hintText: 'Enter your Name',
                              hintStyle: TextStyle(
                                  color: Colors.black
                              )
                          ),
                        ),
                      ),
                      SizedBox(height: 35),
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 6,
                                  offset: Offset(0 , 2)
                              )
                            ]
                        ),
                        height: 50,
                        child: TextFormField(
                          autofocus: false,
                          controller: _email,
                          validator: (value){
                            if(value!.isEmpty){
                              return("Email Address Required");
                            }
                            // if(!EmailValidator.validate(value , true)){
                            //   return ("Enter Valid Email Address");
                            // }
                            return null;
                          },
                          onSaved: (value){
                            _email.text = value!;
                          },
                          textInputAction: TextInputAction.next,
                          obscureText: false,
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
                              hintText: 'Enter your Email',
                              hintStyle: TextStyle(
                                  color: Colors.black
                              )
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      Text(
                        '',
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
                                  color: Colors.black,
                                  blurRadius: 6,
                                  offset: Offset(0 , 2)
                              )
                            ]
                        ),
                        height: 50,
                        child: TextFormField(
                          autofocus: false,
                          controller: _phone,
                          validator: (value){
                            if(value!.isEmpty){
                              return ("Phone Number is Required for Signing");
                            }
                            if(value.length < 11){
                              return ("11 character required for Phone Number");
                            }
                            if(value.length > 11){
                              return ("11 character required for Phone Number");
                            }
                          },
                          onSaved: (value){
                            _phone.value = value! as TextEditingValue;
                          },
                          textInputAction: TextInputAction.next,
                          obscureText: false,
                          style: TextStyle(
                              color: Colors.black
                          ),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(top :14),
                              prefixIcon: Icon(
                                  Icons.phone,
                                  color: Color(0xff5bc0de)
                              ),
                              hintText: 'Enter your Phone Number',
                              hintStyle: TextStyle(
                                  color: Colors.black
                              )
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '',
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
                          validator: (value){
                            if(value!.isEmpty){
                              return ("Password is required for Signing");
                            }
                            if(value.length < 6){
                              return ("Minimum 6 character Required");
                            }

                          },
                          onSaved: (value){
                            _phone.text = value!;
                          },
                          textInputAction: TextInputAction.done,
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
                              hintText: 'Enter your Password',
                              hintStyle: TextStyle(
                                  color: Colors.black87
                              )
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 100,
                      ),
                      MaterialButton(
                        color: Colors.white,
                        minWidth: 300,
                        height: 50,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        onPressed: (){
                          if(_formKey.currentState!.validate()){
                            Map<String , dynamic> data = {
                              "name" : _name.text,
                              "phone" : _phone.text,
                              "email" : _email.text,
                              "pass": _pass.text
                            };
                            _auth.createUserWithEmailAndPassword(
                                email: _email.text, password: _pass.text)
                            .then((value) => {
                              FirebaseFirestore.instance
                              .collection("user_data")
                              .doc(value.user?.uid)
                              .set(data),
                              Fluttertoast.showToast(
                                  msg: "Registration Successfully"
                              ),
                              Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage())),
                            })
                            .catchError((e){
                              Fluttertoast.showToast(msg: "Check Your Email and Password");
                            });
                          }
                          //Navigator.push(context,MaterialPageRoute(builder: (context)=> LoginPage()));
                        },
                        child: Text('Sign Up',style: TextStyle(color: Colors.black,fontSize: 20),),
                      ),
                      SizedBox(
                        height: 150,
                      ),

                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  register() {}

  home() {}

  resueableTextField(String s, IconData phone, bool bool, phone2) {}
}
