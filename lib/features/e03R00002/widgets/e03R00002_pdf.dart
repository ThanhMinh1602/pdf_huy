import 'dart:io';

import 'package:account/core/constants/app_color.dart';
import 'package:account/core/models/item_base_model.dart';
import 'package:account/core/utils/color_resources.dart';
import 'package:account/core/utils/icons.dart';
import 'package:account/core/utils/spaces.dart';
import 'package:account/core/utils/styles.dart';
import 'package:account/core/widgets/button/common_button.dart';
import 'package:account/core/widgets/check_box/app_checkbox.dart';
import 'package:account/core/widgets/input/common_dropdown.dart';
import 'package:account/core/widgets/input/text_field_input.dart';
import 'package:account/features/e03R00002/cubit/e03_r00002_cubit.dart';
import 'package:account/features/e03R00002/cubit/e03_r00002_state.dart';
import 'package:account/features/e03R00002/domain/usecase/validate_usecase.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class E03R00002Pdf extends StatefulWidget {
  const E03R00002Pdf({super.key});

  @override
  State<E03R00002Pdf> createState() => _E03R00002PdfState();
}

class _E03R00002PdfState extends State<E03R00002Pdf> {
  final validateUsecase = ValidateUsecase();

  @override
  void initState() {
    super.initState();
    context.read<E03R00002Cubit>().init();
  }

