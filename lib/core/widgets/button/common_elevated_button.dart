import 'package:account/core/utils/dimensions.dart';
import 'package:flutter/material.dart';

class CommonElevatedButton extends StatefulWidget {
  final Function()? onTap;
  final String? buttonIcon;
  final bool isBuy;
  final bool isBorder;
  final Color? backgroundColor;
  final Color? hoverColor;
  final Color? textColor;
  final Color? borderColor;
  final double? radius;
  final double? fontSize;
  final String? leftIcon;
  final double? borderWidth;
  final Color? colorIcon;
  final double? height;
  final double? width;

  const CommonElevatedButton({
    super.key,
    this.onTap,
    required this.buttonIcon,
    this.isBuy = false,
    this.isBorder = false,
    this.backgroundColor,
    this.hoverColor,
    this.radius,
    this.textColor,
    this.fontSize,
    this.leftIcon,
    this.colorIcon,
    this.borderColor,
    this.borderWidth,
    this.height,
    this.width,
  });

  @override
  _CommonElevatedButtonState createState() => _CommonElevatedButtonState();
}

class _CommonElevatedButtonState extends State<CommonElevatedButton> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double buttonHeight = widget.height ?? 40;
        double buttonWidth = widget.width ?? constraints.maxWidth * 99;

        return MouseRegion(
          onEnter: (_) {
            setState(() {
              _isHovering = true;
            });
          },
          onExit: (_) {
            setState(() {
              _isHovering = false;
            });
          },
          child: InkWell(
            onTap: widget.onTap,
            borderRadius: BorderRadius.circular(widget.radius != null
                ? widget.radius!
                : widget.isBorder
                    ? Dimensions.paddingSizeExtraSmall
                    : Dimensions.paddingSizeSmall),
            child: Container(
              height: buttonHeight,
              width: buttonWidth,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: widget.isBorder
                    ? Border.all(
                        color: widget.borderColor ??
                            Theme.of(context).primaryColor,
                        width: widget.borderWidth ?? 2,
                      )
                    : null,
                color: _isHovering
                    ? widget.hoverColor ??
                        const Color.fromARGB(255, 20, 173, 81)
                    : widget.backgroundColor,
                borderRadius: BorderRadius.circular(widget.radius != null
                    ? widget.radius!
                    : widget.isBorder
                        ? Dimensions.paddingSizeExtraSmall
                        : Dimensions.paddingSizeSmall),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (widget.leftIcon != null)
                    Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: SizedBox(
                        width: 30,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Image.asset(widget.leftIcon!),
                        ),
                      ),
                    ),
                  Flexible(
                    child: Center(
                      child: Image.asset(
                        widget.buttonIcon ?? "",
                        height: 22,
                        width: 22,
                        color: widget.colorIcon,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
