import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/pCont.dart';

class ProfilePage extends StatelessWidget {
  final ProfileCont _profileCont = Get.put(ProfileCont());

  @override
  Widget build(BuildContext context) {
    _profileCont.fetchProfileData();

    return Scaffold(
      appBar: AppBar(
        title: Text('Doctor Profile'),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ProfileCard(),
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final ProfileCont _profileCont = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 6,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _profileCont.name.value ?? 'Name not available',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                _profileCont.specialization.value ?? 'Specialization not available',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.grey[800],
                ),
              ),
              const SizedBox(height: 30),
              ProfileInfo(label: 'Qualification', value: _profileCont.qualification.value ?? 'Not available'),
              ProfileInfo(label: 'Address', value: _profileCont.address.value ?? 'Not available'),
              ProfileInfo(label: 'Phone Number', value: _profileCont.phoneNumber.value ?? 'Not available'),
              ProfileInfo(label: 'Email', value: _profileCont.email.value ?? 'Not available'),
              ProfileInfo(label: 'Available Days', value: _profileCont.availableDays.value ?? 'Not available'),
              ProfileInfo(label: 'Available Time', value: _profileCont.availableTimings.value ?? 'Not available'),
              const SizedBox(height: 30),
              Text(
                'About',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                _profileCont.about.value ?? 'Not available',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[800],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileInfo extends StatelessWidget {
  final String label;
  final String value;

  const ProfileInfo({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[800],
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'Your App Title',
    theme: ThemeData(
      primaryColor: Colors.deepPurple,
      // Use Material Design 3 color scheme
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: Colors.deepPurple,
      ),
    ),
    home: ProfilePage(),
  ));
}
