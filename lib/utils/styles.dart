import 'package:flutter/material.dart';
import 'colors.dart';
import 'dimens.dart';

enum MyFW { regular, medium, bold }

TextStyle baseTextStyle({double fontSize = textSizeNormal, MyFW fontWeight = MyFW.regular}) {
  FontWeight fw = FontWeight.normal;

  switch (fontWeight) {
    case MyFW.regular:
      fw = FontWeight.normal;
      break;
    case MyFW.medium:
      fw = FontWeight.w500;
      break;
    case MyFW.bold:
      fw = FontWeight.bold;
      break;
  }

  return TextStyle(fontSize: fontSize, fontWeight: fw, fontFamily: 'Roboto');
}

TextStyle textStyleHero_42({MyFW? fontWeight}) {
  return baseTextStyle(fontSize: textSizeHero, fontWeight: MyFW.regular);
}

TextStyle textStyleH1_34({MyFW? fontWeight}) {
  return baseTextStyle(fontSize: textSizeLargest, fontWeight: MyFW.regular);
}

TextStyle textStyleH2_28({MyFW? fontWeight}) {
  return baseTextStyle(fontSize: textSizeLarger, fontWeight: MyFW.regular);
}

TextStyle textStyleH3_24({MyFW? fontWeight}) {
  return baseTextStyle(fontSize: textSizeLarge, fontWeight: MyFW.regular);
}

TextStyle textStyleH4_20({MyFW? fontWeight}) {
  return baseTextStyle(fontSize: textSizeNormal, fontWeight: MyFW.regular);
}

TextStyle textStyleH5_16({MyFW? fontWeight}) {
  return baseTextStyle(fontSize: textSizeMedium, fontWeight: MyFW.regular);
}

TextStyle textStyleH6_14({MyFW? fontWeight}) {
  return baseTextStyle(fontSize: textSizeSmall, fontWeight: MyFW.regular);
}

TextStyle textStyleH7_12({MyFW? fontWeight}) {
  return baseTextStyle(fontSize: textSizeSmallest, fontWeight: MyFW.regular);
}

//region button style
ButtonStyle baseButtonStyle(Color color) {
  return ButtonStyle(
      elevation: MaterialStateProperty.all(0),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(cmCornerRadiusNormal))),
      ),
      foregroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.disabled)) {
          return colorSystemWhite.withOpacity(0.6);
        }
        return null;
      }),
      backgroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.disabled)) return color.withOpacity(0.6);
        return color;
      }));
}

ButtonStyle buttonStylePrimary() {
  return baseButtonStyle(colorSecondary500);
}

ButtonStyle buttonStyleOutline() {
  return ButtonStyle(side: MaterialStateProperty.resolveWith((states) {
    if (states.contains(MaterialState.disabled)) return BorderSide(color: colorPrimary300.withOpacity(0.6));
    return const BorderSide(color: colorPrimary300);
  }));
}

ButtonStyle buttonStyleGray() {
  return baseButtonStyle(colorGray100);
}

ButtonStyle buttonStyleWhite() {
  return baseButtonStyle(colorSystemWhite);
}
