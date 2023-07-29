import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ConfirmHotelProvider with ChangeNotifier {
  void confirmhotel({
    required String hotelid,
    required String image,
    required String name,
    required String location,
    required String price,
    required String division,
    required String details,
  }) async {
    FirebaseFirestore.instance
        .collection("Confirm_Hotel")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("Your Confirm_Hotel")
        .doc(hotelid)
        .set({
      "hotelid":hotelid,
      "division":division,
      "location": location,
      "price": price,
      "details":details,
      "image": image,
      "name":name,
    });

  }
}
