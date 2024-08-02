import 'package:account/core/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommonTextField extends StatefulWidget {
  final String? hintText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final Color? fillColor;
  final double? width;
  final double? height;
  final int maxLines;
  final bool isPassword;
  final bool isCountryPicker;
  final bool isShowBorder;
  final bool isIcon;
  final bool isShowSuffixIcon;
  final bool isShowPrefixIcon;
  final Function? onTap;
  final Function? onSuffixTap;
  final IconData? suffixIconUrl;
  final String? suffixAssetUrl;
  final IconData? prefixIconUrl;
  final String? prefixAssetUrl;
  final bool isSearch;
  final Function? onSubmit;
  final bool isEnabled;
  final TextCapitalization capitalization;
  final bool isElevation;
  final bool isPadding;
  final void Function(String?)? onChanged;
  final String? Function(String?)? onValidate;
  final Color? imageColor;
  final bool isReadOnly;

  //final LanguageProvider languageProvider;

  const CommonTextField({
    super.key,
    this.hintText = '',
    this.controller,
    this.focusNode,
    this.nextFocus,
    this.isEnabled = true,
    this.inputType = TextInputType.text,
    this.inputAction = TextInputAction.next,
    this.maxLines = 1,
    this.onSuffixTap,
    this.fillColor,
    this.width,
    this.height,
    this.onSubmit,
    this.capitalization = TextCapitalization.none,
    this.isCountryPicker = false,
    this.isShowBorder = false,
    this.isShowSuffixIcon = false,
    this.isShowPrefixIcon = false,
    this.onTap,
    this.isIcon = false,
    this.isPassword = false,
    this.suffixIconUrl,
    this.prefixIconUrl,
    this.isSearch = false,
    this.isElevation = true,
    this.onChanged,
    this.isPadding = true,
    this.suffixAssetUrl,
    this.prefixAssetUrl,
    this.onValidate,
    this.imageColor,
    this.isReadOnly = false,
  });

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    double effectiveWidth =
        widget.width ?? MediaQuery.of(context).size.width * 0.9;
    double effectiveHeight = widget.height ?? 38.0;

    return Container(
      width: effectiveWidth,
      height: effectiveHeight,
      child: TextFormField(
        maxLines: widget.maxLines,
        controller: widget.controller,
        focusNode: widget.focusNode,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Theme.of(context).textTheme.bodyLarge?.color,
              fontSize: Dimensions.fontSizeLarge,
            ),
        textInputAction: widget.inputAction,
        keyboardType: widget.inputType,
        cursorColor: Theme.of(context).primaryColor,
        textCapitalization: widget.capitalization,
        enabled: widget.isEnabled,
        autofocus: false,
        obscureText: widget.isPassword ? _obscureText : false,
        inputFormatters: widget.inputType == TextInputType.phone
            ? <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp('[0-9+]'))
              ]
            : null,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
              vertical: 10, horizontal: widget.isPadding ? 22 : 0),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              width: 1,
              color: Color(0xFFCBD2D9),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              width: 1,
              color: Color(0xFFCBD2D9),
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              width: 1,
              color: Color(0xFFCBD2D9),
            ),
          ),
          //isDense: true,
          hintText: widget.hintText,
          fillColor: widget.fillColor ?? Colors.white,
          hintStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            textBaseline: TextBaseline.ideographic,
            color: Color(0xFF979797),
          ),
          filled: true,
          prefixIcon: widget.isShowPrefixIcon
              ? IconButton(
                  padding: const EdgeInsets.all(0),
                  icon: widget.prefixAssetUrl != null
                      ? Image.asset(widget.prefixAssetUrl!,
                          color: Theme.of(context).primaryColor)
                      : Icon(
                          widget.prefixIconUrl,
                          color: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.color
                              ?.withOpacity(0.6),
                        ),
                  onPressed: () {},
                )
              : const SizedBox.shrink(),
          prefixIconConstraints:
              const BoxConstraints(minWidth: 23, maxHeight: 20),
          suffixIcon: widget.isShowSuffixIcon
              ? widget.isPassword
                  ? IconButton(
                      icon: Icon(
                          _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Theme.of(context).hintColor.withOpacity(0.3)),
                      onPressed: _toggle)
                  : widget.isIcon
                      ? IconButton(
                          onPressed: widget.onSuffixTap as void Function()?,
                          icon: widget.suffixAssetUrl != null
                              ? Image.asset(
                                  widget.suffixAssetUrl!,
                                  width: 20,
                                  height: 20,
                                  color: widget.imageColor ??
                                      Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .color,
                                )
                              : Icon(widget.suffixIconUrl,
                                  color: Theme.of(context)
                                      .hintColor
                                      .withOpacity(0.6)),
                        )
                      : null
              : null,
        ),
        onTap: widget.onTap as void Function()?,
        onChanged: widget.onChanged,
        onFieldSubmitted: (text) => widget.nextFocus != null
            ? FocusScope.of(context).requestFocus(widget.nextFocus)
            : widget.onSubmit != null
                ? widget.onSubmit!(text)
                : null,
        validator: widget.onValidate,
      ),
    );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
