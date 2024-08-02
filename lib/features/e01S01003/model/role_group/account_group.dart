class AccountGroup {
  final int id;
  final String accountCode;
  final String accountName;

  AccountGroup({
    required this.id,
    required this.accountCode,
    required this.accountName,
  });

  factory AccountGroup.fromJson(Map<String, dynamic> json) {
    return AccountGroup(
      id: json['id'],
      accountCode: json['accountCode'],
      accountName: json['accountName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'accountCode': accountCode,
      'accountName': accountName,
    };
  }
}
