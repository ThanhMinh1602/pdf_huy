import 'package:account/core/const/colors.dart';
import 'package:flutter/material.dart';

class CustomDropdownButtonFormField extends StatefulWidget {
  final List<String> items;

  CustomDropdownButtonFormField({required this.items});

  @override
  _CustomDropdownButtonFormFieldState createState() =>
      _CustomDropdownButtonFormFieldState();
}

class _CustomDropdownButtonFormFieldState
    extends State<CustomDropdownButtonFormField> {
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
          height: 45,
          width: MediaQuery.of(context).size.width,
          child: InputDecorator(
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.keyboard_arrow_down),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.foundation),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.foundation),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.foundation),
              ),
            ),
            child: TextFormField(
              controller: filterController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
              style: TextStyle(fontFamily: 'Nunito', fontSize: 15),
            ),
          ),
        ),
      ),
    );
  }
}