import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ConfirmCarProvider with ChangeNotifier {
  void confirmcar({
    required String carid,
    required String image,
    required String name,
    required String carnumber,
    required String capacity,
    required String aircondition,
  }) async {
    FirebaseFirestore.instance
        .collection("Confirm_Car")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("Your Confirm_Car")
        .doc(carid)
        .set({
      "carid":carid,
      "image": image,
      "name":name,
      "carnumber": carnumber,
      "capacity": capacity,
      "aircondition":aircondition,

    });

  }
}
