import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Package/tour_package_details.dart';
import 'package:untitled/Home/homepage.dart';

class TourPackageList extends StatefulWidget {
  const TourPackageList({super.key});

  @override
  State<TourPackageList> createState() => _TourPackageListState();
}

class _TourPackageListState extends State<TourPackageList> {
  String tourid = "";
  String name = "";
  String location = "";
  String duration = "";
  String cost = "";
  String image = "";
  String details = "";
  String guide = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Card(
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            decoration: InputDecoration(
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
                .collection('tour_package')
                .where('searchkey', arrayContains: name)
                .snapshots()
            : FirebaseFirestore.instance.collection('tour_package').snapshots(),
        builder: (context, snapshot) {
          return (snapshot.connectionState == ConnectionState.waiting)
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot data = snapshot.data!.docs[index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TourPackageDetails(
                                      tourid: data['tourid'],
                                      location: data['Location'],
                                      duration: data['Duration'],
                                      cost: data['Cost'],
                                      guide: data['guide'],
                                      details: data['details'],
                                      image: data['image'],
                                    )));
                      },
                      child: Row(children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Center(
                          heightFactor: 1.3,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: Material(
                              color: Colors.white,
                              elevation: 10,
                              borderRadius: BorderRadius.circular(21),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: InkWell(
                                splashColor: Colors.black,
                                /*onTap: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (context) =>
                    ConfirmHotelBooking(
                    hotelid: hotelid,
                    location: location,
                    name: name,
                    price: price,
                    division: division,
                    image: image)));
                    },*/
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    CircleAvatar(
                                      child: Image.network(
                                        data['image'],
                                        //data['Duration'],
                                        width: 140,
                                        height: 200,
                                        fit: BoxFit.fill,
                                      ),
                                      radius: 50,
                                      backgroundColor: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          data['Location'],
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black),
                                        ),
                                        Text(

                                          data['Duration'],
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black),
                                        ),
                                        Text(

                                          data['guide'],
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black),
                                        ),
                                        SizedBox(
                                          width: 200,
                                        )
                                      ],
                                    ),
                                     Column(
                                      children: [
                                        Text(
                                          data['Cost'],
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.cyan),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        )
                                      ],
                                    ),
                                    SizedBox(width: 10,),
                                    //),
                                  ],
                                ),

                                /*child: Container(
                        padding: EdgeInsets.only(top: 20),
                        child: Column(
                          children: [
                            ListTile(
                              splashColor: Colors.black,
                              title: Column(
                                children: [
                                  Text(
                                    data['Location'],
                                    //data['guide'],
                                    style: const TextStyle(
                                        fontSize: 20, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              leading: CircleAvatar(
                                child: Image.network(
                                  data['image'],
                                  //data['Duration'],
                                  width: 150,
                                  height: 200,
                                  fit: BoxFit.fill,
                                ),
                                radius: 50,
                                backgroundColor: Colors.white,
                              ),
                              subtitle: Column(
                                children: [
                                  Text(
                                    data['Duration'],
                                    style: const TextStyle (
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),

                                   Text(
                                    data['guide'],
                                    style: const TextStyle (
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              trailing: Text(
                                data['Cost'],
                                style: const TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const Divider(
                              thickness: 1,
                            )
                          ],
                        ),
                      ),*/
                              ),
                            ),
                          ),
                        ),
                      ]),
                    );
                  });
        },
      ),
    );
  }
}
