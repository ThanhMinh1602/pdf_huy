import 'package:account/features/e01S01003/model/role_group/screen_sub_sub.dart';

class ScreenSub {
  final String screenCode;
  final String screenName;
  final ScreenSubSub? screenSubSub;

  ScreenSub({
    required this.screenCode,
    required this.screenName,
    this.screenSubSub,
  });

  factory ScreenSub.fromJson(Map<String, dynamic> json) {
    return ScreenSub(
      screenCode: json['screenCode'],
      screenName: json['screenName'],
      screenSubSub: json['screenSubSub'] != null
          ? ScreenSubSub.fromJson(json['screenSubSub'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'screenCode': screenCode,
      'screenName': screenName,
      'screenSubSub': screenSubSub?.toJson(),
    };
  }
}
