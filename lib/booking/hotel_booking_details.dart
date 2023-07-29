import 'package:flutter/material.dart';
import 'package:untitled/booking/hotel_booking_confirm.dart';

import 'hotelbooking.dart';

class HotelBookingDetails extends StatelessWidget {
  String hotelid;
  String image;
  String name;
  String location;
  String price;
  String division;
  String details;
  HotelBookingDetails(
      {super.key,
      required this.hotelid,
      required this.image,
      required this.name,
      required this.location,
      required this.price,
      required this.division,
      required this.details});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hotel Details"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                    child: Image.network(
                      image!,
                      width: 400,
                      height: 300,
                      fit: BoxFit.fill,
                    ),
                    /*radius: 196,
                    backgroundColor: Colors.white,*/
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    name ?? "",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "Division :",
                    style: TextStyle(
                        color: Color(0xff668e8e),
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    division ?? "  ",
                    style: const TextStyle(
                        color: Color(0xff668e8e),
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 130,
                  ),
                  const Text(
                    "Price :",
                    style: TextStyle(
                        color: Color(0xff668e8e),
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    price ?? "",
                    style: const TextStyle(
                        color: Color(0xff668e8e),
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  /*const Text(
                    "Tour Duration:",
                    style: TextStyle(
                        color: Color(0xff668e8e),
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    duration ?? "",
                    style: TextStyle(
                        color: Color(0xff668e8e),
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),*/
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "About Hotel",
                    style: TextStyle(
                        color: Color(0xff668e8e),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 200,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Text(
                            details ?? "",
                            textAlign: TextAlign.justify,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              MaterialButton(
                color: Colors.lightBlueAccent,
                minWidth: 300,
                height: 50,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                onPressed: () {
                  /*if(_formkey.currentState!.validate()){
                    _auth.signInWithEmailAndPassword(
                        email: _email.text, password: _pass.text
                    ).then((uid) => {
                      Fluttertoast.showToast(msg: "Login Successfully"),
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage())),
                    }).catchError((e){
                      Fluttertoast.showToast(msg: "Invalid Email or Password");
                    });
                  }*/
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HotelBookingConfirm(
                                hotelid: hotelid,
                                location: location,
                                division: division,
                                price: price,
                                image: image,
                                name: name,
                                details: details,
                                //image: image,
                              )));
                },
                child: const Text(
                  'Confirm Hotel',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
