import 'package:flutter/material.dart';

import '../Package/tour_package.dart';
import '../Package/tour_package_details.dart';
import '../provider/confirm_tour_provider.dart';

class BookingConfirm extends StatelessWidget {
  final String? tourid;
  final String? location;
  final String? duration;
  final String? cost;
  final String? details;
  final String? image;
  final String? guide;
  const BookingConfirm({
    super.key,
    this.tourid,
    this.location,
    this.duration,
    this.cost,
    this.details,
    this.image,
    this.guide,
  });

  @override
  Widget build(BuildContext context) {
    //ConfirmTourProvider confirm = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Confrimed Booking"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(

                image: DecorationImage(
                    fit: BoxFit.contain, image: AssetImage('image/confirm.png'),

                    ),
              ),
            ),
            SizedBox(height: 250,),
            //SizedBox(height: 250,),
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
