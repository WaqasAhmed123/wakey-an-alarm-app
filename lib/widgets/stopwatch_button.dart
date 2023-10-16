import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wakey/utils/text_style.dart';

stopwatchButton({context, buttonTitle, buttonColor, textColor, onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 52,
      width: MediaQuery.sizeOf(context).width * 0.3,
      decoration: BoxDecoration(
          color: buttonColor,
          border: Border.all(),
          borderRadius: BorderRadius.circular(26)),
      child: Center(
        child: Text(
          buttonTitle,
          style: textStyle(textColor: textColor)["titleMedium"],
        ),
      ),
    ),
  );
}