  @override
  void dispose() {
    context.read<E03R00002Cubit>().pdfViewerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<E03R00002Cubit, E03R00002State>(
      builder: (context, state) {
        return Flexible(
          flex: 8,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: AppColor.c_F8FAFC,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  spaceH10,
                  _buildButtonSave(),
                  spaceH10,
                  _buildPdfPicker(context, state),
                  spaceH30,
                  _buildProfileNameAndTypeDropdown(context, state),
                  spaceH20,
                  _buildDateAndSignatoryRow(context, state),
                  spaceH20,
                  _buildScannedDocumentsAndNotes(context, state),
                  spaceH24,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (state.isEdit == true)
                        _buildUpdateButon(context, state),
                      spaceW10,
                      state.isEdit == true
                          ? _buildAddNewButton(context, state)
                          : _buildButtonUpload(context, state),
                    ],
                  ),
                  spaceH10,
                  _buildPdfViewer(state),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildPdfViewer(E03R00002State state) {
    if (state.filePickerResult == null) {
      return const Center(
        child: Text('Chưa có file nào được chọn'),
      );
    }

    return Container(
      height: 1580,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 50.0, color: AppColor.c_323639),
          left: BorderSide(width: 50.0, color: AppColor.c_323639),
          right: BorderSide(width: 50.0, color: AppColor.c_323639),
        ),
      ),
      child: Column(
        children: [
          _buildControllerPdfViewer(
            fileName: state.filePickerResult?.name ?? '',
            onSubmitted: (value) {
              context.read<E03R00002Cubit>().updateCurrentPage(
                    int.parse(value),
                  );
            },
            curentPageController:
                context.read<E03R00002Cubit>().curentPageController,
            percentController: context.read<E03R00002Cubit>().percentController,
            maxPage: state.maxPage ?? 0,
            onTapZoomIn: () => context.read<E03R00002Cubit>().zoomIn(),
            onTapZoomOut: () {
              context.read<E03R00002Cubit>().zoomOut();
            },
            onTapDownload: () {},
            onTapPrint: () {},
            onTapRotate: () {},
          ),
          Expanded(
            child: kIsWeb
                ? state.filePickerResult?.bytes != null
                    ? SfPdfViewer.memory(
                        interactionMode: PdfInteractionMode.selection,
                        controller:
                            context.read<E03R00002Cubit>().pdfViewerController,
                        maxZoomLevel: 100,
                        onZoomLevelChanged: (details) {},
                        state.filePickerResult!.bytes!)
                    : const Center(child: Text('No PDF selected'))
                : state.filePickerResult!.path != null
                    ? SfPdfViewer.file(
                        controller:
                            context.read<E03R00002Cubit>().pdfViewerController,
                        File(state.filePickerResult!.path!))
                    : const Center(child: Text('No PDF selected')),
          ),
        ],
      ),
    );
  }

  Widget _buildControllerPdfViewer(
      {required String fileName,
      TextEditingController? percentController,
      TextEditingController? curentPageController,
      required int maxPage,
      void Function()? onTapZoomOut,
      void Function()? onTapZoomIn,
      void Function()? onTapRotate,
      void Function()? onTapDownload,
      void Function()? onTapPrint,
      void Function(String)? onSubmitted}) {
    return Container(
      height: 50.0,
      width: double.infinity,
      color: AppColor.c_323639,
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.menu, color: AppColor.c_FFFFFF, size: 30.0),
          spaceW10,
          SizedBox(
            width: 400.0,
            child: Text(
              overflow: TextOverflow.ellipsis,
              fileName,
              style: poppinsRegular.copyWith(
                fontSize: 15,
                color: AppColor.c_FFFFFF,
              ),
            ),
          ),
          spaceW10,
          _buildInput(
              width: 30,
              onSubmitted: onSubmitted,
              controller: curentPageController),
          spaceW10,
          const Text('/',
              style: TextStyle(color: AppColor.c_FFFFFF, fontSize: 20.0)),
          spaceW10,
          Text(
            maxPage.toString(),
            style: const TextStyle(color: AppColor.c_FFFFFF, fontSize: 15),
          ),
          spaceW10,
          const VerticalDivider(
              width: 1, indent: 5, endIndent: 5, color: AppColor.c_FFFFFF),
          spaceW10,
          _buildButtonZoom(icon: Icons.remove, onTap: onTapZoomOut),
          _buildInput(width: 60, controller: percentController),
          _buildButtonZoom(icon: Icons.add, onTap: onTapZoomIn),
          spaceW10,
          const VerticalDivider(
            width: 1,
            indent: 5,
            endIndent: 5,
            color: AppColor.c_FFFFFF,
          ),
          spaceW10,
          _buildControllerIcon(
              icon: Icons.rotate_90_degrees_ccw_outlined, onTap: onTapRotate),
          const Spacer(),
          _buildControllerIcon(icon: Icons.download, onTap: onTapDownload),
          spaceW10,
          _buildControllerIcon(icon: Icons.print, onTap: onTapPrint),
        ],
      ),
    );
  }

  Widget _buildControllerIcon(
      {required IconData icon, void Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(icon, color: AppColor.c_FFFFFF, size: 25.0),
    );
  }

  GestureDetector _buildButtonZoom(
      {required IconData icon, void Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Icon(icon, color: AppColor.c_FFFFFF)),
    );
  }

  Widget _buildInput(
      {TextEditingController? controller,
      double? width,
      void Function(String)? onSubmitted}) {
    return SizedBox(
      width: width,
      height: 30,
      child: TextField(
        controller: controller,
        onSubmitted: onSubmitted,
        decoration: const InputDecoration(
          errorBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          border: InputBorder.none,
          filled: true,
          fillColor: AppColor.c_242220,
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          isDense: true,
        ),
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly,
        ],
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 14, color: AppColor.c_FFFFFF),
      ),
    );
  }

  Widget _buildPdfPicker(BuildContext context, E03R00002State state) {
    return GestureDetector(
      onTap: () {
        context.read<E03R00002Cubit>().pdfPicker();
      },
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          color: AppColor.c_F8FAFC,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Colors.grey, width: 2.0),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.network("assets/icons/pdf.svg"),
              Text(
                state.filePickerResult?.name ??
                    "Kéo thả hoặc bấm vào đây để tải tập tin lên",
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileNameAndTypeDropdown(
      BuildContext context, E03R00002State state) {
    return Row(
      children: [
        TextFieldInput(
          controller: context.read<E03R00002Cubit>().fileNameController,
          title: "Tên file",
          textAlignEndTitle: true,
          isEnabled: true,
        ),
        const SizedBox(width: 15),
        SizedBox(
          width: 320,
          child: CommonDropdown(
            value: state.profileType,
            onChanged: (value) {
              context.read<E03R00002Cubit>().selectProfileType(value);
            },
            items: [
              ItemBaseModel(id: 0, name: 'Nhân Sự'),
              ItemBaseModel(id: 1, name: 'Kế toán'),
              ItemBaseModel(id: 2, name: 'CNTT'),
              ItemBaseModel(id: 3, name: 'Marketing'),
            ],
            title: 'Loại hồ sơ',
          ),
        ),
      ],
    );
  }

  Widget _buildDateAndSignatoryRow(BuildContext context, E03R00002State state) {
    return Row(
      children: [
        const SizedBox(width: 18),
        SizedBox(
          width: 302,
          child: GestureDetector(
            onTap: () async {
              final time = await showDatePicker(
                context: context,
                firstDate: DateTime.now(),
                lastDate: DateTime(3099),
                currentDate: DateTime.now(),
                useRootNavigator: false,
              );
              context
                  .read<E03R00002Cubit>()
                  .onSelectDateTime(time ?? DateTime.now());
            },
            child: TextFieldInput(
              title: "Ngày",
              controller: context.read<E03R00002Cubit>().dateController,
              textAlignEndTitle: true,
              isEnabled: false,
              suffixAssetUrl: IconsApp.calendar,
              isShowSuffixIcon: true,
              onChanged: (p0) {},
            ),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: CommonDropdown(
            value: state.signatory,
            onChanged: (value) {
              context.read<E03R00002Cubit>().selectSignatory(value);
            },
            items: [
              ItemBaseModel(id: 1, name: 'Nguyễn Văn A'),
              ItemBaseModel(id: 2, name: 'Lê B'),
              ItemBaseModel(id: 3, name: 'Trần A'),
            ],
            title: 'Người ký ',
          ),
        ),
      ],
    );
  }

  Widget _buildScannedDocumentsAndNotes(
      BuildContext context, E03R00002State state) {
    return Row(
      children: [
        CustomCheckBox(
          title: 'Chứng từ scan',
          value: state.scannedDocument!,
          onChanged: (value) {
            context.read<E03R00002Cubit>().scannedDocumentOnCheck(value);
          },
        ),
        spaceW40,
        TextFieldInput(
          controller: context.read<E03R00002Cubit>().noteController,
          title: "Ghi chú",
          textAlignEndTitle: true,
          isEnabled: true,
        ),
      ],
    );
  }

  Widget _buildButtonSave() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          width: 128,
          child: CommonButton(
            onTap: () {
              context.read<E03R00002Cubit>().saveAndSubmitAllFile();
            },
            backgroundColor: ColorResources.buttonSave,
            buttonIcon: IconsApp.edit,
            textName: "Lưu và ký gửi",
          ),
        ),
      ],
    );
  }

  Widget _buildButtonUpload(BuildContext context, E03R00002State state) {
    final isEnabled = validateUsecase(state);
    return Align(
      alignment: Alignment.centerRight,
      child: SizedBox(
        width: 120,
        child: CommonButton(
          onTap: isEnabled
              ? () {
                  if (isEnabled) {
                    context.read<E03R00002Cubit>().onSubmitPdfFile();
                  }
                }
              : null,
          backgroundColor:
              (isEnabled) ? ColorResources.buttonSave : AppColor.c_939291,
          buttonIcon: IconsApp.add,
          textName: "Tải lên",
        ),
      ),
    );
  }

  Widget _buildAddNewButton(BuildContext context, E03R00002State state) {
    return Align(
      alignment: Alignment.centerRight,
      child: SizedBox(
        width: 120,
        child: CommonButton(
          onTap: () => context.read<E03R00002Cubit>().addNew(),
          backgroundColor: ColorResources.buttonSave,
          buttonIcon: IconsApp.add,
          textName: "Thêm mới",
        ),
      ),
    );
  }

  Widget _buildUpdateButon(BuildContext context, E03R00002State state) {
    return Align(
      alignment: Alignment.centerRight,
      child: SizedBox(
        width: 100,
        child: CommonButton(
          onTap: () =>
              context.read<E03R00002Cubit>().updatePdfFile(),
          backgroundColor: ColorResources.buttonSave,
          buttonIcon: IconsApp.add,
          textName: "Cập nhật",
        ),
      ),
    );
  }
}
