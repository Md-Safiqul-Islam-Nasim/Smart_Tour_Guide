import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled/booking/location_car_booking.dart';

class CarBooking extends StatefulWidget {
  const CarBooking({super.key});

  @override
  State<CarBooking> createState() => _CarBookingState();
}

class _CarBookingState extends State<CarBooking> {
  String image = "";
  String name = "";
  String capacity = "";
  String aircondition = "";
  String carid = "";
  String carnumber = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Card(
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: 'Search',
            ),
            onChanged: (val) {
              setState(() {
                name = val;
              });
            },
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: (name != "" && name != null)
              ? FirebaseFirestore.instance
                  .collection('car_booking')
                  .where('searchkey', arrayContains: name)
                  .snapshots()
              : FirebaseFirestore.instance
                  .collection('car_booking')
                  .snapshots(),
          builder: (context, snapshot) {
            return (snapshot.connectionState == ConnectionState.waiting)
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot data = snapshot.data!.docs[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LocationChoose(
                                        name: data['name'],
                                        image: data['image'],
                                        carid: data['carid'],
                                        capacity: data['capacity'],
                                        aircondition: data['aircondition'],
                                        carnumber: data['carnumber'],
                                      )));
                        },
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Center(
                              heightFactor: 1.3,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 12),
                                child: Material(
                                  color: Colors.lightBlueAccent,
                                  elevation: 10,
                                  borderRadius: BorderRadius.circular(21),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: InkWell(
                                    splashColor: Colors.black,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        CircleAvatar(
                                          radius: 50,
                                          backgroundColor: Colors.white,
                                          child: Image.network(
                                            data['image'],
                                            //data['Duration'],
                                            width: 200,
                                            height: 150,
                                            fit: BoxFit.scaleDown,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 0,
                                        ),
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                const Text(
                                                  "Model: ",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.black),
                                                ),
                                                Text(
                                                  data['name'],
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Text(
                                                  "Air Condition :",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      //fontWeight: FontWeight.bold,
                                                      color: Colors.black),
                                                ),
                                                Text(
                                                  data['aircondition'],
                                                  style: const TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Text(
                                                  "Capacity:",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      //fontWeight: FontWeight.bold,
                                                      color: Colors.black),
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  data['capacity'],
                                                  style: const TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Text(
                                                  "Car Number:",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      //fontWeight: FontWeight.bold,
                                                      color: Colors.black),
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  data['carnumber'],
                                                  style: const TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              width: 250,
                                            )
                                          ],
                                        ),

                                        //),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  );
          }),
    );
  }
}
