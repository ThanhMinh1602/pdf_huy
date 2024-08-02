import 'package:account/core/utils/color_resources.dart';
import 'package:account/core/utils/dimensions.dart';
import 'package:flutter/material.dart';

class TitleRow extends StatelessWidget {
  final String nameTitle;
  final Widget buttonSave;

  const TitleRow({
    super.key,
    required this.nameTitle,
    required this.buttonSave,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      width: MediaQuery.of(context).size.width * 0.9,
      padding: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
        color: ColorResources.blueBackround,
        borderRadius: BorderRadius.all(
          Radius.circular(Dimensions.radiusSmall),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              nameTitle,
              style: const TextStyle(
                fontSize: 20,
                color: ColorResources.titleName,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: buttonSave,
          ),
        ],
      ),
    );
  }
}
