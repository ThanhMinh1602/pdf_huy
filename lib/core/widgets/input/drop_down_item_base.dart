import 'package:account/core/models/item_base_model.dart';
import 'package:account/core/utils/spaces.dart';
import 'package:account/core/widgets/input/required_label.dart';
import 'package:flutter/material.dart';

class DropdownItemBase extends StatefulWidget {
  final String? title;
  final String? hintText;
  final List<ItemBaseModel> items;
  final ItemBaseModel? value;
  final Function(ItemBaseModel?)? onChanged;
  final double? height;
  final double? width;
  final bool isRequired;
  final double? widthTitle;
  final bool textAlignEndTitle;
  final bool isCrossAxisAlignmentTopTitle;

  const DropdownItemBase({
    super.key,
    this.title,
    this.hintText,
    required this.items,
    this.value,
    this.onChanged,
    this.height,
    this.width,
    this.isRequired = false,
    this.widthTitle,
    this.textAlignEndTitle = false,
    this.isCrossAxisAlignmentTopTitle = false,
  });

  @override
  _DropdownItemBaseState createState() => _DropdownItemBaseState();
}

class _DropdownItemBaseState extends State<DropdownItemBase> {
  ItemBaseModel? _selectedItem;

  @override
  void initState() {
    super.initState();
    _selectedItem = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    double effectiveHeight = widget.height ?? 36.0;

    return Expanded(
      child: Row(
        crossAxisAlignment: widget.isCrossAxisAlignmentTopTitle
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.center,
        children: [
          if (widget.title != null) ...[
            if (widget.isRequired) ...[
              SizedBox(
                width: widget.widthTitle,
                child: Row(
                  mainAxisAlignment: widget.textAlignEndTitle
                      ? MainAxisAlignment.end
                      : MainAxisAlignment.start,
                  children: [
                    RequiredLabel(
                      widget.title ?? '',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ] else ...[
              SizedBox(
                width: widget.widthTitle,
                child: Text(
                  widget.title ?? '',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                  textAlign: widget.textAlignEndTitle ? TextAlign.end : null,
                ),
              ),
            ],
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
      ),
    );
  }
}
