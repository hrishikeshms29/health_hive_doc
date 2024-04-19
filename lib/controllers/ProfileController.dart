import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  User? user = FirebaseAuth.instance.currentUser;
  
  void printUserID() {
    if (user != null) {
      String uid = user!.uid;
      print('User ID: $uid');
      // Now you can use this uid in your ProfileForm widget
    }
  }

  final CollectionReference doctors =
  FirebaseFirestore.instance.collection('doctors');

  Future<void> saveProfile(
      String Name,
      String Id,
      String email,
      String qualification,
      String specialization,
      String address,
      String phoneNumber,
      String about,
      String availableDays,
      String availableTimings,
      String workplace,
      String superSpeciality,
      ) async {
    try {
      if (user != null) {
        String uid = user!.uid; // Move this inside the try block
        await doctors.doc(uid).set({
          'name':Name,
          'Rid':uid,
          'Email':email,
          'qualification': qualification,
          'specialization': specialization,
          'address': address,
          'phoneNumber': phoneNumber,
          'about': about,
          'availableDays': availableDays,
          'availableTimings': availableTimings,
          'workplace': workplace,
          'superSpeciality': superSpeciality,
        });
        print('Profile details saved successfully.');
      } else {
        print('User is not authenticated.');
      }
    } catch (e) {
      print('Error saving profile details: $e');
    }
  }
}
