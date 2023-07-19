import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HotelBooking extends StatefulWidget {
  const HotelBooking({super.key});

  @override
  State<HotelBooking> createState() => _HotelBookingState();
}

class _HotelBookingState extends State<HotelBooking> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: Center(
        child: Text("Hotel Booking"),
      ),
    );
  }
}
