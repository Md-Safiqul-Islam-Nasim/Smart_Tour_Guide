import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled/booking/carbooking.dart';
import 'package:untitled/provider/confirm_car_provider.dart';

class LocationChoose extends StatelessWidget {
  String image;
  String name;
  String capacity;
  String aircondition;
  String carid;
  String carnumber;

  LocationChoose({
    super.key,
    required this.name,
    required this.image,
    required this.carid,
    required this.capacity,
    required this.aircondition,
    required this.carnumber,
  });

  ConfirmCarProvider? confirmCarProvider;
  String selectedlocation = "0";
  /*void initState(){
    confirmCarProvider;
    super.initState();
  }*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Car Details"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            children: [
              Column(
                children: [
                  Image.network(
                    image!,
                    width: 400,
                    height: 300,
                    fit: BoxFit.fill,
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
              Row(children: [
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  "Car Number :",
                  style: TextStyle(
                      color: Color(0xff668e8e),
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  carnumber ?? "  ",
                  style: const TextStyle(
                      color: Color(0xff668e8e),
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ]),
              const SizedBox(
                width: 10,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "Air Condition :",
                    style: TextStyle(
                        color: Color(0xff668e8e),
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    aircondition ?? "",
                    style: const TextStyle(
                        color: Color(0xff668e8e),
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "Capacity :",
                    style: TextStyle(
                        color: Color(0xff668e8e),
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    capacity ?? "",
                    style: const TextStyle(
                        color: Color(0xff668e8e),
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: const [
                  Text(
                    "Choose Your PickUp Location :",
                    style: TextStyle(
                        color: Color(0xff668e8e),
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('location')
                            .snapshots(),
                        builder: (context, snapshot) {
                          List<DropdownMenuItem> locationlist = [];
                          if (!snapshot.hasData) {
                            const CircularProgressIndicator();
                          } else {
                            final locations =
                                snapshot.data?.docs.reversed.toList();
                            locationlist.add(
                               DropdownMenuItem(
                                value: "0",
                                child: Text('PickUp Location',),
                              ),
                            );
                            for (var location in locations!) {
                              locationlist.add(
                                DropdownMenuItem(
                                  value: location.id,
                                  child: Text(
                                    location['name'],
                                  ),
                                ),
                              );
                            }
                          }
                          return DropdownButton(
                            items: locationlist,
                            onChanged: (locationvalue) {
                              setState(() {
                                selectedlocation = locationvalue;
                              });
                              print(locationvalue);
                            },
                            value: selectedlocation,
                            isExpanded: false,
                          );
                        })
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: const [
                  Text(
                    "Choose Your Drop Location :",
                    style: TextStyle(
                        color: Color(0xff668e8e),
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('location')
                            .snapshots(),
                        builder: (context, snapshot) {
                          List<DropdownMenuItem> locationlist = [];
                          if (!snapshot.hasData) {
                            const CircularProgressIndicator();
                          } else {
                            final locations =
                                snapshot.data?.docs.reversed.toList();
                            locationlist.add(
                              const DropdownMenuItem(
                                value: "0",
                                child: Text('Drop Location'),
                              ),
                            );
                            for (var location in locations!) {
                              locationlist.add(
                                DropdownMenuItem(
                                  value: location.id,
                                  child: Text(
                                    location['name'],
                                  ),
                                ),
                              );
                            }
                          }
                          return DropdownButton(
                            items: locationlist,
                            onChanged: (locationvalue) {
                              setState(() {
                                selectedlocation = locationvalue;
                              });
                              print(locationvalue);
                            },
                            value: selectedlocation,
                            isExpanded: false,
                          );
                        })
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
                  confirmCarProvider?.confirmcar(
                      carid: carid,
                      name: name,
                      image: image,
                      carnumber: carnumber,
                      capacity: capacity,
                      aircondition: aircondition
                  );
                  Fluttertoast.showToast(msg: "Your Car Booked");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CarBooking()));
                },
                child: const Text(
                  'Confirm Your Car',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void setState(Null Function() param0) {}
}
