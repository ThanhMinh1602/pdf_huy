part of 'e01S01003_bloc.dart';

@freezed
class E01S01003State with _$E01S01003State {
  const factory E01S01003State({
    @Default(false) bool isLoading,
    @Default(false) bool isAllowsMultiSelectGroupRole,
    @Default(false) bool isAllowsMultiSelectDecentralizationRole,
    AccountGroup? accountGroup,
    DeptGroupRole? deptGroupRole,
    @Default([]) List<AccountGroup> accountGroups,
    @Default([]) List<DeptGroupRole> deptGroupRoles,
    @Default(2) int groupStatus,
    @Default(0) int curentTableUser,
    @Default([]) List<RoleGroup> roleGroups,
    @Default([]) List<bool> isExpandedList,
    @Default([]) List<List<bool>> subLevelExpandedList,
    @Default([]) List<List<List<bool>>> actionsVisibleList,
    RoleGroup? roleGroup,
    @Default([]) List<int> selectedRoleGroupIds,
    @Default([]) List<int> selectedDecentralizationRoleIds,
  }) = _E01S01003State;
}
