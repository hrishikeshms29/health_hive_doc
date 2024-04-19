import 'package:flutter/material.dart';
import 'package:zego_express_engine/zego_express_engine.dart';

class VideoMeetingPage extends StatefulWidget {
  final String doctorName;
  final String appointmentDay;
  final String appointmentStartTime;
  final String appointmentEndTime;
  final int randomNumber;

  const VideoMeetingPage({
    Key? key,
    required this.doctorName,
    required this.appointmentDay,
    required this.appointmentStartTime,
    required this.appointmentEndTime,
    required this.randomNumber,
  }) : super(key: key);

  @override
  _VideoMeetingPageState createState() => _VideoMeetingPageState();
}

class _VideoMeetingPageState extends State<VideoMeetingPage> {
  @override
  void initState() {
    super.initState();
    initEngine();
  }

  Future<void> initEngine() async {
    ZegoPrebuiltCallConfig config = ZegoPrebuiltCallConfig(
      appID: 491061320, // Replace with your actual AppID
      scenario: ZegoScenario.General,
      enablePlatformView: true,
    );

    await ZegoPrebuiltCall.createEngineWithConfig(config);

    ZegoUser user = ZegoUser.id('doctorName'); // This should be unique for each user
    ZegoRoomConfig roomConfig = ZegoRoomConfig.defaultConfig();
    roomConfig.isUserStatusNotify = true;

    // Use the random number as the room ID
    String roomID = widget.randomNumber.toString();

    ZegoPrebuiltCall.instance.loginRoom(roomID, user, config: roomConfig);

    ZegoPrebuiltCall.onRoomTokenWillExpire = (String roomID, int remainTimeInSecond) async {
      // If you're not using a token, you can leave this empty
    };

    // Event handlers
    ZegoPrebuiltCall.onJoinRoom = (String roomID, ZegoUser user) {
      print('User ${user.userID} joined room $roomID');
    };

    ZegoPrebuiltCall.onLeaveRoom = (String roomID, ZegoUser user) {
      print('User ${user.userID} left room $roomID');
    };
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
