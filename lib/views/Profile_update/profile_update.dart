import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/ProfileController.dart';
import '../Home/Home.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: ProfileForm(),
        ),
      ),
    );
  }
}

class ProfileForm extends StatefulWidget {
  const ProfileForm({Key? key}) : super(key: key);

  @override
  _ProfileFormState createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  final ProfileController _profileController = Get.put(ProfileController());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController aboutController = TextEditingController();
  final TextEditingController workplaceController = TextEditingController();
  final TextEditingController superSpecialityController = TextEditingController();

  List<String> selectedDays = [];
  List<String> days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];

  TimeOfDay fromTime = TimeOfDay(hour: 8, minute: 0);
  TimeOfDay tillTime = TimeOfDay(hour: 17, minute: 0);

  String? selectedQualification;
  List<String> qualifications = ['MBBS', 'MD', 'PhD', 'Other'];

  String? selectedSpecialization;
  List<String> specializations = ["HEART","LUNGS","BODY","EARS","Kidney","Nose","STOMACH","TEETH","BRAIN"];

  Future<void> _selectTime(BuildContext context, bool isFrom) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: isFrom ? fromTime : tillTime,
    );
    if (pickedTime != null) {
      setState(() {
        if (isFrom) {
          fromTime = pickedTime;
        } else {
          tillTime = pickedTime;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Update Profile',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.white70,
                labelStyle: TextStyle(color: Colors.deepPurple),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: idController,
              decoration: InputDecoration(
                labelText: 'Unique ID',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.white70,
                labelStyle: TextStyle(color: Colors.deepPurple),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email ID',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.white70,
                labelStyle: TextStyle(color: Colors.deepPurple),
              ),
            ),
            SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: selectedQualification,
              items: qualifications.map((qualification) {
                return DropdownMenuItem<String>(
                  value: qualification,
                  child: Text(
                    qualification,
                    style: TextStyle(color: Colors.deepPurple),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedQualification = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Qualification',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.white70,
                labelStyle: TextStyle(color: Colors.deepPurple),
              ),
            ),
            SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: selectedSpecialization,
              items: specializations.map((specialization) {
                return DropdownMenuItem<String>(
                  value: specialization,
                  child: Text(
                    specialization,
                    style: TextStyle(color: Colors.deepPurple),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedSpecialization = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Specialization',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.white70,
                labelStyle: TextStyle(color: Colors.deepPurple),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: addressController,
              decoration: InputDecoration(
                labelText: 'Address',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.white70,
                labelStyle: TextStyle(color: Colors.deepPurple),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: phoneNumberController,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.white70,
                labelStyle: TextStyle(color: Colors.deepPurple),
              ),
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value!.length < 8) {
                  return 'Enter a valid phone number';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: aboutController,
              decoration: InputDecoration(
                labelText: 'About Yourself',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.white70,
                labelStyle: TextStyle(color: Colors.deepPurple),
              ),
              maxLines: null,
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      _selectTime(context, true);
                    },
                    child: IgnorePointer(
                      child: TextFormField(
                        controller: TextEditingController(
                          text: '${fromTime.hour}:${fromTime.minute}',
                        ),
                        decoration: InputDecoration(
                          labelText: 'From',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          filled: true,
                          fillColor: Colors.white70,
                          labelStyle: TextStyle(color: Colors.deepPurple),
                          suffixIcon: Icon(Icons.access_time),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      _selectTime(context, false);
                    },
                    child: IgnorePointer(
                      child: TextFormField(
                        controller: TextEditingController(
                          text: '${tillTime.hour}:${tillTime.minute}',
                        ),
                        decoration: InputDecoration(
                          labelText: 'Till',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          filled: true,
                          fillColor: Colors.white70,
                          labelStyle: TextStyle(color: Colors.deepPurple),
                          suffixIcon: Icon(Icons.access_time),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 10,
              children: days.map((day) {
                return FilterChip(
                  label: Text(day),
                  selected: selectedDays.contains(day),
                  onSelected: (isSelected) {
                    setState(() {
                      if (isSelected) {
                        selectedDays.add(day);
                      } else {
                        selectedDays.remove(day);
                      }
                    });
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: workplaceController,
              decoration: InputDecoration(
                labelText: 'Workplace',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.white70,
                labelStyle: TextStyle(color: Colors.deepPurple),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: superSpecialityController,
              decoration: InputDecoration(
                labelText: 'Super Speciality',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.white70,
                labelStyle: TextStyle(color: Colors.deepPurple),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _profileController.saveProfile(
                  nameController.text,
                  idController.text,
                  emailController.text,
                  selectedQualification ?? '',
                  selectedSpecialization ?? '',
                  addressController.text,
                  phoneNumberController.text,
                  aboutController.text,
                  selectedDays.join(', '),
                  '${fromTime.hour}:${fromTime.minute} - ${tillTime.hour}:${tillTime.minute}',
                  workplaceController.text,
                  superSpecialityController.text,
                );
                Get.offAll(() => HomeView());
              },
              child: Text(
                'Save',
                style: TextStyle(fontSize: 18,color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16), backgroundColor: Colors.deepPurple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Your App Title',
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        hintColor: Colors.deepPurpleAccent,
      ),
      home: ProfilePage(),
    );
  }
}
