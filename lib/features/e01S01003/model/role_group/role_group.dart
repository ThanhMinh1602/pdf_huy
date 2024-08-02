import 'package:account/features/e01S01003/model/role_group/account_group.dart';
import 'package:account/features/e01S01003/model/role_group/dept_group_role.dart';
import 'package:account/features/e01S01003/model/role_group/screen.dart';
import 'package:account/features/e01S01003/model/role_group/screen_sub.dart';
import 'package:account/features/e01S01003/model/role_group/screen_sub_sub.dart';

class RoleGroup {
  final int id;
  final String roleCode;
  final String roleName;
  final String description;
  final int isUse;
  final List<DeptGroupRole> deptGroupRoles;
  final List<AccountGroup> accountGroups;
  final List<Screen> screens;

  RoleGroup({
    required this.id,
    required this.roleCode,
    required this.roleName,
    required this.description,
    required this.isUse,
    required this.deptGroupRoles,
    required this.accountGroups,
    required this.screens,
  });

  factory RoleGroup.fromJson(Map<String, dynamic> json) {
    var deptGroupRolesJson = json['deptGroupRoles'] as List<dynamic>;
    List<DeptGroupRole> deptGroupRolesList = deptGroupRolesJson
        .map((e) => DeptGroupRole.fromJson(e as Map<String, dynamic>))
        .toList();

    var accountGroupJson = json['accountGroups'] as List<dynamic>;
    List<AccountGroup> accountGroupList = accountGroupJson
        .map((e) => AccountGroup.fromJson(e as Map<String, dynamic>))
        .toList();

    var screensJson = json['screens'] as List<dynamic>;
    List<Screen> screensList = screensJson
        .map((e) => Screen.fromJson(e as Map<String, dynamic>))
        .toList();

    return RoleGroup(
      id: json['id'],
      roleCode: json['roleCode'],
      roleName: json['roleName'],
      description: json['description'],
      isUse: json['isUse'],
      deptGroupRoles: deptGroupRolesList,
      accountGroups: accountGroupList,
      screens: screensList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'roleCode': roleCode,
      'roleName': roleName,
      'description': description,
      'isUse': isUse,
      'deptGroupRoles': deptGroupRoles.map((e) => e.toJson()).toList(),
      'accountGroups': accountGroups.map((e) => e.toJson()).toList(),
      'screens': screens.map((e) => e.toJson()).toList(),
    };
  }

