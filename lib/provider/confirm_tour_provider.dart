import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ConfirmTourProvider with ChangeNotifier {
  void confirmtour({
    required String tourid,
    required String location,
    required String duration,
    required String cost,
    required String details,
    required String image,
    required String guide,
  }) async {
    FirebaseFirestore.instance
        .collection("Confirm_Package")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("Your Confirm_Package")
        .doc(tourid)
        .set({
      "tourid":tourid,
      "Location":location,
      "Duration": duration,
      "Cost": cost,
      "details":details,
      "image": image,
      "guide":guide,
    });

  }
}
