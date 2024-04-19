// import 'package:agora_uikit/agora_uikit.dart';
// import 'package:flutter/material.dart';
//
// class VideoCall extends StatefulWidget {
//   const VideoCall({Key? key}) : super(key: key);
//
//   @override
//   _VideoCallState createState() => _VideoCallState();
// }
//
// class _VideoCallState extends State<VideoCall> {
//   final AgoraClient client = AgoraClient(
//     agoraConnectionData: AgoraConnectionData(
//       appId: "885f9b6ca1c44c129e330a2cbe901803",
//       channelName: "healthHive",
//     ),
//   );
//
//   @override
//   void initState() {
//     super.initState();
//     initAgora();
//   }
//
//   void initAgora() async {
//     await client.initialize();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: SafeArea(
//           child: Stack(
//             children: [
//               AgoraVideoViewer(client: client),
//               AgoraVideoButtons(client: client),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
