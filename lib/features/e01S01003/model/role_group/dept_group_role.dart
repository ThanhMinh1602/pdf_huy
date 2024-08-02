class DeptGroupRole {
  final int id;
  final String deptCode;
  final String deptName;

  DeptGroupRole({
    required this.id,
    required this.deptCode,
    required this.deptName,
  });

  factory DeptGroupRole.fromJson(Map<String, dynamic> json) {
    return DeptGroupRole(
      id: json['id'],
      deptCode: json['deptCode'],
      deptName: json['deptName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'deptCode': deptCode,
      'deptName': deptName,
    };
  }
}
