import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double? width;
  final double? height;
  final Color backgroundColor;
  final Color? borderColor;
  final Widget icon;
  final String text;
  final Color textColor;
  final EdgeInsets? margin;
  Function() onPress;

  CustomButton({
    super.key,
    this.width,
    this.height,
    required this.backgroundColor,
    this.borderColor,
    required this.icon,
    required this.text,
    required this.textColor,
    required this.onPress,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPress();
      },
      child: Container(
        width: width,
        height: height,
        padding: EdgeInsets.symmetric(horizontal: 5),
        margin: margin ?? EdgeInsets.zero,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(5),
          border: borderColor != null
              ? Border.all(
                  color: borderColor!,
                )
              : Border.all(
                  color: backgroundColor,
                ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding:
                  EdgeInsets.only(top: 5, right: text == '' ? 0 : 5, bottom: 5),
              child: icon,
            ),
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontFamily: 'Nunito',
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
