import 'package:account/core/const/colors.dart';
import 'package:flutter/material.dart';

class CustomDropdownField extends StatefulWidget {
  final List<String> items;
  final String hintText;
  final double width;

  CustomDropdownField(
      {required this.items, required this.hintText, required this.width});

  @override
  _CustomDropdownFieldState createState() => _CustomDropdownFieldState();
}

class _CustomDropdownFieldState extends State<CustomDropdownField> {
  String? selectedValue;
  String filterText = '';
  TextEditingController filterController = TextEditingController();
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;

  void _showDropdownMenu() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
    }
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context)!.insert(_overlayEntry!);
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;
    var offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0.0, size.height + 5.0),
          child: Material(
            elevation: 4.0,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 200),
              child: ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                children: _buildFilteredItems(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildFilteredItems() {
    // Filter items based on filterText
    List<String> filteredItems = widget.items.where((item) {
      return item.toLowerCase().contains(filterText.toLowerCase());
    }).toList();

    // Build ListTile widgets for filtered items
    return filteredItems.map((String value) {
      return GestureDetector(
        child: Container(
          padding: EdgeInsets.all(8),
          child: Text(
            value,
            style: TextStyle(fontFamily: 'Nunito', fontSize: 15),
          ),
        ),
        onTap: () {
          setState(() {
            selectedValue = value;
            filterController.text = selectedValue!;
            _overlayEntry?.remove();
            _overlayEntry = null;
          });
        },
      );
    }).toList();
  }

  @override
  void initState() {
    super.initState();
    filterController.addListener(() {
      setState(() {
        filterText = filterController.text;
        _showDropdownMenu();
      });
    });
  }

  @override
  void dispose() {
    filterController.dispose();
    _overlayEntry?.remove();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: GestureDetector(
        child: Container(
          height: 35,
          width: widget.width,
          child: TextFormField(
            cursorColor: AppColors.textBlack,
            controller: filterController,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(top: 2, left: 20),
              hintText: widget.hintText,
              hintStyle: TextStyle(fontFamily: 'Nunito', fontSize: 13),
              suffixIcon: Icon(Icons.keyboard_arrow_down),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.border),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.border),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.border),
              ),
            ),
            style: TextStyle(fontFamily: 'Nunito', fontSize: 13),
          ),
        ),
      ),
    );
  }
}
