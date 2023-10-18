import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SetAlarmView extends StatefulWidget {
  const SetAlarmView({super.key});

  @override
  State<SetAlarmView> createState() => _SetAlarmViewState();
}

class _SetAlarmViewState extends State<SetAlarmView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.cancel_rounded))
            ],
          )
        ],
      ),
    );
  }
}
