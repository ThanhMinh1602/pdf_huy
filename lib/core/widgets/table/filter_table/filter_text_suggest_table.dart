import 'package:flutter/material.dart';

class FilterTextSuggestTable extends StatefulWidget {
  const FilterTextSuggestTable({
    super.key,
    required this.items,
  });
  final List<String> items;

  @override
  State<FilterTextSuggestTable> createState() => _FilterTextSuggestTableState();
}

class _FilterTextSuggestTableState extends State<FilterTextSuggestTable> {
  late TextEditingController _controller;
  late LayerLink _layerLink;
  OverlayEntry? _overlayEntry;

  String? selectedValue;
  String filterText = '';

  @override
  void initState() {
    super.initState();
    _layerLink = LayerLink();
    _controller = TextEditingController()
      ..addListener(() {
        setState(() {
          filterText = _controller.text;
          _showDropdownMenu();
        });
      });
  }

  void _showDropdownMenu() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
    }
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;

    return OverlayEntry(
      builder: (context) => Positioned(
        width: size.width + 100,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0.0, size.height + 5.0),
          child: Material(
            elevation: 4.0,
            color: Colors.white,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 200),
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
    List<String> filteredItems = widget.items.where((item) {
      return item.toLowerCase().contains(filterText.toLowerCase());
    }).toList();

    return filteredItems.map((String value) {
      return InkWell(
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        onTap: () {
          setState(() {
            selectedValue = value;
            _controller.text = selectedValue!;
            _overlayEntry?.remove();
            _overlayEntry = null;
          });
        },
      );
    }).toList();
  }

  @override
  void dispose() {
    _controller.dispose();
    _overlayEntry?.remove();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: TextField(
        controller: _controller,
        decoration: const InputDecoration(
          border: InputBorder.none,
          suffixIcon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: Colors.black,
          ),
          suffixIconConstraints: BoxConstraints(),
        ),
      ),
    );
  }
}
