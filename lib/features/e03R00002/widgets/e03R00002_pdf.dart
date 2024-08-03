import 'dart:io';

import 'package:account/core/constants/app_color.dart';
import 'package:account/core/models/item_base_model.dart';
import 'package:account/core/utils/color_resources.dart';
import 'package:account/core/utils/icons.dart';
import 'package:account/core/utils/spaces.dart';
import 'package:account/core/widgets/button/common_button.dart';
import 'package:account/core/widgets/input/common_dropdown.dart';
import 'package:account/core/widgets/input/text_field_input.dart';
import 'package:account/features/e03R00002/cubit/e03_r00002_cubit.dart';
import 'package:account/features/e03R00002/cubit/e03_r00002_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pdfx/pdfx.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class E03R00002Pdf extends StatefulWidget {
  const E03R00002Pdf({super.key});

  @override
  State<E03R00002Pdf> createState() => _E03R00002PdfState();
}

class _E03R00002PdfState extends State<E03R00002Pdf> {
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
                  _buildPdfPicker(context),
                  spaceH20,
                  Row(
                    children: [
                      const SizedBox(width: 5),
                      TextFieldInput(
                          controller: TextEditingController(
                              text: state.filePickerResult?.files.single.name ??
                                  ''),
                          title: "Tên file",
                          textAlignEndTitle: true,
                          isEnabled: true),
                      const SizedBox(width: 15),
                      SizedBox(
                        width: 320,
                        child: CommonDropdown(
                          value: state.profileType,
                          onChanged: (value) {
                            context
                                .read<E03R00002Cubit>()
                                .selectProfileType(value);
                          },
                          items: [
                            ItemBaseModel(
                              id: 0,
                              name: 'Nhân Sự',
                            ),
                            ItemBaseModel(
                              id: 1,
                              name: 'Kế toán',
                            ),
                            ItemBaseModel(
                              id: 2,
                              name: 'CNTT',
                            ),
                            ItemBaseModel(
                              id: 3,
                              name: 'Marketing',
                            )
                          ],
                          title: 'Loại hồ sơ',
                        ),
                      ),
                    ],
                  ),
                  spaceH10,
                  Row(
                    children: [
                      const SizedBox(
                        width: 18,
                      ),
                      SizedBox(
                        width: 302,
                        child: GestureDetector(
                          onTap: () async {
                            final time = await showDatePicker(
                                context: context,
                                firstDate: DateTime.now(),
                                lastDate: DateTime(3099),
                                currentDate: DateTime.now(),
                                useRootNavigator: false);
                            context
                                .read<E03R00002Cubit>()
                                .onSelectDateTime(time ?? DateTime.now());
                          },
                          child: TextFieldInput(
                            title: "Ngày",
                            controller:
                                TextEditingController(text: state.createdAt),
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
                          onChanged: (value) {
                            context
                                .read<E03R00002Cubit>()
                                .selectSignatory(value);
                          },
                          items: [
                            ItemBaseModel(
                              id: 1,
                              name: 'Nguyễn Văn A',
                            ),
                            ItemBaseModel(
                              id: 2,
                              name: 'Lê B',
                            ),
                            ItemBaseModel(
                              id: 3,
                              name: 'Trần A',
                            ),
                          ],
                          title: 'Người ký ',
                        ),
                      ),
                    ],
                  ),
                  spaceH10,
                  _buildButtonUpload(context),
                  spaceH10,
                  _buildPdfViewer(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildPdfViewer() {
    return BlocBuilder<E03R00002Cubit, E03R00002State>(
      builder: (context, state) {
        if (state.filePickerResult == null) {
          return const Center(
            child: Text('Chưa có file nào được chọn'),
          );
        }
        return Container(
          height: 1580,
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 50.0,
                color: AppColor.c_323639,
              ),
              left: BorderSide(
                width: 50.0,
                color: AppColor.c_323639,
              ),
              right: BorderSide(
                width: 50.0,
                color: AppColor.c_323639,
              ),
            ),
          ),
          child: Column(
            children: [
              Container(
                height: 50.0,
                width: double.infinity,
                alignment: Alignment.topCenter,
                color: AppColor.c_323639,
                child: const Row(
                  children: [],
                ),
              ),
              Expanded(
                child: kIsWeb
                    ? state.filePickerResult!.files.single.bytes != null
                        ? SfPdfViewer.memory(
                            state.filePickerResult!.files.single.bytes!)
                        : const Center(child: Text('No PDF selected'))
                    : state.filePickerResult!.files.single.path != null
                        ? SfPdfViewer.file(
                            File(state.filePickerResult!.files.single.path!))
                        : const Center(child: Text('No PDF selected')),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildPdfPicker(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<E03R00002Cubit>().pdfPicker();
      },
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          color: AppColor.c_F8FAFC,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: Colors.grey,
            width: 2.0,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.network("assets/icons/pdf.svg"),
              const Text(
                "Kéo thả hoặc bấm vào đây để tải tập tin lên",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildButtonSave() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          width: 128,
          child: CommonButton(
            backgroundColor: ColorResources.buttonSave,
            buttonIcon: IconsApp.edit,
            textName: "Lưu và ký gửi",
          ),
        ),
      ],
    );
  }

  Widget _buildButtonUpload(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: SizedBox(
        width: 100,
        child: CommonButton(
          onTap: () {
            context.read<E03R00002Cubit>().onSubmitPdfFile(
                profileType: 'Nhân Sự', signatory: "Thanh Minh");
          },
          backgroundColor: ColorResources.buttonSave,
          buttonIcon: IconsApp.add,
          textName: "Tải lên",
        ),
      ),
    );
  }
}
