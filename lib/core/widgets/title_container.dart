import 'package:flutter/material.dart';

class TitleContainer extends StatelessWidget {
  const TitleContainer({
    super.key,
    required this.title,
    required this.child,
    this.isPaddingChild = true,
    this.button = const SizedBox.shrink(),
  });

  final String title;
  final Widget child;
  final bool isPaddingChild;
  final Widget button;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: Colors.grey.withOpacity(0.2))),
      child: Column(
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width,
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: Color(0xFFD8F1FD),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(4),
                topLeft: Radius.circular(4),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                button,
              ],
            ),
          ),
          Padding(
            padding:
                isPaddingChild ? const EdgeInsets.all(12.0) : EdgeInsets.zero,
            child: child,
          )
        ],
      ),
    );
  }
}
