import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CommonButton extends StatefulWidget {
  final Function()? onTap;
  final String? buttonIcon;
  final Widget? buttonWidget;
  final String? textName;
  final bool isBorder;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final double? fontSize;
  final double? borderWidth;
  final Color? colorIcon;
  final double? height;
  final double? width;
  final double? sizeIcon;
  final double? radius;

  const CommonButton({
    super.key,
    this.onTap,
    this.buttonIcon,
    this.buttonWidget,
    this.isBorder = false,
    this.backgroundColor,
    this.textColor,
    this.fontSize,
    this.colorIcon,
    this.borderColor,
    this.borderWidth,
    this.height,
    this.width,
    this.textName,
    this.sizeIcon,
    this.radius,
  });

  @override
  _CommonButtonState createState() => _CommonButtonState();
}

class _CommonButtonState extends State<CommonButton> {
  @override
  Widget build(BuildContext context) {
    double buttonHeight = widget.height ?? 32;
    double buttonWidth = widget.width ?? MediaQuery.sizeOf(context).width;

    return InkWell(
      onTap: widget.onTap,
      child: Container(
        height: buttonHeight,
        width: buttonWidth,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: widget.isBorder
              ? Border.all(
                  color: widget.borderColor ?? Theme.of(context).primaryColor,
                  width: widget.borderWidth ?? 2,
                )
              : null,
          color: widget.backgroundColor,
          borderRadius: BorderRadius.circular(widget.radius ?? 6),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.buttonWidget ??
                Image.asset(
                  widget.buttonIcon ?? "",
                  height: widget.sizeIcon ?? 16,
                  width: widget.sizeIcon ?? 16,
                  color: widget.colorIcon,
                ),
            widget.buttonWidget ??
                SvgPicture.asset(
                  widget.buttonIcon ?? "",
                  height: widget.sizeIcon ?? 16,
                  width: widget.sizeIcon ?? 16,
                  color: widget.colorIcon,
                ),
            if (widget.textName != null) const SizedBox(width: 4),
            Text(
              widget.textName ?? "",
              style: TextStyle(
                color: widget.textColor ?? Colors.white,
                fontSize: widget.fontSize ?? 14,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