  static List<RoleGroup> generateDatas = [
    RoleGroup(
      id: 1,
      roleCode: 'NS',
      roleName: 'Nhân sự',
      description: 'Nhóm quyền nhân sự',
      isUse: 1,
      deptGroupRoles: [
        DeptGroupRole(id: 1, deptCode: 'NS', deptName: 'Nhân sự'),
        DeptGroupRole(id: 2, deptCode: 'HTKH', deptName: 'Hỗ trợ khách hàng'),
        DeptGroupRole(id: 3, deptCode: 'IT', deptName: 'Công nghệ thông tin'),
        DeptGroupRole(id: 4, deptCode: 'KT', deptName: 'Kế toán'),
        DeptGroupRole(id: 5, deptCode: 'MK', deptName: 'Marketing'),
      ],
      accountGroups: [
        AccountGroup(id: 1, accountCode: '0019', accountName: 'Nguyễn Văn B'),
        AccountGroup(id: 2, accountCode: '0020', accountName: 'Lê Thị C'),
        AccountGroup(id: 3, accountCode: '0021', accountName: 'Trần Văn D'),
        AccountGroup(id: 4, accountCode: '0022', accountName: 'Bùi Thị E'),
        AccountGroup(id: 5, accountCode: '0023', accountName: 'Hoàng Văn F'),
      ],
      screens: [
        Screen(
          screenCode: 'E01',
          screenName: 'Nội trú',
          screenSub: ScreenSub(
            screenCode: 'E01L00001',
            screenName: 'Hồ sơ điều trị',
            screenSubSub: ScreenSubSub(
              screenCode: 'E01L00001.1',
              screenName: 'Hồ sơ bác sĩ',
              role: [1, 2, 3],
            ),
          ),
        ),
        Screen(
          screenCode: 'E02',
          screenName: 'Bệnh án',
          screenSub: ScreenSub(
            screenCode: 'E02L00001',
            screenName: 'Quản lý bệnh án',
            screenSubSub: ScreenSubSub(
              screenCode: 'E02L00001.1',
              screenName: 'Chi tiết bệnh án',
              role: [2, 3],
            ),
          ),
        ),
        Screen(
          screenCode: 'E03',
          screenName: 'Khám bệnh',
          screenSub: ScreenSub(
            screenCode: 'E03L00001',
            screenName: 'Đăng ký khám',
            screenSubSub: ScreenSubSub(
              screenCode: 'E03L00001.1',
              screenName: 'Lịch sử khám',
              role: [2, 3],
            ),
          ),
        ),
        Screen(
          screenCode: 'E04',
          screenName: 'Hóa đơn',
          screenSub: ScreenSub(
            screenCode: 'E04L00001',
            screenName: 'Quản lý hóa đơn',
            screenSubSub: ScreenSubSub(
              screenCode: 'E04L00001.1',
              screenName: 'Chi tiết hóa đơn',
              role: [1, 2],
            ),
          ),
        ),
        Screen(
          screenCode: 'E05',
          screenName: 'Báo cáo',
          screenSub: ScreenSub(
            screenCode: 'E05L00001',
            screenName: 'Báo cáo tổng quan',
            screenSubSub: ScreenSubSub(
              screenCode: 'E05L00001.1',
              screenName: 'Chi tiết báo cáo',
              role: [1, 2, 3],
            ),
          ),
        ),
      ],
    ),
    RoleGroup(
      id: 2,
      roleCode: 'KT',
      roleName: 'Kế toán',
      description: 'Nhóm quyền kế toán',
      isUse: 1,
      deptGroupRoles: [
        DeptGroupRole(id: 6, deptCode: 'KT', deptName: 'Kế toán'),
        DeptGroupRole(id: 7, deptCode: 'IT', deptName: 'Công nghệ thông tin'),
        DeptGroupRole(id: 8, deptCode: 'NS', deptName: 'Nhân sự'),
        DeptGroupRole(id: 9, deptCode: 'HTKH', deptName: 'Hỗ trợ khách hàng'),
        DeptGroupRole(id: 10, deptCode: 'MK', deptName: 'Marketing'),
      ],
      accountGroups: [
        AccountGroup(id: 6, accountCode: '0024', accountName: 'Nguyễn Văn G'),
        AccountGroup(id: 7, accountCode: '0025', accountName: 'Lê Thị H'),
        AccountGroup(id: 8, accountCode: '0026', accountName: 'Trần Văn I'),
        AccountGroup(id: 9, accountCode: '0027', accountName: 'Bùi Thị J'),
        AccountGroup(id: 10, accountCode: '0028', accountName: 'Hoàng Văn K'),
      ],
      screens: [
        Screen(
          screenCode: 'E06',
          screenName: 'Báo cáo tài chính',
          screenSub: ScreenSub(
            screenCode: 'E06L00001',
            screenName: 'Tổng hợp báo cáo',
            screenSubSub: ScreenSubSub(
              screenCode: 'E06L00001.1',
              screenName: 'Chi tiết báo cáo tài chính',
              role: [1, 2],
            ),
          ),
        ),
        Screen(
          screenCode: 'E07',
          screenName: 'Quản lý ngân sách',
          screenSub: ScreenSub(
            screenCode: 'E07L00001',
            screenName: 'Ngân sách dự kiến',
            screenSubSub: ScreenSubSub(
              screenCode: 'E07L00001.1',
              screenName: 'Chi tiết ngân sách',
              role: [2, 3],
            ),
          ),
        ),
        Screen(
          screenCode: 'E08',
          screenName: 'Kế hoạch chi tiêu',
          screenSub: ScreenSub(
            screenCode: 'E08L00001',
            screenName: 'Chi tiêu hàng tháng',
            screenSubSub: ScreenSubSub(
              screenCode: 'E08L00001.1',
              screenName: 'Chi tiết chi tiêu',
              role: [1, 2],
            ),
          ),
        ),
        Screen(
          screenCode: 'E09',
          screenName: 'Báo cáo thu chi',
          screenSub: ScreenSub(
            screenCode: 'E09L00001',
            screenName: 'Báo cáo thu chi hàng ngày',
            screenSubSub: ScreenSubSub(
              screenCode: 'E09L00001.1',
              screenName: 'Chi tiết thu chi',
              role: [2],
            ),
          ),
        ),
        Screen(
          screenCode: 'E10',
          screenName: 'Phân tích chi phí',
          screenSub: ScreenSub(
            screenCode: 'E10L00001',
            screenName: 'Phân tích chi phí hàng năm',
            screenSubSub: ScreenSubSub(
              screenCode: 'E10L00001.1',
              screenName: 'Chi tiết phân tích chi phí',
              role: [1, 2, 3],
            ),
          ),
        ),
      ],
    ),
    RoleGroup(
      id: 3,
      roleCode: 'IT',
      roleName: 'Công nghệ thông tin',
      description: 'Nhóm quyền công nghệ thông tin',
      isUse: 1,
      deptGroupRoles: [
        DeptGroupRole(id: 11, deptCode: 'IT', deptName: 'Công nghệ thông tin'),
        DeptGroupRole(id: 12, deptCode: 'NS', deptName: 'Nhân sự'),
        DeptGroupRole(id: 13, deptCode: 'HTKH', deptName: 'Hỗ trợ khách hàng'),
        DeptGroupRole(id: 14, deptCode: 'KT', deptName: 'Kế toán'),
        DeptGroupRole(id: 15, deptCode: 'MK', deptName: 'Marketing'),
      ],
      accountGroups: [
        AccountGroup(id: 11, accountCode: '0029', accountName: 'Nguyễn Văn L'),
        AccountGroup(id: 12, accountCode: '0030', accountName: 'Lê Thị M'),
        AccountGroup(id: 13, accountCode: '0031', accountName: 'Trần Văn N'),
        AccountGroup(id: 14, accountCode: '0032', accountName: 'Bùi Thị O'),
        AccountGroup(id: 15, accountCode: '0033', accountName: 'Hoàng Văn P'),
      ],
      screens: [
        Screen(
          screenCode: 'E11',
          screenName: 'Hệ thống',
          screenSub: ScreenSub(
            screenCode: 'E11L00001',
            screenName: 'Quản lý hệ thống',
            screenSubSub: ScreenSubSub(
              screenCode: 'E11L00001.1',
              screenName: 'Chi tiết hệ thống',
              role: [1, 3],
            ),
          ),
        ),
        Screen(
          screenCode: 'E12',
          screenName: 'Quản lý dữ liệu',
          screenSub: ScreenSub(
            screenCode: 'E12L00001',
            screenName: 'Dữ liệu hệ thống',
            screenSubSub: ScreenSubSub(
              screenCode: 'E12L00001.1',
              screenName: 'Chi tiết dữ liệu',
              role: [3],
            ),
          ),
        ),
        Screen(
          screenCode: 'E13',
          screenName: 'Bảo trì hệ thống',
          screenSub: ScreenSub(
            screenCode: 'E13L00001',
            screenName: 'Lịch bảo trì',
            screenSubSub: ScreenSubSub(
              screenCode: 'E13L00001.1',
              screenName: 'Chi tiết bảo trì',
              role: [1, 3],
            ),
          ),
        ),
        Screen(
          screenCode: 'E14',
          screenName: 'Quản lý bảo mật',
          screenSub: ScreenSub(
            screenCode: 'E14L00001',
            screenName: 'Chính sách bảo mật',
            screenSubSub: ScreenSubSub(
              screenCode: 'E14L00001.1',
              screenName: 'Chi tiết bảo mật',
              role: [3],
            ),
          ),
        ),
        Screen(
          screenCode: 'E15',
          screenName: 'Hỗ trợ kỹ thuật',
          screenSub: ScreenSub(
            screenCode: 'E15L00001',
            screenName: 'Yêu cầu hỗ trợ',
            screenSubSub: ScreenSubSub(
              screenCode: 'E15L00001.1',
              screenName: 'Chi tiết hỗ trợ',
              role: [1, 3],
            ),
          ),
        ),
      ],
    ),
    RoleGroup(
      id: 4,
      roleCode: 'MK',
      roleName: 'Marketing',
      description: 'Nhóm quyền marketing',
      isUse: 1,
      deptGroupRoles: [
        DeptGroupRole(id: 16, deptCode: 'MK', deptName: 'Marketing'),
        DeptGroupRole(id: 17, deptCode: 'NS', deptName: 'Nhân sự'),
        DeptGroupRole(id: 18, deptCode: 'HTKH', deptName: 'Hỗ trợ khách hàng'),
        DeptGroupRole(id: 19, deptCode: 'IT', deptName: 'Công nghệ thông tin'),
        DeptGroupRole(id: 20, deptCode: 'KT', deptName: 'Kế toán'),
      ],
      accountGroups: [
        AccountGroup(id: 16, accountCode: '0034', accountName: 'Nguyễn Văn Q'),
        AccountGroup(id: 17, accountCode: '0035', accountName: 'Lê Thị R'),
        AccountGroup(id: 18, accountCode: '0036', accountName: 'Trần Văn S'),
        AccountGroup(id: 19, accountCode: '0037', accountName: 'Bùi Thị T'),
        AccountGroup(id: 20, accountCode: '0038', accountName: 'Hoàng Văn U'),
      ],
      screens: [
        Screen(
          screenCode: 'E16',
          screenName: 'Chiến lược marketing',
          screenSub: ScreenSub(
            screenCode: 'E16L00001',
            screenName: 'Chiến lược tổng quan',
            screenSubSub: ScreenSubSub(
              screenCode: 'E16L00001.1',
              screenName: 'Chi tiết chiến lược',
              role: [1, 2],
            ),
          ),
        ),
        Screen(
          screenCode: 'E17',
          screenName: 'Quản lý chiến dịch',
          screenSub: ScreenSub(
            screenCode: 'E17L00001',
            screenName: 'Chiến dịch marketing',
            screenSubSub: ScreenSubSub(
              screenCode: 'E17L00001.1',
              screenName: 'Chi tiết chiến dịch',
              role: [1],
            ),
          ),
        ),
        Screen(
          screenCode: 'E18',
          screenName: 'Phân tích thị trường',
          screenSub: ScreenSub(
            screenCode: 'E18L00001',
            screenName: 'Phân tích tổng quan',
            screenSubSub: ScreenSubSub(
              screenCode: 'E18L00001.1',
              screenName: 'Chi tiết phân tích',
              role: [1, 2],
            ),
          ),
        ),
        Screen(
          screenCode: 'E19',
          screenName: 'Hỗ trợ khách hàng',
          screenSub: ScreenSub(
            screenCode: 'E19L00001',
            screenName: 'Hỗ trợ và phản hồi',
            screenSubSub: ScreenSubSub(
              screenCode: 'E19L00001.1',
              screenName: 'Chi tiết hỗ trợ',
              role: [3],
            ),
          ),
        ),
        Screen(
          screenCode: 'E20',
          screenName: 'Báo cáo marketing',
          screenSub: ScreenSub(
            screenCode: 'E20L00001',
            screenName: 'Báo cáo tổng quan',
            screenSubSub: ScreenSubSub(
              screenCode: 'E20L00001.1',
              screenName: 'Chi tiết báo cáo',
              role: [1, 2, 3],
            ),
          ),
        ),
      ],
    ),
    RoleGroup(
      id: 5,
      roleCode: 'HTKH',
      roleName: 'Hỗ trợ khách hàng',
      description: 'Nhóm quyền hỗ trợ khách hàng',
      isUse: 1,
      deptGroupRoles: [
        DeptGroupRole(id: 21, deptCode: 'HTKH', deptName: 'Hỗ trợ khách hàng'),
        DeptGroupRole(id: 22, deptCode: 'NS', deptName: 'Nhân sự'),
        DeptGroupRole(id: 23, deptCode: 'IT', deptName: 'Công nghệ thông tin'),
        DeptGroupRole(id: 24, deptCode: 'KT', deptName: 'Kế toán'),
        DeptGroupRole(id: 25, deptCode: 'MK', deptName: 'Marketing'),
      ],
      accountGroups: [
        AccountGroup(id: 21, accountCode: '0039', accountName: 'Nguyễn Văn V'),
        AccountGroup(id: 22, accountCode: '0040', accountName: 'Lê Thị W'),
        AccountGroup(id: 23, accountCode: '0041', accountName: 'Trần Văn X'),
        AccountGroup(id: 24, accountCode: '0042', accountName: 'Bùi Thị Y'),
        AccountGroup(id: 25, accountCode: '0043', accountName: 'Hoàng Văn Z'),
      ],
      screens: [
        Screen(
          screenCode: 'E21',
          screenName: 'Chăm sóc khách hàng',
          screenSub: ScreenSub(
            screenCode: 'E21L00001',
            screenName: 'Quản lý chăm sóc',
            screenSubSub: ScreenSubSub(
              screenCode: 'E21L00001.1',
              screenName: 'Chi tiết chăm sóc',
              role: [1, 2],
            ),
          ),
        ),
        Screen(
          screenCode: 'E22',
          screenName: 'Phản hồi khách hàng',
          screenSub: ScreenSub(
            screenCode: 'E22L00001',
            screenName: 'Quản lý phản hồi',
            screenSubSub: ScreenSubSub(
              screenCode: 'E22L00001.1',
              screenName: 'Chi tiết phản hồi',
              role: [1, 2, 3],
            ),
          ),
        ),
        Screen(
          screenCode: 'E23',
          screenName: 'Hỗ trợ trực tuyến',
          screenSub: ScreenSub(
            screenCode: 'E23L00001',
            screenName: 'Trực tuyến hỗ trợ',
            screenSubSub: ScreenSubSub(
              screenCode: 'E23L00001.1',
              screenName: 'Chi tiết hỗ trợ',
              role: [1, 3],
            ),
          ),
        ),
        Screen(
          screenCode: 'E24',
          screenName: 'Báo cáo hỗ trợ',
          screenSub: ScreenSub(
            screenCode: 'E24L00001',
            screenName: 'Báo cáo hỗ trợ khách hàng',
            screenSubSub: ScreenSubSub(
              screenCode: 'E24L00001.1',
              screenName: 'Chi tiết báo cáo',
              role: [1, 2, 3],
            ),
          ),
        ),
        Screen(
          screenCode: 'E25',
          screenName: 'Quản lý khiếu nại',
          screenSub: ScreenSub(
            screenCode: 'E25L00001',
            screenName: 'Khiếu nại khách hàng',
            screenSubSub: ScreenSubSub(
              screenCode: 'E25L00001.1',
              screenName: 'Chi tiết khiếu nại',
              role: [1, 2],
            ),
          ),
        ),
      ],
    ),
  ];
}
