import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



import '../User/loginpage.dart';
import '../User/profile.dart';
import '../booking/bookingconfirm.dart';
import '../booking/carchoose.dart';

class Menubar extends StatefulWidget {
  const Menubar({Key? key}) : super(key: key);

  @override
  _MenubarState createState() => _MenubarState();
}

class _MenubarState extends State<Menubar> {
  String name="Name loading..",email="Email loadin...";

  void getData() async{
    User? user= await FirebaseAuth.instance.currentUser;
    var value= await FirebaseFirestore.instance.collection("user_data").doc(user?.uid).get();
    setState(() {
      name = value.data()!['name'];
      email = value.data()!['email'];
    });
  }
  void initState(){
    getData();
    super.initState();
  }

  final List drawerMenuListname = const [
    {
      "leading": Icon(
        Icons.account_circle,
        color: Colors.white,
      ),
      "title": "Profile",
      "trailing": Icon(
        Icons.chevron_right,
        color: Colors.white,
      ),
      "action_id": 1,
    },
    /*{
      "leading": Icon(
        Icons.add_chart_rounded,
        color: Color(0xFF13C0E3),
      ),
      "title": "My Order",
      "trailing": Icon(Icons.chevron_right),
      "action_id": 2,
    },*/
    {
      "leading": Icon(
        Icons.help,
        color: Colors.white,
      ),
      "title": "Help",
      "trailing": Icon(Icons.chevron_right,
        color: Colors.white,),
      "action_id": 3,
    },
    {
      "leading": Icon(
        Icons.settings,
        color: Colors.white,
      ),
      "title": "Settings",
      "trailing": Icon(Icons.chevron_right,
        color: Colors.white,),
      "action_id": 4,
    },
    {
      "leading": Icon(
        Icons.animation_rounded,
        color: Colors.white,
      ),
      "title": "About Us",
      "trailing": Icon(Icons.chevron_right,
        color: Colors.white,),
      "action_id": 5,
    },
    {
      "leading": Icon(
        Icons.exit_to_app,
        color: Color(0xFFD0CACA),
      ),
      "title": "Log Out",
      "trailing": Icon(Icons.chevron_right,
        color: Colors.white,),
      "action_id": 6,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
          width: 220,
          child: Drawer(
            backgroundColor: Color(0xff525f69),
            child: ListView(children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://rcpsg.ac.uk/images/people/default.jpg"),
                ),
                title: Text(name, style: TextStyle(color: Colors.white,),),
                subtitle: Text(email, style: TextStyle(color: Colors.white),),
              ),
              const SizedBox(
                height: 1,
              ),
              ...drawerMenuListname.map((sideMenuData) {
                return ListTile(
                  leading: sideMenuData['leading'],
                  title: Text(
                    sideMenuData['title'],
                  ),
                  trailing: sideMenuData['trailing'],
                  onTap: () {
                    Navigator.pop(context);
                    if (sideMenuData['action_id'] == 1) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>  UserProfile(),
                        ),
                      );
                    }
                    else if (sideMenuData['action_id'] == 2) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const CarChoose(),
                        ),
                      );
                    }
                    else if (sideMenuData['action_id'] == 6) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                    }
                    // else if (sideMenuData['action_id'] == 4) {
                    //   Navigator.of(context).push(
                    //     MaterialPageRoute(
                    //       builder: (context) => const SettingScreen(),
                    //     ),
                    //   );
                    // }
                  },
                );
              }).toList(),
            ],),
          ),
        ));
  }
}
