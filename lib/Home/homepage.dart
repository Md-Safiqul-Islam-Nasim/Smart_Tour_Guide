import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/about/aboutus.dart';
import 'package:untitled/booking/carbooking.dart';


import 'package:untitled/User/signuppage.dart';
import 'package:untitled/Package/tour_package.dart';

import '../booking/carchoose.dart';
import '../booking/hotelbooking.dart';
import 'menubar.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

//                                                                       login                                                    //
class _HomePageState extends State<HomePage> {
  // String get image => null;



  @override
  // TODO: implement widget
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Menubar(),

      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text('Home',
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            )),
        /*actions: const [
          CircleAvatar(
            radius: 18,
            backgroundColor: Color(0xff5bc0de),
            child: Icon(Icons.search, size: 24, color: Colors.black,),
          ),
        ],*/
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://img.traveltriangle.com/blog/wp-content/uploads/2019/03/Kawasan-falls_cover-image.jpg'),
                ),
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Expanded(
                      child: Column(
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(right: 145),
                            //padding: const EdgeInsets.only(right: 40 ),
                            child: Text(
                              'Have stories to tell',
                              style: TextStyle(
                                fontSize: 25,
                                color : Colors.white,
                                fontWeight: FontWeight.bold
                              ),
                              ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 130),
                            child: Text(
                              'not stuff to show',
                              style: TextStyle(
                                  fontSize: 20,
                                  color : Colors.white,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),

                        ],
                      )
                  )
                ],
              ),
            ),
            Row(

              children: [
                const SizedBox(width: 20,),
                Center(
                  heightFactor: 1.5,
                  child: Material(
                    color: Colors.lightBlueAccent,
                    elevation: 8,
                    borderRadius: BorderRadius.circular(21),
                    clipBehavior: Clip.antiAliasWithSaveLayer,

                    child: InkWell(
                      splashColor: Colors.black,
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=> const TourPackageList()));
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Ink.image(
                            image: const NetworkImage('https://previews.123rf.com/images/andyadi/andyadi1802/andyadi180200451/94972448-vector-logo-design-of-ocean-sea-water-beach-summer-sailing-tourism-for-travel-tour-yacht-hotel.jpg'),
                            height: 150,
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(height: 6,),
                          const Text(
                            'Tour Package',
                            style: TextStyle(fontSize: 22 , color: Colors.white),
                          ),
                          const SizedBox(height: 6),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 40,),
                Center(
                  child: Material(
                    color: Colors.lightBlueAccent,
                    elevation: 8,
                    borderRadius: BorderRadius.circular(21),
                    clipBehavior: Clip.antiAliasWithSaveLayer,

                    child: InkWell(
                      splashColor: Colors.black,
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=> const HotelBooking()));
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Ink.image(
                            image: const NetworkImage('https://img.freepik.com/premium-vector/booking-hotel-online-tiny-woman-search-choose-reservation-hotel-apartment-smartphone-app_501813-854.jpg?w=2000'),
                            height: 150,
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(height: 6,),
                          const Text(
                            'Hotel Booking',
                            style: TextStyle(fontSize: 22 , color: Colors.white),
                          ),
                          const SizedBox(height: 6),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5,),

              ],
            ),
            Column(
              children: [
                const SizedBox(height: 20,),
                Center(
                  child: Material(
                    color: Colors.lightBlueAccent,
                    elevation: 8,
                    borderRadius: BorderRadius.circular(21),
                    clipBehavior: Clip.antiAliasWithSaveLayer,

                    child: InkWell(
                      splashColor: Colors.black,
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=> const CarBooking()));
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Ink.image(
                            image: const NetworkImage('https://cdn.dribbble.com/users/4756955/screenshots/10796658/online_car_booking_4x.jpg'),
                            height: 150,
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(height: 6,),
                          const Text(
                            'Car Booking',
                            style: TextStyle(fontSize: 22 , color: Colors.white),
                          ),
                          const SizedBox(height: 6),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),

      ),
    );
  }
}
