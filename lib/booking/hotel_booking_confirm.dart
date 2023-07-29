import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:untitled/booking/hotelbooking.dart';
import 'package:untitled/provider/confirm_hotel_provider.dart';

import '../provider/confirm_tour_provider.dart';

class HotelBookingConfirm extends StatelessWidget {
  String image ;
  String name ;
  String price ;
  String location;
  String division;
  String hotelid;
  String details;
  HotelBookingConfirm({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.location,
    required this.division,
    required this.hotelid,
    required this.details,
  });

  late ConfirmHotelProvider confirmHotelProvider;

  @override
  Widget build(BuildContext context) {
    confirmHotelProvider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Confrim Hotel Booking"),
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
            const SizedBox(height: 50,),
            Row(
              children: [

              ],
            ),
            const SizedBox(height: 50,),
            //SizedBox(height: 250,),
            MaterialButton(
              color: Colors.lightBlueAccent,
              minWidth: 300,
              height: 50,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),

              onPressed: () {
                confirmHotelProvider.confirmhotel(
                  hotelid: hotelid,
                  location: location,
                  division: division,
                  price: price,
                  image: image,
                  name: name,
                  details: details,
                );
                Fluttertoast.showToast(msg: "Your Hotel Booked");
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HotelBooking()));
              },

              child: const Text(
                'Confirm Hotel',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ],
        ),

      ),

    );
  }
}
