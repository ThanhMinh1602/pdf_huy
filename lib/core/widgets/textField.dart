import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final ValueChanged<String>? onChanged;
  final String? placeHolder;

  const CustomTextField({
    Key? key,
    required this.labelText,
    this.placeHolder,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 120,
          child: Text(
            labelText,
            textAlign: TextAlign.right,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(width: 5),
        Expanded(
          child: TextField(
            style: TextStyle(fontSize: 20),
            decoration: InputDecoration(
              hintText: placeHolder,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              contentPadding:
              EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
            ),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}