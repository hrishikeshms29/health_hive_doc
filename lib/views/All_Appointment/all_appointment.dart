import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

import '../all_appoint_details/All_appoint_details.dart';

class DoctorAppointments extends StatefulWidget {
  const DoctorAppointments({Key? key});

  @override
  State<DoctorAppointments> createState() => _DoctorAppointmentsState();
}

class _DoctorAppointmentsState extends State<DoctorAppointments> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctor Appointments'),
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
          ),
          if (_selectedDay != null)
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('appointments')
                  .doc(FirebaseAuth.instance.currentUser!.uid)
                  .collection(DateFormat('yyyy-MM-dd').format(_selectedDay!))
                  .snapshots(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Something went wrong');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Loading");
                }

                return Expanded(
                  child: ListView(
                    children: snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
                      String? patientName = data['patientName'];
                      String? appointmentTime = data['appointmentTime'];
                      String? message = data['message']; // Add message here if needed

                      if (patientName == null || appointmentTime == null) {
                        return SizedBox.shrink(); // Don't create a card if patientName or appointmentTime is null
                      }

                      return Card(
                        elevation: 2,
                        margin: EdgeInsets.all(8),
                        child: ListTile(
                          leading: Icon(Icons.event_available, color: Colors.green),
                          title: Text(
                            patientName,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(appointmentTime),
                          trailing: ElevatedButton(
                            onPressed: () {
                              // Navigate to All_appoint_details and pass appointment details as arguments
                              Get.to(() => All_appoint_details(
                                patientName: patientName,
                                message: message ?? '', // Pass message if available, or empty string otherwise
                                appointmentDay: DateFormat('yyyy-MM-dd').format(_selectedDay!),
                                appointmentTime: appointmentTime,
                                randomNumber: document['randomNumber'], // Pass the randomNumber field

                              ));
                            },
                            child: Text('More Details'),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                );

              },
            ),
        ],
      ),
    );
  }
}
