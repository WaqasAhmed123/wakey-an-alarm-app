// ignore_for_file: must_call_super

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:wakey/services/location_service.dart';
import 'package:wakey/view_models/select_location_viewmodel.dart';

import '../models/user_model.dart';

// class SelectLocationView extends StatefulWidget {
//   const SelectLocationView({super.key});

//   @override
//   State<SelectLocationView> createState() => _SelectLocationViewState();
// }

class SelectLocationView extends StatefulWidget {
  const SelectLocationView({Key? key}) : super(key: key);

  @override
  _SelectLocationViewState createState() => _SelectLocationViewState();
}

class _SelectLocationViewState extends State<SelectLocationView> {
  // final Completer<GoogleMapController> _controllerCompleter = Completer();

  @override
  Widget build(BuildContext context) {
    final selectLocationViewModel =
        Provider.of<SelectLocationViewModel>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Select Location'),
      ),
      body: GoogleMap(
        // onMapCreated: (GoogleMapController controller) {
        //   selectLocationViewModel.controllerCompleter.complete(controller);
        // },
        // onCameraMove: (CameraPosition position) {
        //   selectLocationViewModel.currentLocation = position.target;
        // },
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        initialCameraPosition: CameraPosition(
          target:
              selectLocationViewModel.currentLocation ?? const LatLng(0.0, 0.0),
          zoom: 15.0,
        ),
      ),
    );
  }
}
