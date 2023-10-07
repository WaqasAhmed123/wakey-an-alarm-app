import 'package:flutter/material.dart';
import 'package:wakey/utils/text_style.dart';

Widget alarmDesctiption({alarmReason, alarmTime, isDay,context}) {
  return Container(
    height: 177,
    width: 169,
    decoration: BoxDecoration(
        border: Border.all(color: Colors.transparent),
        borderRadius: BorderRadius.circular(20)),
    child: Column(
      children: [
        Text(
          alarmReason,
          style: textStyle()["titleSmall"],
        ),
        RichText(
            text: TextSpan(
          style: DefaultTextStyle.of(context).style,
          children: <TextSpan>[
            TextSpan(
              text: alarmTime,
              style: textStyle()["titleSmall"],
            ),
            TextSpan(
              text: isDay ? "AM" : "PM",
              style: textStyle()["titleMedium"],
            ),
          ],
        )),
        // Text(
        //   "$alarmTime${isDay ? "AM" : "PM"}",
        //   style: textStyle()["titleLarge"],
        // )
      ],
    ),
  );
}
