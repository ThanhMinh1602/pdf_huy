import 'package:account/core/constants/app_color.dart';
import 'package:flutter/material.dart';

class CustomSidebar extends StatelessWidget {
  final bool isOpen;

  const CustomSidebar({
    super.key,
    required this.isOpen,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: isOpen ? 250.0 : 0.0,
      height: 1580,
      child: Material(
        elevation: 8,
        child: Container(
            color: Colors.blue,
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: 100,
                    color: AppColor.c_000000,
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 100,
                  );
                },
                itemCount: 20)),
      ),
    );
  }
}
