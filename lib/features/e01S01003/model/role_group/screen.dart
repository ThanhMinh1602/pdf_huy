import 'package:account/features/e01S01003/model/role_group/screen_sub.dart';

class Screen {
  final String screenCode;
  final String screenName;
  final ScreenSub? screenSub;

  Screen({
    required this.screenCode,
    required this.screenName,
    this.screenSub,
  });

  factory Screen.fromJson(Map<String, dynamic> json) {
    return Screen(
      screenCode: json['screenCode'],
      screenName: json['screenName'],
      screenSub: json['screenSub'] != null
          ? ScreenSub.fromJson(json['screenSub'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'screenCode': screenCode,
      'screenName': screenName,
      'screenSub': screenSub?.toJson(),
    };
  }
}
