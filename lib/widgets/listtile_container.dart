import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wakey/utils/text_style.dart';
import 'package:wakey/view_models/set_alarm_viewmodel.dart';

import '../view_models/home_viewmodel.dart';

listtileContainer({leadingText, tralingText, onTap, isToggleButton=false, context}) {
  final setAlarmViewModel =
      Provider.of<SetAlarmViewModel>(context, listen: false);

  return InkWell(
    onTap: onTap,
    child: ListTile(
      leading: Text(
        leadingText,
        style: textStyle()["titleSmall"],
      ),
      trailing: isToggleButton
          ? Consumer<SetAlarmViewModel>(builder: (context, value, child) {
              return Switch(
                  activeColor: const Color(0xFFFFFFFF),
                  activeTrackColor: const Color(0xFFF0F757),
                  inactiveThumbColor: Colors.blueGrey.shade600,
                  inactiveTrackColor: Colors.grey.shade400,
                  splashRadius: 50.0,
                  value: value.toggleAlarm,
                  // changes the state of the switch
                  onChanged: (value) => setAlarmViewModel.onToggle());
            })
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(tralingText),
                const Icon(Icons.keyboard_arrow_right_rounded)
              ],
            ),
    ),
  );
}
