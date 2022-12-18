import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<String> uploadData(Map<String, dynamic> data) async {
    String res = "Some Error occured";
    try {
      _firestore.collection('vehicals').doc(data["VehicalNumber"]).set(data);
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
