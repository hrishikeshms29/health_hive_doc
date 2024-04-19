import 'package:flutter/material.dart';
import 'package:health_hive_doc/meet/meet.dart';
import 'package:health_hive_doc/views/Avideo/Avideo.dart';
import '../call/call.dart';
import '../video_meets/video_meeting.dart';

class All_appoint_details extends StatelessWidget {
  final String patientName;
  final String message;
  final String appointmentDay;
  final String appointmentTime;
  final int randomNumber;

  All_appoint_details({
    Key? key,
    required this.patientName,
    required this.message,
    required this.appointmentDay,
    required this.appointmentTime,
    required this.randomNumber,
  }) : super(key: key);

  // final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appointment Details'),
      ),
      body: Card(
        elevation: 2,
        margin: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildStatusIndicator('Canceled'),
              SizedBox(height: 20),
              _buildAppointmentDetail('Appointment Day', appointmentDay),
              SizedBox(height: 20),
              _buildAppointmentDetail('Appointment Time', appointmentTime),
              SizedBox(height: 20),
              _buildAppointmentDetail('Doctor Name', patientName),
              SizedBox(height: 20),
              _buildAppointmentDetail('Message', message),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: ElevatedButton(
          onPressed: () {
            // Handle joining the meeting
            DateTime currentDateTime = DateTime.now();
            DateTime appointmentStartDateTime = _parseTime(appointmentDay, appointmentTime.split(' - ')[0]);
            DateTime appointmentEndDateTime = _parseTime(appointmentDay, appointmentTime.split(' - ')[1]);
            if (currentDateTime.isAfter(appointmentStartDateTime) && currentDateTime.isBefore(appointmentEndDateTime)) {
              //JitsiMeetMethods.createMeeting(roomName: randomNumber.toString() ,isAudioMuted: true,isVideoMuted: true);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VideoCall()
                      // CallPage(callID: "1",userName: patientName )
                      // VideoMeetingPage(
                      //   doctorName: patientName,
                      //   appointmentDay: appointmentDay,
                      //   appointmentStartTime: appointmentTime.split(' - ')[0],
                      //   appointmentEndTime: appointmentTime.split(' - ')[1],
                      //   randomNumber: randomNumber,
                      // ),
                ),
              );
            } else {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Error'),
                    content: Text('The appointment time has not arrived yet.'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('OK'),
                      ),
                    ],
                  );
                },
              );
            }
          },
          child: Text('Join Meeting'),
        ),
      ),
    );
  }

  Widget _buildStatusIndicator(String status) {
    Color indicatorColor = Colors.green;
    switch (status) {
      case 'Canceled':
        indicatorColor = Colors.red;
        break;
      case 'Upcoming':
        indicatorColor = Colors.orange;
        break;
      case 'Completed':
        indicatorColor = Colors.green;
        break;
    }
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: indicatorColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: indicatorColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildAppointmentDetail(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.deepPurple,
          ),
        ),
        SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  // Parse appointment time
  DateTime _parseTime(String day, String time) {
    return DateTime.parse('$day $time');
  }
}
