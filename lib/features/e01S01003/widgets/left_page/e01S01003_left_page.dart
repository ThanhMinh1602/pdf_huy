
import 'package:account/core/constants/app_color.dart';
import 'package:account/core/constants/app_style.dart';
import 'package:account/core/utils/color_resources.dart';
import 'package:account/core/utils/dimensions.dart';
import 'package:account/core/utils/icons.dart';
import 'package:account/core/widgets/button/common_elevated_button.dart';
import 'package:account/core/widgets/check_box/app_checkbox.dart';
import 'package:account/core/widgets/table/number_paginator.dart';
import 'package:account/features/e01S01003/bloc/e01S01003_bloc.dart';
import 'package:account/features/e01S01003/model/role_group/role_group.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class E01S01003LeftPage extends StatefulWidget {
  const E01S01003LeftPage({super.key});

  @override
  State<E01S01003LeftPage> createState() => _E01S01003LeftPageState();
}

class _E01S01003LeftPageState extends State<E01S01003LeftPage> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 3,
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: AppColor.c_F8FAFC,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: BlocConsumer<E01S01003Bloc, E01S01003State>(
          listener: (context, state) {},
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 10.0),
                  _buildLeftHeader(
                    onTapBack: () {},
                    onTapXLS: () {},
                    onTapRemove: () {},
                  ),
                  CustomCheckBox(
                    label: 'Chọn',
                    onChanged: (value) {
                      context
                          .read<E01S01003Bloc>()
                          .add(const E01S01003Event.selectGroupRole());
                    },
                    value: state.isAllowsMultiSelectGroupRole,
                  ),
                  _buildTable(context,
                      dataRows: state.roleGroups, state: state),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: NumberPaginator(
                          limit: 10,
                          currentPage: 1,
                          numberPages: 10,
                          onLimitChange: (p0) {},
                          onPageChange: (p0) {},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildLeftHeader({
    required VoidCallback onTapBack,
    required VoidCallback onTapXLS,
    required VoidCallback onTapRemove,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: onTapBack,
            child: Image.asset(IconsApp.buttonDistanceLeft),
          ),
          SizedBox(
            width: 48,
            child: CommonElevatedButton(
              buttonIcon: IconsApp.xls,
              backgroundColor: ColorResources.buttonSave,
              onTap: onTapXLS,
            ),
          ),
          const SizedBox(width: Dimensions.paddingSizeExtraSmall),
          SizedBox(
            width: 48,
            child: CommonElevatedButton(
              borderColor: ColorResources.redBoder,
              backgroundColor: ColorResources.white,
              radius: 12,
              isBorder: true,
              buttonIcon: IconsApp.delete,
              textColor: ColorResources.redBoder,
              onTap: onTapRemove,
            ),
          ),
          const SizedBox(width: Dimensions.paddingSizeExtraSmall),
        ],
      ),
    );
  }

  Widget _buildTable(BuildContext context,
      {required List<RoleGroup> dataRows, required E01S01003State state}) {
    return Column(
      children: [
        Table(
          border: const TableBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(6.0),
            ),
          ),
          columnWidths: const {
            0: FlexColumnWidth(2.0),
            1: FlexColumnWidth(6.5),
            2: FlexColumnWidth(6.5),
            3: FlexColumnWidth(3.5),
          },
          children: [
            _buildTableHeader(),
            _buildTableFilter(state: state, context),
            for (int i = 0; i < dataRows.length; i++)
              _buildTableRow(
                onTapRow: () {
                  context
                      .read<E01S01003Bloc>()
                      .add(E01S01003Event.onTapDetailRole(dataRows[i]));
                },
                dataRows[i],
                index: i,
                state: state,
              ),
          ],
        ),
      ],
    );
  }

  TableRow _buildTableHeader() {
    return TableRow(
      decoration: const BoxDecoration(
        color: AppColor.c_C8E7CA,
      ),
      children: [
        _buildTableCell(text: 'STT', isHeader: true),
        _buildTableCell(text: 'Mã nhóm quyền', isHeader: true),
        _buildTableCell(text: 'Tên nhóm quyền', isHeader: true),
        _buildTableCell(text: 'Sử dụng', isHeader: true),
      ],
    );
  }

  TableRow _buildTableFilter(BuildContext context,
      {required E01S01003State state}) {
    return TableRow(
      children: [
        Container(
          height: 40,
          color: AppColor.c_FFFFFF,
        ),
        Container(
          padding: const EdgeInsets.all(5),
          alignment: Alignment.centerRight,
          height: 40,
          color: AppColor.c_FFFFFF,
          child: Image.asset(
            IconsApp.search,
            color: Colors.black,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(5),
          alignment: Alignment.centerRight,
          height: 40,
          color: AppColor.c_FFFFFF,
          child: Image.asset(
            IconsApp.search,
            color: Colors.black,
          ),
        ),
        Container(
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          color: AppColor.c_FFFFFF,
          child: DropdownButton<int>(
            value: state.groupStatus,
            underline: Container(),
            isExpanded: true,
            items: const [
              DropdownMenuItem(
                value: 2,
                child: Text('Tất cả'),
              ),
              DropdownMenuItem(
                value: 1,
                child: Text('Đã dùng'),
              ),
              DropdownMenuItem(
                value: 0,
                child: Text('Chưa dùng'),
              ),
            ],
            onChanged: (newValue) {
              context
                  .read<E01S01003Bloc>()
                  .add(E01S01003Event.filterGroupStatus(newValue!));
            },
          ),
        ),
      ],
    );
  }

  TableRow _buildTableRow(RoleGroup roleGroupSimple,
      {required int index,
      required E01S01003State state,
      void Function()? onTapRow}) {
    final isSelected = state.selectedRoleGroupIds.contains(roleGroupSimple.id);

    return TableRow(
      decoration: BoxDecoration(
        color: index % 2 == 0 ? AppColor.c_C8E7CA : AppColor.c_F8FAFC,
      ),
      children: [
        state.isAllowsMultiSelectGroupRole
            ? Checkbox(
                value: isSelected,
                onChanged: (value) {
                  if (value != null) {
                    context
                        .read<E01S01003Bloc>()
                        .add(E01S01003Event.toggleCheckbox(roleGroupSimple.id));
                  }
                },
              )
            : _buildTableCell(text: roleGroupSimple.id.toString()),
        _buildTableCell(text: roleGroupSimple.roleCode, onTap: onTapRow),
        _buildTableCell(text: roleGroupSimple.roleName, onTap: onTapRow),
        Checkbox(
          value: roleGroupSimple.isUse == 1,
          onChanged: null,
        ),
      ],
    );
  }

  Widget _buildTableCell({
    required String text,
    bool? isHeader,
    void Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: isHeader == true ? 48.0 : 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.symmetric(
            vertical: BorderSide(
              color: AppColor.c_FFFFFF,
              width: 1,
            ),
          ),
        ),
        child: Text(
          text,
          style: isHeader == true ? AppStyle.tableHeader : AppStyle.tableRow,
        ),
      ),
    );
  }
}
