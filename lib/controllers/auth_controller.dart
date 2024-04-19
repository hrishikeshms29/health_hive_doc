import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:health_hive_doc/views/Home/Home.dart';
import 'package:health_hive_doc/views/Profile_update/profile_update.dart';

import '../views/login_in/login_in.dart';

class AuthController extends GetxController {
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> signupUser(String emailAddress, String password) async {
    try {
      if (emailAddress.isEmpty) {
        Fluttertoast.showToast(msg: 'Email address is empty.', backgroundColor: Colors.red);
        return;
      }

      print('Signing up with email: $emailAddress');

      final UserCredential credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      if (credential.user != null) {
        await storeUserData(credential.user!.uid, fullnameController.text, emailAddress);
        Fluttertoast.showToast(msg: 'User signed up successfully.', backgroundColor: Colors.green);
        Get.to(()=>ProfilePage());
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Fluttertoast.showToast(msg: 'The password provided is too weak.', backgroundColor: Colors.red);
      } else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(msg: 'The account already exists for that email.', backgroundColor: Colors.red);
      } else if (e.code == 'invalid-email') {
        Fluttertoast.showToast(msg: 'The email address is badly formatted.', backgroundColor: Colors.red);
      } else {
        Fluttertoast.showToast(msg: 'Firebase Auth Exception: ${e.message}', backgroundColor: Colors.red);
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Error: $e', backgroundColor: Colors.red);
    }
  }

  Future<void> storeUserData(String uid, String fullname, String emailAddress) async {
    try {
      final CollectionReference doctors = FirebaseFirestore.instance.collection('doctors');
      await doctors.doc(uid).set({
        'fullname': fullname,
        'email': emailAddress,
      });
      Fluttertoast.showToast(msg: 'User data stored successfully.', backgroundColor: Colors.green);
    } catch (e) {
      Fluttertoast.showToast(msg: 'Error storing user data: $e', backgroundColor: Colors.red);
    }
  }
  Future<void> loginDoctor(String emailAddress, String password) async {
    try {
      final UserCredential credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      if (credential.user != null) {
        // Check if the user exists in the doctors collection
        final doctorSnapshot = await FirebaseFirestore.instance.collection('doctors').doc(credential.user!.uid).get();
        if (doctorSnapshot.exists) {
          Fluttertoast.showToast(msg: 'Doctor logged in successfully.', backgroundColor: Colors.green);
          Get.offAll(() => HomeView());
        } else {
          // If the user does not exist in the doctors collection, sign them out
          await FirebaseAuth.instance.signOut();
          Fluttertoast.showToast(msg: 'You are not authorized as a doctor.', backgroundColor: Colors.red);
        }
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        Fluttertoast.showToast(msg: 'Invalid email or password.', backgroundColor: Colors.red);
      } else {
        Fluttertoast.showToast(msg: 'Firebase Auth Exception: ${e.message}', backgroundColor: Colors.red);
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Error: $e', backgroundColor: Colors.red);
    }
  }

  Future<void> signout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Fluttertoast.showToast(msg: 'User signed out successfully.', backgroundColor: Colors.green);
      Get.offAll(() => LoginDoctorPage()); // Navigate to the doctor login screen after signing out
    } catch (e) {
      Fluttertoast.showToast(msg: 'Error signing out: $e', backgroundColor: Colors.red);
    }
  }
}
