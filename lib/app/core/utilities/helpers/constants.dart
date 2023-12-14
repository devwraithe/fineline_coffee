import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

class Constants {
  static String fontFamily = "Neue Montreal";
  static String socketError = "No Internet Connection";
  static String unknownError = "Something went wrong";
  static String timeoutError = "Timeout";

  static double buttonRadius = 5.0;
  static double inputRadius = 4.0;

  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  static FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  static User? user = firebaseAuth.currentUser;

  static SizedBox prefixSpace = const SizedBox(width: 18);
  static AutovalidateMode validateMode = AutovalidateMode.onUserInteraction;
}
