import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class social_icon extends StatelessWidget {
  final String svgLink;

  const social_icon({
    Key? key,
    required this.svgLink,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration:
      BoxDecoration(color: Colors.grey[200], shape: BoxShape.circle),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () {},
          child: SvgPicture.asset(svgLink),
        ),
      ),
    );
  }
}