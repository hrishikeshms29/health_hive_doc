import 'package:flutter/material.dart';
import 'package:health_hive_doc/views/All_Appointment/all_appointment.dart';
import 'package:health_hive_doc/views/Profile/profile.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    Placeholder(), // Home page
    DoctorAppointments(), // Appointments page
    ProfilePage(), // Profile page
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Appointments',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.deepPurple, // Deep purple color for selected item
        unselectedItemColor: Colors.deepPurple.shade300, // Lighter shade of deep purple for unselected items
        backgroundColor: Colors.white, // White background color
        elevation: 4, // Elevation for the bottom navigation bar
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'Your App Title',
    theme: ThemeData(
      primaryColor: Colors.deepPurple, // Primary color as deep purple
    ),
    home: HomeView(),
  ));
}
