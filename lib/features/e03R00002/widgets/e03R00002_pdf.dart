import 'package:account/core/constants/app_color.dart';
import 'package:account/core/models/item_base_model.dart';
import 'package:account/core/utils/color_resources.dart';
import 'package:account/core/utils/icons.dart';
import 'package:account/core/utils/spaces.dart';
import 'package:account/core/widgets/button/common_button.dart';
import 'package:account/core/widgets/input/common_dropdown.dart';
import 'package:account/core/widgets/input/text_field_input.dart';
import 'package:account/core/widgets/pdf_viewer.dart';
import 'package:account/features/e03R00002/cubit/e03_r00002_cubit.dart';
import 'package:account/features/e03R00002/cubit/e03_r00002_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pdfx/pdfx.dart';
import 'package:universal_html/html.dart';

class E03R00002Pdf extends StatefulWidget {
  const E03R00002Pdf({super.key});

  @override
  State<E03R00002Pdf> createState() => _E03R00002PdfState();
}

class _E03R00002PdfState extends State<E03R00002Pdf> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 8,
      child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: AppColor.c_F8FAFC,
            borderRadius: BorderRadius.circular(8.0),
          ),
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
                  const TextFieldInput(
                      title: "Tên file",
                      textAlignEndTitle: true,
                      isEnabled: true),
                  const SizedBox(width: 15),
                  SizedBox(
                    width: 320,
                    child: CommonDropdown(
                      items: [
                        ItemBaseModel(
                          id: 1,
                          name: 'a',
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
                    child: TextFieldInput(
                      title: "Ngày",
                      textAlignEndTitle: true,
                      isEnabled: false,
                      suffixAssetUrl: IconsApp.calendar,
                      isShowSuffixIcon: true,
                      onChanged: (p0) {},
                    ),
                  ),
                  const SizedBox(width: 20),
                  const Expanded(
                    child: CommonDropdown(
                      items: [],
                      title: 'Người ký ',
                    ),
                  ),
                ],
              ),
              spaceH10,
              spaceH10,
              _buildPdfViewer(),
            ],
          ),
        ),
      ),
    );
  }

  Expanded _buildPdfViewer() {
    return Expanded(child: BlocBuilder<E03R00002Cubit, E03R00002State>(
      builder: (context, state) {
        if (state.pdfFilel == null) {
          return const Center(
            child: Text('Chưa có file pdf nào được chọn'),
          );
        }
        if (state.isLoading == true) {
          return const SizedBox(
              width: 50, height: 50, child: CircularProgressIndicator());
        }
        return PdfView(
            controller:
                PdfController(document: PdfDocument.openData(state.pdfFilel!)));
      },
    ));
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

  Row _buildButtonUpload() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          width: 80,
          child: CommonButton(
            backgroundColor: ColorResources.buttonSave,
            buttonIcon: IconsApp.upload,
            textName: "Tải lên",
          ),
        ),
      ],
    );
  }
}
