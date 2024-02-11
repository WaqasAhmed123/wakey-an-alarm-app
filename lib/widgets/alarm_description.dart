// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:wakey/utils/text_style.dart';
// import 'package:wakey/view_models/home_viewmodel.dart';

// Widget alarmDescription(
//     {alarmReason, alarmTime, isDay, required List<bool> alarmDays, context}) {
//   // final homeViewModel = Provider.of<HomeViewModel>(context, listen: false);
//   return Consumer<HomeViewModel>(builder: (context, value, child) {
//     return InkWell(
//       splashColor: Colors.transparent,
//       //  border: Border.all(color: Colors.transparent),
//       borderRadius: BorderRadius.circular(20),

//       onLongPress: () => value.toggleAlarmSelected(),
//       // onLongPress: () => homeViewModel.toggleAlarmSelected(),
//       child: Container(
//         // height: 177,
//         // width: 169,
//         decoration: BoxDecoration(
//             color: const Color(0xFF34344A),
//             border: Border.all(color: Colors.transparent),
//             borderRadius: BorderRadius.circular(20)),
//         child: Padding(
//           padding: const EdgeInsets.only(left: 20, top: 10),
//           child:
//               Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//             Row(
//               children: [
//                 Text(
//                   alarmReason,
//                   style: textStyle()["titleSmall"],
//                 ),
//                 const Spacer(),
//                 // homeViewModel.isAlarmSelected
//                 //     ? CheckboxListTile(
//                 //         value: homeViewModel.isAlarmSelected,
//                 //         onChanged: (newValue) =>
//                 //             homeViewModel.toggleAlarmSelected(),
//                 //       )
//                 //     :
//                 value.isAlarmSelected
//                     ?
//                 Checkbox(
//                   value: value.isAlarmSelected,
//                   onChanged: (newValue) => value.toggleAlarmSelected(),
//                 )
//                 : Switch(
//                     // activeColor: const Color(0xFFFFFFFF),
//                     activeColor: Colors.blueGrey.shade600,
//                     activeTrackColor: const Color(0xFFF0F757),
//                     inactiveThumbColor: Colors.blueGrey.shade600,
//                     inactiveTrackColor: Colors.grey.shade400,
//                     splashRadius: 50.0,
//                     // value: homeViewModel.toggleAlarm,
//                     value: value.toggleAlarm,
//                     // changes the state of the switch
//                     onChanged: (valueObtained) => value.onToggle()),
//                 // onChanged: (value) => homeViewModel.onToggle()),
//               ],
//             ),
//             Row(
//               children: [
//                 RichText(
//                   text: TextSpan(
//                     style: DefaultTextStyle.of(context).style,
//                     children: <TextSpan>[
//                       TextSpan(
//                         text: alarmTime,
//                         style: textStyle()["titleLarge"]!
//                             .copyWith(decoration: TextDecoration.none),
//                       ),
//                       TextSpan(
//                         text: isDay ? "AM" : "PM",
//                         style: textStyle()["titleMedium"]!
//                             .copyWith(decoration: TextDecoration.none),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const Spacer(),
//                 Row(
//                     children: List.generate(7, (index) {
//                   return Padding(
//                       padding: const EdgeInsets.only(right: 8.0),
//                       child: Column(
//                         children: [
//                           Text(
//                             alarmDays[index] ? '●' : '',
//                             style: TextStyle(
//                               color: alarmDays[index]
//                                   ? Colors.yellow
//                                   : Colors.transparent,
//                               fontSize: 16,
//                             ),
//                           ),
//                           Text(
//                             getDayName(index),
//                             style: TextStyle(
//                               color: alarmDays[index]
//                                   ? Colors.yellow
//                                   : Colors.white,
//                               fontSize: 16,
//                             ),
//                           ),
//                         ],
//                       ));
//                 })),
//               ],
//             ),
//             // Switch(
//             //     // activeColor: const Color(0xFFFFFFFF),
//             //     activeColor: Colors.blueGrey.shade600,
//             //     activeTrackColor: const Color(0xFFF0F757),
//             //     inactiveThumbColor: Colors.blueGrey.shade600,
//             //     inactiveTrackColor: Colors.grey.shade400,
//             //     splashRadius: 50.0,
//             //     value: homeViewModel.toggleAlarm,
//             //     // changes the state of the switch
//             //     onChanged: (value) => homeViewModel.onToggle()),
//           ]),
//         ),
//       ),
//     );
//   });
// }

