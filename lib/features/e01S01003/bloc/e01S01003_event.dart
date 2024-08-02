part of 'e01S01003_bloc.dart';

@freezed
class E01S01003Event with _$E01S01003Event {
  const factory E01S01003Event.init() = DashboardInitEvent;
  const factory E01S01003Event.selectGroupRole() = SelectGroupRoleEvent;
  const factory E01S01003Event.allowsMultiSelectDectRole() =
      AllowsMultiSelectDectRoleEvent;
  const factory E01S01003Event.filterGroupStatus(int status) =
      FilterGroupStatusEvent;
  const factory E01S01003Event.deleteGroupStatus(int status) =
      deleteGroupStatusEvent;
  const factory E01S01003Event.deleteMultiGroupStatus(int id) =
      DeleteMultiGroupStatusEvent;
  const factory E01S01003Event.changeTableUser(int curentTableUser) =
      ChangeTabelUserEvent;
  const factory E01S01003Event.onTapDetailRole(RoleGroup roleGroupSimple) =
      TapDetailRoleEvent;
  const factory E01S01003Event.toggleActions(
      int index, int subIndex, int subSubIndex) = ToggleActionsEvent;
  // Thêm sự kiện cho việc mở rộng hàng
  const factory E01S01003Event.toggleExpand(int index) = ToggleExpandEvent;
  const factory E01S01003Event.toggleSubExpand(int index, int subIndex) =
      ToggleSubExpandEvent;
  const factory E01S01003Event.toggleSubSubExpand(
      int index, int subIndex, int subSubIndex) = ToggleSubSubExpandEvent;
  const factory E01S01003Event.toggleCheckbox(int roleGroupId) =
      ToggleCheckboxEvent;
  const factory E01S01003Event.toggleCheckboxDectRole(int roleDectRoleId) =
      ToggleCheckboxDectRoleEvent;
  const factory E01S01003Event.selectDeptGroupRole(
      DeptGroupRole deptGroupRole) = SelectDeptGroupRoleEvent;
  const factory E01S01003Event.selectAccountGroup(AccountGroup accountGroup) =
      SelectAccountGroupEvent;
  const factory E01S01003Event.addDeptGroupRoleToList(
      DeptGroupRole deptGroupRole) = AddDeptGroupRoleToListEvent;
  const factory E01S01003Event.addAccountGroupToList(
      AccountGroup accountGroup) = AddAccountGroupToListEvent;

  const factory E01S01003Event.unSelectAccount(int id) = UnSelectAccountEvent;
  const factory E01S01003Event.unSelectDept(int id) = UnSelectDeptEvent;
}
