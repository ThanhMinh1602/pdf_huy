// ignore_for_file: await_only_futures

import 'package:account/features/e01S01003/model/role_group/account_group.dart';
import 'package:account/features/e01S01003/model/role_group/dept_group_role.dart';
import 'package:account/features/e01S01003/model/role_group/role_group.dart';
import 'package:bloc/bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
part 'e01S01003_event.dart';
part 'e01S01003_state.dart';
part 'e01S01003_bloc.freezed.dart';

class E01S01003Bloc extends Bloc<E01S01003Event, E01S01003State> {
  E01S01003Bloc() : super(const E01S01003State()) {
    on(onInit);
    on(onSelectGroupRole);
    on(onFilterStatus);
    on(onChangeTableUser);
    on(onToggleExpand);
    on(onToggleSubExpand);
    on(onDetaiRole);
    on(onToggleActions);
    on(onToggleCheckbox);
    on(onAllowsMultiSelectDectRole);
    on(onSelectDeptGroupRole);
    on(onSelectAccountGroup);
    on(onAddAccountGroupToList);
    on(onAddDeptGroupRoleToList);
    on(onUnselectAccount);
    on(onUnselectDept);
    add(const E01S01003Event.init());
  }

  Future<void> onInit(
      DashboardInitEvent event, Emitter<E01S01003State> emitter) async {
    final roleGroups = await RoleGroup.generateDatas;
    emitter(state.copyWith(
      roleGroups: roleGroups,
      isExpandedList: List.generate(roleGroups.length, (_) => false),
      subLevelExpandedList: List.generate(roleGroups.length, (_) => [false]),
    ));
  }

  void onSelectGroupRole(
      SelectGroupRoleEvent event, Emitter<E01S01003State> emitter) {
    bool isSelectGroupRole = !state.isAllowsMultiSelectGroupRole;
    emitter(state.copyWith(isAllowsMultiSelectGroupRole: isSelectGroupRole));
  }

  void onToggleCheckbox(
      ToggleCheckboxEvent event, Emitter<E01S01003State> emitter) {
    final selectedRoleGroupIds = List<int>.from(state.selectedRoleGroupIds);
    final roleGroupId = event.roleGroupId;

    if (selectedRoleGroupIds.contains(roleGroupId)) {
      selectedRoleGroupIds.remove(roleGroupId);
    } else {
      selectedRoleGroupIds.add(roleGroupId);
    }

    emitter(state.copyWith(selectedRoleGroupIds: selectedRoleGroupIds));
  }

  void onFilterStatus(
      FilterGroupStatusEvent event, Emitter<E01S01003State> emitter) {
    final dataByStatus = RoleGroup.generateDatas;
    List<RoleGroup> datas = [];
    int groupStatus = event.status;
    if (groupStatus != 2) {
      datas = dataByStatus
          .where((element) => element.isUse == groupStatus)
          .toList();
    } else {
      datas = dataByStatus;
    }

    emitter(state.copyWith(groupStatus: groupStatus, roleGroups: datas));
  }

  void onDeleteGroupRole(
      deleteGroupStatusEvent event, Emitter<E01S01003State> emitter) {}

  void onChangeTableUser(
      ChangeTabelUserEvent event, Emitter<E01S01003State> emitter) {
    final curentTableUser = event.curentTableUser;
    emitter(state.copyWith(curentTableUser: curentTableUser));
  }

  void onDetaiRole(TapDetailRoleEvent event, Emitter<E01S01003State> emitter) {
    final roleGroupSimple = event.roleGroupSimple;
    emitter(state.copyWith(roleGroup: roleGroupSimple));
  }

  void onToggleExpand(
      ToggleExpandEvent event, Emitter<E01S01003State> emitter) {
    final index = event.index;
    List<bool> newIsExpandedList = List.from(state.isExpandedList);
    newIsExpandedList[index] = !newIsExpandedList[index];
    emitter(state.copyWith(isExpandedList: newIsExpandedList));
  }

  void onToggleSubExpand(
      ToggleSubExpandEvent event, Emitter<E01S01003State> emitter) {
    final index = event.index;
    final subIndex = event.subIndex;
    final newSubLevelExpandedList =
        List<List<bool>>.from(state.subLevelExpandedList);
    newSubLevelExpandedList[index] = List.from(newSubLevelExpandedList[index]);
    newSubLevelExpandedList[index][subIndex] =
        !newSubLevelExpandedList[index][subIndex];
    emitter(state.copyWith(subLevelExpandedList: newSubLevelExpandedList));
  }

  void onToggleActions(
      ToggleActionsEvent event, Emitter<E01S01003State> emitter) {
    final newActionsVisibleList =
        List<List<List<bool>>>.from(state.actionsVisibleList);
    newActionsVisibleList[event.index][event.subIndex][event.subSubIndex] =
        !newActionsVisibleList[event.index][event.subIndex][event.subSubIndex];
    emitter(state.copyWith(actionsVisibleList: newActionsVisibleList));
  }

  void onAllowsMultiSelectDectRole(
      AllowsMultiSelectDectRoleEvent event, Emitter<E01S01003State> emitter) {
    bool isAllowsMultiSelectDecentralizationRole =
        !state.isAllowsMultiSelectDecentralizationRole;
    emitter(state.copyWith(
        isAllowsMultiSelectDecentralizationRole:
            isAllowsMultiSelectDecentralizationRole));
  }

  void onSelectDeptGroupRole(
      SelectDeptGroupRoleEvent event, Emitter<E01S01003State> emittter) {
    emittter(state.copyWith(deptGroupRole: event.deptGroupRole));
  }

  void onSelectAccountGroup(
      SelectAccountGroupEvent event, Emitter<E01S01003State> emittter) {
    emittter(state.copyWith(accountGroup: event.accountGroup));
  }

  void onAddAccountGroupToList(
      AddAccountGroupToListEvent event, Emitter<E01S01003State> emitter) {
    final List<AccountGroup> updatedAccountGroups =
        List.from(state.accountGroups)..add(event.accountGroup);
    final List<AccountGroup> reversedAccountGroups =
        updatedAccountGroups.reversed.toList();
    emitter(state.copyWith(accountGroups: reversedAccountGroups));
  }

  void onUnselectAccount(
      UnSelectAccountEvent event, Emitter<E01S01003State> emitter) {
    final id = event.id;
    final List<AccountGroup> updatedAccountGroups =
        List.from(state.accountGroups)
          ..removeWhere((accountGroup) => accountGroup.id == id);

    emitter(state.copyWith(accountGroups: updatedAccountGroups));
  }

  void onAddDeptGroupRoleToList(
      AddDeptGroupRoleToListEvent event, Emitter<E01S01003State> emitter) {
    final List<DeptGroupRole> updatedDeptGroupRoles =
        List.from(state.deptGroupRoles)..add(event.deptGroupRole);
    final List<DeptGroupRole> reversedDeptGroupRole =
        updatedDeptGroupRoles.reversed.toList();
    emitter(state.copyWith(deptGroupRoles: reversedDeptGroupRole));
  }

  void onUnselectDept(
      UnSelectDeptEvent event, Emitter<E01S01003State> emitter) {
    final id = event.id;
    final List<DeptGroupRole> updatedDeptGroupRoles =
        List.from(state.deptGroupRoles)
          ..removeWhere((deptGroupRole) => deptGroupRole.id == id);

    emitter(state.copyWith(deptGroupRoles: updatedDeptGroupRoles));
  }
}
