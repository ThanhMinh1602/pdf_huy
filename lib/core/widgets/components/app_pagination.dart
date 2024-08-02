import 'package:account/core/constants/app_color.dart';
import 'package:account/core/widgets/components/pagination_package.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppPagination extends StatelessWidget {
  final int selectedPage;
  final Function onPageChanged;
  final void Function(int?)? onChangedPagecount;
  final int pageCountValue;
  final List<int> listPageCount;
  const AppPagination(
      {super.key,
      required this.selectedPage,
      required this.onPageChanged,
      this.onChangedPagecount,
      required this.pageCountValue,
      required this.listPageCount});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          'Hiển thị',
          style: GoogleFonts.nunito(
            fontSize: 13.0,
            color: AppColor.c_323F4B,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(width: 18.0),
        Container(
          width: 60.8,
          height: 24.0,
          padding: const EdgeInsets.symmetric(horizontal: 6.0),
          decoration: BoxDecoration(
              border: Border.all(color: AppColor.c_979797),
              borderRadius: BorderRadius.circular(4.8)),
          child: DropdownButton<int>(
            value: pageCountValue,
            style: GoogleFonts.nunito(
              fontSize: 11.0,
              color: AppColor.c_323F4B,
              fontWeight: FontWeight.w600,
            ),
            isExpanded: true,
            underline: Container(),
            items: listPageCount
                .map((e) =>
                    DropdownMenuItem(value: e, child: Text(e.toString())))
                .toList(),
            onChanged: onChangedPagecount,
          ),
        ),
        Pagination(
          numOfPages: 10,
          selectedPage: selectedPage,
          pagesVisible: 3,
          onPageChanged: onPageChanged,
          nextIcon: const Icon(
            Icons.arrow_forward_ios,
            color: AppColor.c_006EA9,
            size: 14,
          ),
          previousIcon: const Icon(
            Icons.arrow_back_ios,
            color: AppColor.c_006EA9,
            size: 14,
          ),
          activeTextStyle: GoogleFonts.nunito(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: AppColor.c_006EA9,
          ),
          activeBtnStyle: ButtonStyle(
            minimumSize: WidgetStateProperty.all<Size>(
              const Size(28.8, 28.8),
            ),
            fixedSize: WidgetStateProperty.all<Size>(
              const Size(28.8, 28.8),
            ),
            backgroundColor: WidgetStateProperty.all(Colors.transparent),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.76),
                side: const BorderSide(color: AppColor.c_006EA9, width: 1.44),
              ),
            ),
          ),
          inactiveBtnStyle: ButtonStyle(
            minimumSize: WidgetStateProperty.all<Size>(
              const Size(28.8, 28.8),
            ),
            fixedSize: WidgetStateProperty.all<Size>(
              const Size(28.8, 28.8),
            ),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.76),
                side: const BorderSide(color: AppColor.c_979797, width: 1.44),
              ),
            ),
          ),
          inactiveTextStyle: GoogleFonts.nunito(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: AppColor.c_000000,
          ),
        ),
      ],
    );
  }
}