// String getDayName(int index) {
//   List<String> days = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];
//   return days[index];
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wakey/utils/text_style.dart';
import 'package:wakey/view_models/home_viewmodel.dart';

Widget alarmDescription(
    {alarmReason, alarmTime, isDay, required List<bool> alarmDays, context}) {
  // final homeViewModel = Provider.of<HomeViewModel>(context, listen: false);
  return Consumer<HomeViewModel>(builder: (context, value, child) {
    return Dismissible(
      key: Key(alarmReason), // Provide a unique key for each alarm
      direction: DismissDirection.horizontal, // Specify the dismissal direction
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart) {
          // Handle dismissal action here
          // value.toggleAlarmSelected();
        }
      },
      background: Container(
        color: Colors.yellow, // Color to show when swiping to dismiss
        alignment: Alignment.centerRight,
        child:
            const Icon(Icons.delete), // You can customize this widget as needed
      ),
      child: Container(
        // height: 177,
        // width: 169,
        decoration: BoxDecoration(
            color: const Color(0xFF34344A),
            border: Border.all(color: Colors.transparent),
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                Text(
                  alarmReason,
                  style: textStyle()["titleSmall"],
                ),
                const Spacer(),
                // homeViewModel.isAlarmSelected
                //     ? CheckboxListTile(
                //         value: homeViewModel.isAlarmSelected,
                //         onChanged: (newValue) =>
                //             homeViewModel.toggleAlarmSelected(),
                //       )
                //     :
                // value.isAlarmSelected
                //     ? Checkbox(
                //         value: value.isAlarmSelected,
                //         onChanged: (newValue) => value.toggleAlarmSelected(),
                //       )
                //     :
                Switch(
                    // activeColor: const Color(0xFFFFFFFF),
                    activeColor: Colors.blueGrey.shade600,
                    activeTrackColor: const Color(0xFFF0F757),
                    inactiveThumbColor: Colors.blueGrey.shade600,
                    inactiveTrackColor: Colors.grey.shade400,
                    splashRadius: 50.0,
                    // value: homeViewModel.toggleAlarm,
                    value: value.toggleAlarm,
                    // changes the state of the switch
                    onChanged: (valueObtained) => value.onToggle()),
                // onChanged: (value) => homeViewModel.onToggle()),
              ],
            ),
            Row(
              children: [
                RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      TextSpan(
                        text: alarmTime,
                        style: textStyle()["titleLarge"]!
                            .copyWith(decoration: TextDecoration.none),
                      ),
                      TextSpan(
                        text: isDay ? "AM" : "PM",
                        style: textStyle()["titleMedium"]!
                            .copyWith(decoration: TextDecoration.none),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Row(
                    children: List.generate(7, (index) {
                  return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Column(
                        children: [
                          Text(
                            alarmDays[index] ? '●' : '',
                            style: TextStyle(
                              color: alarmDays[index]
                                  ? Colors.yellow
                                  : Colors.transparent,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            getDayName(index),
                            style: TextStyle(
                              color: alarmDays[index]
                                  ? Colors.yellow
                                  : Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ));
                })),
              ],
            ),
            // Switch(
            //     // activeColor: const Color(0xFFFFFFFF),
            //     activeColor: Colors.blueGrey.shade600,
            //     activeTrackColor: const Color(0xFFF0F757),
            //     inactiveThumbColor: Colors.blueGrey.shade600,
            //     inactiveTrackColor: Colors.grey.shade400,
            //     splashRadius: 50.0,
            //     value: homeViewModel.toggleAlarm,
            //     // changes the state of the switch
            //     onChanged: (value) => homeViewModel.onToggle()),
          ]),
        ),
      ),
    );
  });
}

String getDayName(int index) {
  List<String> days = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];
  return days[index];
}
