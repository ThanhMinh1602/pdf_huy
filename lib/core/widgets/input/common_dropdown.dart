// import 'package:flutter/material.dart';

// class CommonDropdownField extends StatefulWidget {
//   final String? hintText;
//   final List<String> items;
//   final String? value;
//   final Function(String?)? onChanged;
//   final double? width;
//   final double? height;
//   final IconData? dropdownIcon;
//   final TextEditingController? controller;
//   final FocusNode? focusNode;
//   final FocusNode? nextFocus;
//   final TextInputType inputType;
//   final TextInputAction inputAction;
//   final Color? fillColor;
//   final int maxLines;
//   final bool isPassword;
//   final bool isCountryPicker;
//   final bool isShowBorder;
//   final bool isIcon;
//   final bool isShowSuffixIcon;
//   final bool isShowPrefixIcon;
//   final Function? onTap;
//   final Function? onSuffixTap;
//   final IconData? suffixIconUrl;
//   final String? suffixAssetUrl;
//   final IconData? prefixIconUrl;
//   final String? prefixAssetUrl;
//   final bool isSearch;
//   final Function? onSubmit;
//   final bool isEnabled;
//   final TextCapitalization capitalization;
//   final bool isElevation;
//   final bool isPadding;
//   final String? Function(String?)? onValidate;
//   final Color? imageColor;

//   const CommonDropdownField({
//     Key? key,
//     this.hintText,
//     required this.items,
//     this.value,
//     this.onChanged,
//     this.width,
//     this.height,
//     this.dropdownIcon,
//     this.controller,
//     this.focusNode,
//     this.nextFocus,
//     this.isEnabled = true,
//     this.inputType = TextInputType.text,
//     this.inputAction = TextInputAction.next,
//     this.maxLines = 1,
//     this.onSuffixTap,
//     this.fillColor,
//     this.onSubmit,
//     this.capitalization = TextCapitalization.none,
//     this.isCountryPicker = false,
//     this.isShowBorder = false,
//     this.isShowSuffixIcon = false,
//     this.isShowPrefixIcon = false,
//     this.onTap,
//     this.isIcon = false,
//     this.isPassword = false,
//     this.suffixIconUrl,
//     this.prefixIconUrl,
//     this.isSearch = false,
//     this.isElevation = true,
//     this.isPadding = true,
//     this.suffixAssetUrl,
//     this.prefixAssetUrl,
//     this.onValidate,
//     this.imageColor,
//   }) : super(key: key);

//   @override
//   _CommonDropdownFieldState createState() => _CommonDropdownFieldState();
// }

// class _CommonDropdownFieldState extends State<CommonDropdownField> {
//   String? _selectedItem;
//   bool _obscureText = true;

//   @override
//   void initState() {
//     super.initState();
//     _selectedItem = widget.value;
//   }

//   @override
//   Widget build(BuildContext context) {
//     double effectiveWidth =
//         widget.width ?? MediaQuery.of(context).size.width * 0.9;
//     double effectiveHeight = widget.height ?? 36.0;

