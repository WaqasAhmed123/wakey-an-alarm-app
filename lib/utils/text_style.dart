import 'package:flutter/material.dart';

Map<String, TextStyle> textStyle({Color textColor = const Color(0xFFFFFFFF)}) {
  return {
    "titleSmall":
        TextStyle(fontFamily: "Roboto", fontSize: 14, color: textColor),
    "titleMedium": TextStyle(
        fontFamily: "Roboto",
        fontSize: 18,
        color: textColor,
        fontWeight: FontWeight.bold),
    "titleLarge":
        TextStyle(fontFamily: "Roboto", fontSize: 36, color: textColor),
  };
}
