// import 'package:jitsi_meet/feature_flag/feature_flag.dart';
// import 'package:jitsi_meet/jitsi_meet.dart';
//
// class JitsiMeetMethods {
//   static void createMeeting({
//     required String roomName,
//     required bool isAudioMuted,
//     required bool isVideoMuted,
//     String userName = '',
//   }) async {
//     try {
//       // Configure feature flags
//       var featureFlag = FeatureFlag();
//       featureFlag.welcomePageEnabled = false;
//       featureFlag.resolution = FeatureFlagVideoResolution.MD_RESOLUTION;
//
//       // Configure meeting options
//       var options = JitsiMeetingOptions(room: roomName)
//         ..userDisplayName = userName
//         ..audioMuted = isAudioMuted
//         ..videoMuted = isVideoMuted;
//
//       // Join the meeting
//       await JitsiMeet.joinMeeting(options);
//     } catch (error) {
//       // Handle any errors
//       print("Error creating Jitsi meeting: $error");
//     }
//   }
// }
