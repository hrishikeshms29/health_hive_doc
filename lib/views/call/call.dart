// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
// import 'package:zego_uikit_prebuilt_video_conference/zego_uikit_prebuilt_video_conference.dart';
//
// class CallPage extends StatefulWidget {
//   const CallPage({Key? key, required this.callID,required this.userName}) : super(key: key);
//   final String callID;
//   final String userName;
//
//   @override
//   State<CallPage> createState() => _CallPageState();
// }
//
// class _CallPageState extends State<CallPage> {
//   @override
//   Widget build(BuildContext context) {
//     User? user = FirebaseAuth.instance.currentUser;
//     String uid = user!.uid;
//
//     return SafeArea(
//       child: ZegoUIKitPrebuiltVideoConference(
//         appID: 305521145, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
//         appSign: "725b5407875d2dd83fd66c091fc340046a4128479776fe3146a70399a6b50c3c", // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
//         userID: uid,
//         userName: widget.userName,
//         conferenceID: widget.callID,
//
//         // You can also use groupVideo/groupVoice/oneOnOneVoice to make more types of calls.
//         config: ZegoUIKitPrebuiltVideoConferenceConfig(),
//       ),
//     );
//   }
// }
