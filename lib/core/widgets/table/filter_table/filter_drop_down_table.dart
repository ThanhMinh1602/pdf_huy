import 'package:account/core/models/item_base_model.dart';
import 'package:flutter/material.dart';

class FilterDropdownTable extends StatefulWidget {
  final List<ItemBaseModel> items;
  final ItemBaseModel? value;
  final TextStyle? styleTextDisplay;
  final Widget? hint;
  final Function(ItemBaseModel?) onChanged;

  const FilterDropdownTable({
    super.key,
    required this.items,
    this.value,
    this.styleTextDisplay,
    this.hint,
    required this.onChanged,
  });

  @override
  _FilterDropdownTableState createState() => _FilterDropdownTableState();
}

class _FilterDropdownTableState extends State<FilterDropdownTable> {
  ItemBaseModel? _selectedItem;

  @override
  void initState() {
    super.initState();
    _selectedItem = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: DropdownButton<ItemBaseModel>(
        isExpanded: true,
        dropdownColor: Colors.white,
        focusColor: Colors.white,
        icon: const Icon(
          Icons.keyboard_arrow_down_rounded,
          color: Colors.black,
        ),
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
        value: _selectedItem,
        hint: widget.hint,
        items: widget.items
            .map(
              (item) => DropdownMenuItem<ItemBaseModel>(
                value: item,
                child: Text(
                  item.name ?? '',
                  style: widget.styleTextDisplay,
                ),
              ),
            )
            .toList(),
        onChanged: (value) {
          setState(() {
            _selectedItem = value;
          });
          widget.onChanged(value);
        },
      ),
    );
  }
}
