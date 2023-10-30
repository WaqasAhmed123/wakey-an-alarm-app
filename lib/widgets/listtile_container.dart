import 'package:flutter/material.dart';
import 'package:wakey/utils/text_style.dart';

listtileContainer({leadingText, tralingText, onTap}) {
  return InkWell(
    onTap: onTap,
    child: ListTile(
      leading: Text(leadingText,style: textStyle()["titleSmall"],),
      trailing: Row(
        children: [
          Text(tralingText),
          const Icon(Icons.keyboard_arrow_right_rounded)
        ],
      ),
    ),
  );
}
