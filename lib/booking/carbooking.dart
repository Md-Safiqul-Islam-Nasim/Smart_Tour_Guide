import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import '../Home/homepage.dart';

class CarBooking extends StatefulWidget {
  const CarBooking({Key? key}) : super(key: key);


  @override
  State<CarBooking> createState() => _CarBookingState();
}


class _CarBookingState extends State<CarBooking> {

  late String selected;
  final List<String> data = [
    "Mirpur - 1" ,
    "Mirpur - 2" ,
    "Mirpur - 6" ,
    "Mirpur - 7" ,
    "Mirpur - 10" ,
    "Mirpur - 11" ,
    "Mirpur - 14" ,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          title: Text('Car Booking'),
        ),
        backgroundColor: Color(0xff5bc0de),
      body: Center(
        child: DropdownButton(
          value: selected,
          hint: Text("Choose Your Location"),
          onChanged: (value){
            print(value);
            setState(() {
              selected = value!;
            });
          },
          items: data.map(
              (e) => DropdownMenuItem(
                value: e,

                  child: Text(e),
              ),
          )
            .toList(),
        ),
      ),

    );
  }
}

