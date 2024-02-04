import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_models/set_alarm_viewmodel.dart';

alarmTimeSelctor({context, childCount, columnOfScroller}) {
  final setAlarmViewModel =
      Provider.of<SetAlarmViewModel>(context, listen: false);

  return ListWheelScrollView.useDelegate(
      physics: const FixedExtentScrollPhysics(),
      itemExtent: 40,
      onSelectedItemChanged: (index) {
        // setAlarmViewModel.setSelectedHour(selectedHour: index + 1);
        columnOfScroller == 1
            ? setAlarmViewModel.setSelectedHour(selectedHour: index + 1)
            : columnOfScroller == 2
                ? setAlarmViewModel.setSelectedMin(selectedMin: index + 1)
                : setAlarmViewModel.setSelectedAmOrPm(
                    selectedAmOrPm: index == 0 ? "AM" : "PM");

        debugPrint("${setAlarmViewModel.getSelectedHour}");
      },
      childDelegate: ListWheelChildBuilderDelegate(
          childCount: childCount,
          builder: (context, index) {
            dynamic displayedValue;
            if (columnOfScroller == 1 || columnOfScroller == 2) {
              displayedValue = (index + 1);
            } else {
              displayedValue = index == 0 ? "AM" : "PM";
            }
            return Center(
              child: Consumer<SetAlarmViewModel>(
                builder: (context, viewModel, child) {
                  return Text(
                    (columnOfScroller == 1 || columnOfScroller == 2)
                        ? (displayedValue < 10
                            ? '0$displayedValue'
                            : '$displayedValue')
                        : displayedValue.toString(),
                    style: TextStyle(
                      fontSize: 22,
                      color: columnOfScroller == 1
                          ? displayedValue == viewModel.getSelectedHour
                              ? Colors.white
                              : Colors.white.withOpacity(0.5)
                          : columnOfScroller == 2
                              ? displayedValue == viewModel.getSelectedMin
                                  ? Colors.white
                                  : Colors.white.withOpacity(0.5)
                              : displayedValue.toString() ==
                                      viewModel.getSelectedAmOrPm
                                  ? Colors.white
                                  : Colors.white.withOpacity(0.5),

                      //  columnOfScroller == 3?
                      // displayedValue == viewModel.getSelectedAmOrPm?
                      // Colors.white
                      //               : Colors.white.withOpacity(0.5)
                    ),
                  );
                },
              ),
            );
          }));
}
