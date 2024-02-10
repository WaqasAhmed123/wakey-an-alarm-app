import 'package:flutter/material.dart';
import 'package:wakey/services/location_service.dart';
import 'package:wakey/views/select_location.dart';

void showPopupMenu({context, position}) async {
  // final RenderBox overlay =
  //     Overlay.of(context).context.findRenderObject() as RenderBox;

  // final RelativeRect position = RelativeRect.fromLTRB(
  //   tapPosition.dx,
  //   tapPosition.dy,
  //   tapPosition.dx + 1,
  //   tapPosition.dy + 1,
  // );

  await showMenu(
    context: context,
    position: RelativeRect.fromLTRB(
      position.dx,
      position.dy,
      position.dx + 1,
      position.dy + 1,
    ),
    items: <PopupMenuEntry>[
      PopupMenuItem(
        // value: 2,
        child: InkWell(
          onTap: () async {
            await LocationService.fetchCurrentLocation();
            Navigator.pop(context);
          },
          // child: Container(
          // padding: const EdgeInsets.all(8.0), // Adjust padding as needed
          child: const Row(
            children: [
              Text('Current Location'),
            ],
          ),
        ),
      ),
      PopupMenuItem(
        // value: 2,
        child: InkWell(
          onTap: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SelectLocationView(),
              ),
            );
            Navigator.pop(context);
          },
          // child: Container(
          // padding: const EdgeInsets.all(8.0), // Adjust padding as needed
          child: const Row(
            children: [
              Text('Choose on Map'),
            ],
          ),
        ),
      ),
      // ),
      // Add more PopupMenuItems as needed
    ],
    // elevation: 8.0, // You can adjust the elevation of the menu
  );
}
