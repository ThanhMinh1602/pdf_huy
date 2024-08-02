import 'dart:convert';

final fakeRoleGroupById = jsonDecode('''
[
  {
    "RoleGroup": {
      "id": 1,
      "RoleCode": "QTHT",
      "RoleName": "Quản trị hệ thống",
      "Description": "Nhóm quyền quản trị hệ thống cho website",
      "Status": 0
    },
    "DeptGroupRole": {
      "id": 1,
      "DeptCode": "HTQT",
      "DeptName": "Hành chính quản trị"
    },
    "AccountGroup": {
      "id": 1,
      "UserName": "HTQT",
      "FullName": "Hành chính quản trị",
      "PassWord": "a123456"
    },
    "Screen": {
      "id": 1,
      "ScreenCode": "E01",
      "ScreenName": "Quản trị hệ thống",
      "Role": "[1,2]",
      "ScreenSub": {
        "ScreenCode": "E01L0001",
        "ScreenName": "Quản lý tài khoản",
        "Role": "[1,2,3]"
      }
    }
  }
]
''');

final fakeEditRoleGroup = jsonDecode('''
[
  {
    "RoleGroup": {
      "id": 1,
      "RoleGroupName": "Quản trị hệ thống",
      "RoleGroupCode": "QTHT",
      "Description": "Nhóm quyền quản trị hệ thống",
      "Status": 1
    },
    "DeptGroupRole": [
      1,
      2,
      3
    ],
    "AccountGroup": [
      1,
      2,
      4
    ],
    "Screen": {
      "id": 1,
      "SubScreen": {
        "id": 2,
        "role": [
          2,
          3,
          4
        ]
      }
    }
  }
]
''');

final fakeAllGroups = jsonDecode('''
{
  "data": [
    {
      "id": 1,
      "RoleGroupName": "Quản trị hệ thống",
      "RoleGroupCode": "QTHT",
      "Status": 1
    },
    {
      "id": 2,
      "RoleGroupName": "Bác sĩ ngoại trú",
      "RoleGroupCode": "BSNT",
      "Status": 1
    }
  ]
}
''');

final fakeAddNewGroup = jsonDecode('''
{
  "value": [
    {
      "RoleGroup": {
        "id": 1,
        "RoleCode": "QTHT",
        "RoleName": "Quản trị hệ thống",
        "Description": "Nhóm quyền quản trị hệ thống cho website",
        "Status": 0
      },
      "DeptGroupRole": {
        "id": 1,
        "DeptCode": "HTQT",
        "DeptName": "Hành chính quản trị"
      },
      "AccountGroup": {
        "id": 1,
        "UserName": "HTQT",
        "FullName": "Hành chính quản trị",
        "PassWord": "a123456"
      },
      "Screen": {
        "id": 1,
        "ScreenCode": "E01",
        "ScreenName": "Quản trị hệ thống",
        "Role": "[1,2]",
        "ScreenSub": {
          "ScreenCode": "E01L0001",
          "ScreenName": "Quản lý tài khoản",
          "Role": "[1,2,3]"
        }
      }
    }
  ]
}
''');

final fakeEditPermission = jsonDecode('''
{
  "id": 1,
  "Role": [
    1,
    2,
    3
  ]
}
''');

final fakeRetrievePermission = jsonDecode('''
{
  "id": 1,
  "GroupRoleCode": "QTHT",
  "GroupRoleName": "Quản trị hệ thống",
  "Role": [
    1,
    2,
    3
  ]
}
''');

final fakeAllScreen = jsonDecode('''
{
  "ScreenCode": "E01",
  "ScreenName": "Nội trú",
  "ScreenSub": {
    "id": 1,
    "ScreenSubCode": "E01S01L001",
    "ScreenSubName": "Hồ sơ bác sĩ"
  }
}
''');

final fakeRetrievePermissionById = jsonDecode('''
{
  "id": 1,
  "GroupRoleCode": "QTHT",
  "GroupRoleName": "Quản trị hệ thống",
  "Role": [
    1,
    2,
    3
  ]
}
''');
