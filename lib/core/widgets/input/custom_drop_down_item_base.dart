import 'package:account/core/const/colors.dart';
import 'package:account/core/models/item_base_model.dart';
import 'package:account/core/utils/spaces.dart';
import 'package:flutter/material.dart';

class CustomDropdownItemBase extends StatefulWidget {
  final String? title;
  final String? hintText;
  final List<ComparableItemBaseModel> items;
  final ComparableItemBaseModel? value;
  final Function(ComparableItemBaseModel?)? onChanged;
  final double? height;
  final double? widthTitle;
  final bool? isRequired;

  const CustomDropdownItemBase({
    super.key,
    this.title,
    this.hintText,
    required this.items,
    this.value,
    this.onChanged,
    this.height,
    this.widthTitle,
    this.isRequired,
  });

  @override
  _DropdownItemBaseState createState() => _DropdownItemBaseState();
}

class _DropdownItemBaseState extends State<CustomDropdownItemBase> {
  ComparableItemBaseModel? _selectedItem;

  @override
  void initState() {
    super.initState();
    if (widget.value != null) {
      _selectedItem = widget.items.firstWhere(
        (item) => item == widget.value,
        orElse: () => ComparableItemBaseModel(),
      );
    } else {
      _selectedItem = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    double effectiveHeight = widget.height ?? 36.0;

    return Expanded(
      child: Row(
        children: [
          if (widget.title != null) ...[
            SizedBox(
              width: widget.widthTitle,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    widget.title ?? '',
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: AppColors.textBlack,
                      fontFamily: 'Nunito',
                    ),
                  ),
                  if (widget.isRequired != null)
                    Text(
                      ' *',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: AppColors.redBoder,
                        fontFamily: 'Nunito',
                      ),
                    ),
                ],
              ),
            ),
            spaceW12,
          ],
          Expanded(
            child: SizedBox(
              height: effectiveHeight,
              child: DropdownButtonFormField<ComparableItemBaseModel>(
                value: widget.items.contains(_selectedItem) ? _selectedItem : null,
                items: widget.items
                    .map(
                      (item) => DropdownMenuItem(
                        value: item,
                        child: Text(
                          item.name ?? '',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textBlack,
                            fontFamily: 'Nunito',
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
                          color: AppColors.textBlack,
                          fontFamily: 'Nunito',
                        ),
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

class ComparableItemBaseModel extends ItemBaseModel {
  ComparableItemBaseModel({int? id, String? name}) : super(id: id, name: name);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ComparableItemBaseModel &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;

  // Factory method to create a ComparableItemBaseModel from an ItemBaseModel
  factory ComparableItemBaseModel.fromItemBaseModel(ItemBaseModel item) {
    return ComparableItemBaseModel(id: item.id, name: item.name);
  }
}