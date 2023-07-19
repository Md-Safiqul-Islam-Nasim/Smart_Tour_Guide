import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/User/update_profile.dart';

import '../Home/homepage.dart';

class UserProfile extends StatefulWidget {
/*
  const UserProfile({super.key});
*/

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  //String name;
  String name = "Name Loading...";
  String email = "email Loading...";
  String password = "password Loading...";
  String phone = "Phone Number Loading...";

  get isObscurePassword => true;
  void getData() async {
    User? user = await FirebaseAuth.instance.currentUser;
    var vari = await FirebaseFirestore.instance
        .collection("user_data")
        .doc(user?.uid)
        .get();
    setState(() {
      name = vari.data()!['name'];
      email = vari.data()!['email'];
      password = vari.data()!['pass'];
      phone = vari.data()!['phone'];
    });
  }

  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "User Profile",
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: (){
            Navigator.push(context,MaterialPageRoute(builder: (context)=> HomePage()));
          },
        ),
      ), 
      body : SafeArea(

        child: Container(
          padding: EdgeInsets.only(left: 15, top: 20, right: 15),
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(width: 4, color: Colors.white),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1))
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('image/profile.png'),
                          )),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  SizedBox(height: 50),
                  buildTextField("Full Name" , name , false),
                  buildTextField("Email Address" , email , false),
                  buildTextField("Password" , password , true),
                  buildTextField("Phone Number0." , phone , false),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context)=> Update_Profile()));
                        },
                        child: Text("Edit Profile" , style: TextStyle(
                            fontSize: 20,
                            letterSpacing :2 ,
                            color: Colors.white
                        )),

                      ),

                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );

  }
  Widget buildTextField(String labelText, String placeholder, bool ispasswordtextfield){
    return Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: TextField(
        enabled: false,
        obscureText: ispasswordtextfield? isObscurePassword :false,
        decoration: InputDecoration(
          /*suffixIcon: ispasswordtextfield ?
              IconButton(
                icon: Icon(Icons.remove_red_eye , color: Colors.grey,),
                  onPressed: (){}
              ): null,
              contentPadding: EdgeInsets.only(bottom: 5),*/
            //prefixIcon: Icons.edit,
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )
        ),
      ),
    );
  }
}
