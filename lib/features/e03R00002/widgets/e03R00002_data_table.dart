
import 'package:account/core/constants/app_color.dart';
import 'package:account/core/constants/app_style.dart';
import 'package:account/core/utils/color_resources.dart';
import 'package:account/core/utils/icons.dart';
import 'package:account/core/widgets/button/common_elevated_button.dart';
import 'package:account/core/widgets/table/number_paginator.dart';
import 'package:account/features/e01S01003/bloc/e01S01003_bloc.dart';
import 'package:account/features/e01S01003/model/role_group/role_group.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class E03R00002DataTable extends StatefulWidget {
  const E03R00002DataTable({super.key});

  @override
  State<E03R00002DataTable> createState() => _E03R00002DataTableState();
}

class _E03R00002DataTableState extends State<E03R00002DataTable> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 5,
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: AppColor.c_F8FAFC,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: BlocProvider(
          create: (context) => E01S01003Bloc(),
          child: BlocConsumer<E01S01003Bloc, E01S01003State>(
            listener: (context, state) {},
            builder: (context, state) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 10.0),
                    _buildLeftHeader(
                      onTapBack: () {},
                    ),
                    _buildTable(context,
                        dataRows: state.roleGroups, state: state),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        NumberPaginator(
                          limit: 10,
                          currentPage: 1,
                          numberPages: 10,
                          onLimitChange: (p0) {},
                          onPageChange: (p0) {},
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildLeftHeader({
    required VoidCallback onTapBack,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: onTapBack,
            child: Image.asset(IconsApp.buttonDistanceLeft),
          ),
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
            0: FlexColumnWidth(1.2),
            1: FlexColumnWidth(3.0),
            2: FlexColumnWidth(3.5),
            3: FlexColumnWidth(3.5),
            4: FlexColumnWidth(2.0),
          },
          children: [
            _buildTableHeader(),
            for (int i = 0; i < dataRows.length; i++)
              _buildTableRow(
                dataRows[i],
                id: dataRows[i].id,
                current: state.curentTableUser,
                onTapRow: () {
                  context
                      .read<E01S01003Bloc>()
                      .add(E01S01003Event.onTapDetailRole(dataRows[i]));
                },
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
        color: AppColor.c_B8E5FA,
      ),
      children: [
        _buildTableCell(text: 'STT', isHeader: true),
        _buildTableCell(text: 'Thời gian', isHeader: true),
        _buildTableCell(text: 'Loại hồ sơ', isHeader: true),
        _buildTableCell(text: 'Tên tập tin', isHeader: true),
        _buildTableCell(text: '', isHeader: true),
      ],
    );
  }

  TableRow _buildTableRow(RoleGroup roleGroupSimple,
      {required int index,
      required E01S01003State state,
      required int current,
      required int id,
      void Function()? onTapRow}) {
    final isSelected = state.selectedRoleGroupIds.contains(roleGroupSimple.id);

    return TableRow(
      decoration: BoxDecoration(
        color: index % 2 == 1 ? AppColor.c_F0FAFE : AppColor.c_F8FAFC,
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
        _buildTableCell(text: roleGroupSimple.roleName, onTap: onTapRow),
        _buildDeleteButton(
          onTap: () {
            if (current == 0) {
              context.read<E01S01003Bloc>().add(
                    E01S01003Event.unSelectDept(id),
                  );
            } else {
              context.read<E01S01003Bloc>().add(
                    E01S01003Event.unSelectAccount(id),
                  );
            }
          },
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
          style: isHeader == true
              ? TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: AppColor.c_323F4B,
                )
              : AppStyle.tableRow,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildDeleteButton({void Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(
            child: CommonElevatedButton(
              width: 45,
              buttonIcon: IconsApp.closeCircle,
              backgroundColor: ColorResources.buttonSave,
            ),
          )),
    );
  }
}
