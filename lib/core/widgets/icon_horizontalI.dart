import 'package:flutter/material.dart';

class HorizontalButtons extends StatelessWidget {
  final List<Widget> buttons;

  const HorizontalButtons({
    super.key,
    required this.buttons,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: buttons,
    );
  }
}
