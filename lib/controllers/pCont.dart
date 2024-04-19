// import 'package:get/get.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// class ProfileCont extends GetxController {
//   User? user = FirebaseAuth.instance.currentUser;
//
//   final CollectionReference doctors =
//   FirebaseFirestore.instance.collection('doctors');
//
//   RxString name = ''.obs;
//   RxString id = ''.obs;
//   RxString email = ''.obs;
//   RxString qualification = ''.obs;
//   RxString specialization = ''.obs;
//   RxString address = ''.obs;
//   RxString phoneNumber = ''.obs;
//   RxString about = ''.obs;
//   RxString availableDays = ''.obs;
//   RxString availableTimings = ''.obs;
//   RxString workplace = ''.obs;
//   RxString superSpeciality = ''.obs;
//
//   // Function to fetch doctor's profile data from Firebase
//   Future<void> fetchProfileData() async {
//     try {
//       if (user != null) {
//         String uid = user!.uid;
//         DocumentSnapshot<Object?> snapshot =
//         await doctors.doc(uid).get();
//
//         if (snapshot.exists) {
//           Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
//           name.value = data['name'] ?? '';
//           id.value = data['Rid'] ?? '';
//           email.value = data['Email'] ?? '';
//           qualification.value = data['qualification'] ?? '';
//           specialization.value = data['specialization'] ?? '';
//           address.value = data['address'] ?? '';
//           phoneNumber.value = data['phoneNumber'] ?? '';
//           about.value = data['about'] ?? '';
//           availableDays.value = data['availableDays'] ?? '';
//           availableTimings.value = data['availableTimings'] ?? '';
//           workplace.value = data['workplace'] ?? '';
//           superSpeciality.value = data['superSpeciality'] ?? '';
//         }
//         String profileDetails = 'Name: ${name.value}\n'
//             'ID: ${id.value}\n'
//             'Email: ${email.value}\n'
//             'Qualification: ${qualification.value}\n'
//             'Specialization: ${specialization.value}\n'
//             'Address: ${address.value}\n'
//             'Phone Number: ${phoneNumber.value}\n'
//             'About: ${about.value}\n'
//             'Available Days: ${availableDays.value}\n'
//             'Available Timings: ${availableTimings.value}\n'
//             'Workplace: ${workplace.value}\n'
//             'Super Speciality: ${superSpeciality.value}\n';
//
//         // Print profile details
//         print(profileDetails);
//
//       } else {
//         print('User is not authenticated.');
//       }
//     } catch (e) {
//       print('Error fetching profile data: $e');
//     }
//   }
// }
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileCont extends GetxController {
  User? user = FirebaseAuth.instance.currentUser;

  final CollectionReference doctors =
  FirebaseFirestore.instance.collection('doctors');

  RxString name = ''.obs;
  RxString id = ''.obs;
  RxString email = ''.obs;
  RxString qualification = ''.obs;
  RxString specialization = ''.obs;
  RxString address = ''.obs;
  RxString phoneNumber = ''.obs;
  RxString about = ''.obs;
  RxString availableDays = ''.obs;
  RxString availableTimings = ''.obs;
  RxString workplace = ''.obs;
  RxString superSpeciality = ''.obs;

  // Function to fetch doctor's profile data from Firebase
  Future<void> fetchProfileData() async {
    try {
      if (user != null) {
        String uid = user!.uid;
        DocumentSnapshot<Object?> snapshot =
        await doctors.doc(uid).get();

        if (snapshot.exists) {
          Map<String, dynamic> data =
          snapshot.data() as Map<String, dynamic>;
          name.value = data["name"] ?? '';
          id.value = data['Rid'] ?? '';
          email.value = data['Email'] ?? '';
          qualification.value = data['qualification'] ?? '';
          specialization.value = data['specialization'] ?? '';
          address.value = data['address'] ?? '';
          phoneNumber.value = data['phoneNumber'] ?? '';
          about.value = data['about'] ?? '';
          availableDays.value = data['availableDays'] ?? '';
          availableTimings.value = data['availableTimings'] ?? '';
          workplace.value = data['workplace'] ?? '';
          superSpeciality.value = data['superSpeciality'] ?? '';
        }
      } else {
        print('User is not authenticated.');
      }
    } catch (e) {
      print('Error fetching profile data: $e');
    }
  }
}
