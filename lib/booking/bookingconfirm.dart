import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Package/tour_package.dart';
import '../Package/tour_package_details.dart';
import '../provider/confirm_tour_provider.dart';
import 'package:provider/provider.dart';


class BookingConfirm extends StatelessWidget {
  String tourid;
  String location;
  String duration;
  String cost;
  String details;
  String image;
  String guide;
   BookingConfirm({
    super.key,
    required this.tourid,
    required this.location,
    required this.duration,
    required this.cost,
    required this.details,
    required this.image,
    required this.guide,
  });
  late ConfirmTourProvider confirmTourProvider;
  @override
  Widget build(BuildContext context) {
    confirmTourProvider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Confrimed Booking"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          children: [
            Container(
              height: 300,
              decoration: const BoxDecoration(

                image: DecorationImage(
                    fit: BoxFit.contain, image: AssetImage('image/confirm.png'),

                    ),
              ),
            ),
            const SizedBox(height: 250,),
            //SizedBox(height: 250,),
            MaterialButton(
              color: Colors.lightBlueAccent,
              minWidth: 300,
              height: 50,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),

              onPressed: () {
                confirmTourProvider.confirmtour(
                    tourid: tourid,
                    location: location,
                    duration: duration,
                    cost: cost,
                    details: details,
                    image: image,
                    guide: guide
                );
                Fluttertoast.showToast(msg: "Your Package Booked");
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TourPackageList()));
              },

              child: const Text(
                'Confirm Package',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ],
        ),

      ),

    );
  }
}

