// ignore_for_file: avoid_print

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';

final jitsiProvider = Provider((ref) => JitsiProvider());

class JitsiProvider {
  JitsiProvider();

  void createMeeting({
    required String roomName,
    required bool isAudioMuted,
    required bool isVideoMuted,
    required String username,
    required String email,
    required String image,
    bool preJoined = true,
    bool isVideo = true,
    bool isGroup = true,
  }) async {
    try {
      Map<String, Object> featureFlag = {};
      featureFlag['welcomepage.enabled'] = false;
      featureFlag['prejoinpage.enabled'] = preJoined;
      featureFlag['add-people.enabled'] = isGroup;

      var options = JitsiMeetConferenceOptions(
        room: roomName,
        // serverURL: 'https://meet.codewithbisky.com',
        configOverrides: {
          "startWithAudioMuted": isAudioMuted,
          "startWithVideoMuted": isVideoMuted,
          // "subject": "Jitsi with Flutter",
        },
        userInfo: JitsiMeetUserInfo(
          displayName: username,
          email: email,
          avatar: image,
        ),
        featureFlags: featureFlag,
      );
      var jitsiMeet = JitsiMeet();
      await jitsiMeet.join(options);
    } catch (error) {
      print("error: $error");
    }
  }
}