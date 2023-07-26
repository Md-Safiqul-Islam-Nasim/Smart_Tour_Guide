import 'package:flutter/material.dart';
import 'package:untitled/booking/bookingconfirm.dart';

class TourPackageDetails extends StatelessWidget {
  final String? tourid;
  final String? location;
  final String? duration;
  final String? cost;
  final String? details;
  final String? image;
  final String? guide;

  const TourPackageDetails(
      {super.key,
      this.tourid,
      this.location,
      this.duration,
      this.cost,
      this.guide,
      this.details,
      this.image, });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Package Details"),
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
                    location ?? "",
                    style:
                        const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "Guide Name :",
                    style: TextStyle(
                        color: Color(0xff668e8e),
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    guide ?? "  ",
                    style: const TextStyle(
                        color: Color(0xff668e8e),
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 130,
                  ),
                  const Text(
                    "Tour Cost:",
                    style: TextStyle(
                        color: Color(0xff668e8e),
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    cost ?? "",
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
                  const Text(
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
                  ),
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
                    "Tour Plan",
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
                        height: 150,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Text(
                            details ?? "",
                            textAlign: TextAlign.justify,
                            style: const TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
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
                          builder: (context) => BookingConfirm(
                                tourid: tourid,
                                location: location,
                                duration: duration,
                                cost: cost,
                                guide: guide,
                                details: details,
                                image: image,
                              )));
                },
                child: const Text(
                  'Confirm Package',
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