//     return Container(
//       width: effectiveWidth,
//       height: effectiveHeight,
//       child: DropdownButtonFormField<String>(
//         dropdownColor: Colors.white,
//         value: _selectedItem,
//         items: widget.items
//             .map((item) => DropdownMenuItem<String>(
//                   value: item,
//                   child: Text(item),
//                 ))
//             .toList(),
//         onChanged: (value) {
//           setState(() {
//             _selectedItem = value;
//           });
//           if (widget.onChanged != null) {
//             widget.onChanged!(value);
//           }
//         },
//         hint: widget.hintText != null
//             ? Text(
//                 widget.hintText!,
//                 style: const TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w600,
//                 ),
//               )
//             : null,
//         decoration: InputDecoration(
//           contentPadding: EdgeInsets.symmetric(
//               vertical: 10, horizontal: widget.isPadding ? 22 : 0),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8),
//             borderSide: const BorderSide(
//               width: 1,
//               color: Color(0xFFCBD2D9),
//             ),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8),
//             borderSide: const BorderSide(
//               width: 1,
//               color: Color(0xFFCBD2D9),
//             ),
//           ),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8),
//             borderSide: const BorderSide(
//               width: 1,
//               color: Color(0xFFCBD2D9),
//             ),
//           ),
//           fillColor: widget.fillColor ?? Colors.white,
//           filled: true,
//           prefixIcon: widget.isShowPrefixIcon
//               ? IconButton(
//                   padding: const EdgeInsets.all(0),
//                   icon: widget.prefixAssetUrl != null
//                       ? Image.asset(
//                           widget.prefixAssetUrl!,
//                           color: Theme.of(context).primaryColor,
//                         )
//                       : Icon(
//                           widget.prefixIconUrl,
//                           color: Theme.of(context)
//                               .textTheme
//                               .bodyLarge
//                               ?.color
//                               ?.withOpacity(0.6),
//                         ),
//                   onPressed: () {},
//                 )
//               : const SizedBox.shrink(),
//           prefixIconConstraints:
//               const BoxConstraints(minWidth: 23, maxHeight: 20),
//           suffixIcon: widget.isShowSuffixIcon
//               ? widget.isPassword
//                   ? IconButton(
//                       icon: Icon(
//                         _obscureText ? Icons.visibility_off : Icons.visibility,
//                         color: Theme.of(context).hintColor.withOpacity(0.3),
//                       ),
//                       onPressed: _toggle)
//                   : widget.isIcon
//                       ? IconButton(
//                           onPressed: widget.onSuffixTap as void Function()?,
//                           icon: Image.asset(
//                             widget.suffixAssetUrl!,
//                             width: 20,
//                             height: 20,
//                             color: widget.imageColor ??
//                                 Theme.of(context).textTheme.bodyLarge!.color,
//                           ),
//                         )
//                       : null
//               : null,
//         ),
//       ),
//     );
//   }

//   void _toggle() {
//     setState(() {
//       _obscureText = !_obscureText;
//     });
//   }
// }

import 'package:account/core/models/item_base_model.dart';
import 'package:account/core/utils/spaces.dart';
import 'package:flutter/material.dart';

class CommonDropdown extends StatefulWidget {
  final String? title;
  final String? hintText;
  final List<ItemBaseModel> items;
  final ItemBaseModel? value;
  final Function(ItemBaseModel?)? onChanged;
  final double? height;
  final double? width;

  const CommonDropdown(
      {super.key,
      this.title,
      this.hintText,
      required this.items,
      this.value,
      this.onChanged,
      this.height,
      this.width});

  @override
  _CommonDropdownState createState() => _CommonDropdownState();
}

class _CommonDropdownState extends State<CommonDropdown> {
  ItemBaseModel? _selectedItem;

  @override
  void initState() {
    super.initState();
    _selectedItem = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    double effectiveHeight = widget.height ?? 36.0;

    return Row(
      children: [
        if (widget.title != null) ...[
          Text(
            widget.title ?? '',
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
          spaceW12,
        ],
        Expanded(
          child: SizedBox(
            height: effectiveHeight,
            width: widget.width,
            child: DropdownButtonFormField<ItemBaseModel>(
              isExpanded: true,
              dropdownColor: Colors.white,
              value: _selectedItem,
              items: widget.items
                  .map(
                    (item) => DropdownMenuItem<ItemBaseModel>(
                      value: item,
                      child: Text(
                        item.name ?? '',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedItem = value;
                });
                if (widget.onChanged != null) {
                  widget.onChanged!(value);
                }
              },
              hint: widget.hintText != null
                  ? Text(
                      widget.hintText!,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF979797)),
                    )
                  : null,
              icon: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: widget.value != null
                    ? Colors.black
                    : const Color(0xFF979797),
              ),
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 22),
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
                fillColor: Colors.white,
                filled: true,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
