// import 'package:flutter/material.dart';
// import 'package:wakey/utils/text_style.dart';

// class SetAlarmView extends StatefulWidget {
//   const SetAlarmView({super.key});
//   @override
//   State<SetAlarmView> createState() => _SetAlarmViewState();
// }

// class _SetAlarmViewState extends State<SetAlarmView> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 IconButton(
//                     onPressed: () {},
//                     icon: const Icon(
//                       Icons.close,
//                       color: Colors.white,
//                     )),
//                 Text(
//                   "Add Alarm",
//                   style: textStyle()['titleMedium'],
//                 ),
//                 IconButton(
//                     onPressed: () {},
//                     icon: const Icon(Icons.check, color: Colors.white)),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wakey/utils/text_style.dart';

class SetAlarmView extends StatefulWidget {
  const SetAlarmView({Key? key}) : super(key: key);

  @override
  State<SetAlarmView> createState() => _SetAlarmViewState();
}

class _SetAlarmViewState extends State<SetAlarmView> {
  int selectedHour = 0;
  int selectedMinute = 0;
  bool isAm = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.close,
                      color: Colors.white,
                    )),
                Text(
                  "Add Alarm",
                  style: textStyle()['titleMedium'],
                ),
                IconButton(
                    onPressed: () {
                      // Handle the selected alarm time (selectedHour, selectedMinute, isAm)
                      // Save the selected time to your alarm data or perform other actions.
                    },
                    icon: const Icon(Icons.check, color: Colors.white)),
              ],
            ),
            Container(
              // color: const Color(0xFF34344A),
              color: Theme.of(context).primaryColorDark,
              height: MediaQuery.sizeOf(context).height * 0.4,
              child: Column(children: [
                Expanded(
                    child: CupertinoPicker(
                  itemExtent: 32,
                  scrollController: FixedExtentScrollController(
                      initialItem:
                          3), // Initial middle element is 3 (0-based index)
                  onSelectedItemChanged: (index) {
                    setState(() {
                      selectedHour = index +
                          1; // Adjust the selectedHour value based on the initial index
                    });
                  },
                  children: [
                    ListView.builder(
                        itemCount: 12,
                        itemBuilder: (context, index) {
                          int displayedValue = index + 1;
                          bool isBold = index == 2;
                          return Center(
                            child: Text(
                              '$displayedValue',
                              style: TextStyle(
                                color: isBold
                                    ? Colors.white
                                    : Colors
                                        .grey, // Set color based on bold or regular
                                fontWeight: isBold
                                    ? FontWeight.bold
                                    : FontWeight.normal, // Set bold or regular
                              ),
                            ),
                          );
                        })
                  ],
                  // children: List<Widget>.generate(5, (index) {
                  //   int displayedValue = index + 1;
                  //   bool isBold = index == 2; // Middle element is bold
                  //   return Center(
                  //     child: Text(
                  //       '$displayedValue',
                  //       style: TextStyle(
                  //         color: isBold
                  //             ? Colors.white
                  //             : Colors
                  //                 .grey, // Set color based on bold or regular
                  //         fontWeight: isBold
                  //             ? FontWeight.bold
                  //             : FontWeight.normal, // Set bold or regular
                  //       ),
                  //     ),
                  //   );
                  // }),
                ))
              ])
              // Alarm Time Selection
              // Minutes Picker
              // CupertinoPicker(
              //   itemExtent: 32.0,
              //   backgroundColor: Colors.grey[200],
              //   onSelectedItemChanged: (index) {
              //     setState(() {
              //       selectedMinute = index;
              //     });
              //   },
              //   children: List<Widget>.generate(60, (index) {
              //     return Center(
              //       child: Text(
              //         index.toString().padLeft(2, '0'),
              //         style: const TextStyle(color: Colors.black),
              //       ),
              //     );
              //   }),
              // ),
              // // AM/PM Picker
              // CupertinoPicker(
              //   itemExtent: 32.0,
              //   backgroundColor: Colors.grey[200],
              //   onSelectedItemChanged: (index) {
              //     setState(() {
              //       isAm = index == 0;
              //     });
              //   },
              //   children: const <Widget>[
              //     Center(
              //       child: Text(
              //         'AM',
              //         style: TextStyle(color: Colors.black),
              //       ),
              //     ),
              //     Center(
              //       child: Text(
              //         'PM',
              //         style: TextStyle(color: Colors.black),
              //       ),
              //     ),
              //   ],
              // ),
              ,
            ),
          ],
        ),
      ),
    );
  }
}
