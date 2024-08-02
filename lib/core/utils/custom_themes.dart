import 'package:account/core/utils/dimensions.dart';
import 'package:flutter/material.dart';

const titilliumRegular = TextStyle(
  fontFamily: 'Nunito',
  fontSize: Dimensions.fontSizeSmall,
);
const titleRegular = TextStyle(
  fontFamily: 'Nunito',
  fontWeight: FontWeight.w500,
  fontSize: Dimensions.fontSizeDefault,
);
const titleHeader = TextStyle(
  fontFamily: 'Nunito',
  fontWeight: FontWeight.w600,
  fontSize: Dimensions.fontSizeLarge,
);
const titilliumSemiBold = TextStyle(
  fontFamily: 'Nunito',
  fontSize: Dimensions.fontSizeSmall,
  fontWeight: FontWeight.w600,
);

const titilliumBold = TextStyle(
  fontFamily: 'Nunito',
  fontSize: Dimensions.fontSizeDefault,
  fontWeight: FontWeight.w700,
);
const titilliumItalic = TextStyle(
  fontFamily: 'Nunito',
  fontSize: Dimensions.fontSizeDefault,
  fontStyle: FontStyle.italic,
);

const textRegular = TextStyle(
  fontFamily: 'Nunito',
  fontSize: Dimensions.fontSizeDefault,
);

const textMedium = TextStyle(
    fontFamily: 'Nunito',
    fontSize: Dimensions.fontSizeDefault,
    fontWeight: FontWeight.w500);
const textBold = TextStyle(
    fontFamily: 'Nunito',
    fontSize: Dimensions.fontSizeDefault,
    fontWeight: FontWeight.w600);

const robotoBold = TextStyle(
  fontFamily: 'Nunito',
  fontSize: Dimensions.fontSizeDefault,
  fontWeight: FontWeight.w700,
);


// class ThemeShadow {
//   static List <BoxShadow> getShadow(BuildContext context) {
//     List<BoxShadow> boxShadow =  [BoxShadow(color: Provider.of<ThemeProvider>(context, listen: false).darkTheme? Colors.black26:
//     Theme.of(context).primaryColor.withOpacity(.075), blurRadius: 5,spreadRadius: 1,offset: const Offset(1,1))];
//     return boxShadow;
//   }
// }