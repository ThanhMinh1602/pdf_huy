import 'dart:async';

import 'package:flutter/material.dart';

class FilterTextTable extends StatefulWidget {
  const FilterTextTable({
    super.key,
    this.initText,
    required this.onChangeText,
  });

  final String? initText;
  final void Function(String text) onChangeText;

  @override
  State<FilterTextTable> createState() => _FilterTextTableState();
}

class _FilterTextTableState extends State<FilterTextTable> {
  late Timer _debounce;
  late TextEditingController _controller;

  void _onChangeText(String text) {
    if (_debounce.isActive) {
      _debounce.cancel();
    }
    _debounce = Timer(const Duration(milliseconds: 500), () {
      widget.onChangeText(text);
    });
  }

  @override
  void initState() {
    super.initState();
    _debounce = Timer(Duration.zero, () {});
    _controller = TextEditingController()..text = widget.initText ?? '';
  }

  @override
  void dispose() {
    _debounce.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: const InputDecoration(
        border: InputBorder.none,
        suffixIcon: Icon(Icons.search),
        suffixIconConstraints: BoxConstraints(),
      ),
      onChanged: _onChangeText,
    );
  }
}
