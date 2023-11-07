import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wakey/utils/text_style.dart';
import 'package:wakey/view_models/set_alarm_viewmodel.dart';

listtileContainer(
    {leadingText,
    tralingText,
    onTap,
    isToggleButton = false,
    context,
    vibrationWidet = false}) {
  final setAlarmViewModel =
      Provider.of<SetAlarmViewModel>(context, listen: false);

  return Theme(
    data: Theme.of(context).copyWith(
      splashFactory: NoSplash.splashFactory,
    ),
    child: InkWell(
      borderRadius: BorderRadius.circular(10.0),
      // splashColor: Colors.transparent,
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
                    value: vibrationWidet ? value.vibrate : value.deleteAlarm,
                    // changes the state of the switch
                    onChanged: (value) => vibrationWidet
                        ? setAlarmViewModel.setVibration()
                        : setAlarmViewModel.setDeletion());
              })
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(tralingText,
                      style: textStyle(
                          textColor:
                              Colors.white.withOpacity(0.5))["bodySmall"]),
                  Icon(
                    Icons.keyboard_arrow_right_rounded,
                    color: Colors.white.withOpacity(0.5),
                  )
                ],
              ),
      ),
    ),
  );
}
