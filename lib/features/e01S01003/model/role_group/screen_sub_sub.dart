class ScreenSubSub {
  final String screenCode;
  final String screenName;
  final List<int> role;

  ScreenSubSub({
    required this.screenCode,
    required this.screenName,
    required this.role,
  });

  factory ScreenSubSub.fromJson(Map<String, dynamic> json) {
    return ScreenSubSub(
      screenCode: json['screenCode'],
      screenName: json['screenName'],
      role: List<int>.from(json['role']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'screenCode': screenCode,
      'screenName': screenName,
      'role': role,
    };
  }
}
