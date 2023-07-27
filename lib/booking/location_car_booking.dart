import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class LocationChoose extends StatelessWidget {
  final String? image;
  final String? name;
  final String? capacity;
  final String? aircondition;
  final String? carid;
  final String? carnumber;

  const LocationChoose({
    super.key,
    this.name,
    this.image,
    this.carid,
    this.capacity,
    this.aircondition,
    this.carnumber,
  });

  @override
  Widget build(BuildContext context) {
    String selectedClient = "0";
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
              SizedBox(height: 20 ,),
              Row(
                children: [
                  Text(
                    "Choose Your PickUp Location :",
                    style: TextStyle(
                        color: Color(0xff668e8e),
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Column(
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
                              child: Text('Select Picup Location'),
                            ),
                          );
                          for (var location in locations!) {
                            locationlist.add(
                              DropdownMenuItem(
                                  value: location.id,
                                  child: Text(
                                    location['name'],
                                  )),
                            );
                          }
                        }
                        return DropdownButton(
                          items: locationlist,
                          onChanged: (locationlistvalue) {
                            setState(() {
                              selectedClient = locationlistvalue;
                            });
                            print(locationlistvalue);
                          },
                          value: selectedClient,
                          isExpanded: false,
                        );
                      }),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void setState(Null Function() param0) {}
}
