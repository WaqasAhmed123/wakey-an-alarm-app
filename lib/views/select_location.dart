import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart'; // Add this import for geocoding
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:wakey/utils/text_style.dart';
import 'package:wakey/view_models/select_location_viewmodel.dart';

class SelectLocationView extends StatefulWidget {
  const SelectLocationView({Key? key}) : super(key: key);

  @override
  _SelectLocationViewState createState() => _SelectLocationViewState();
}

class _SelectLocationViewState extends State<SelectLocationView> {
  // final Set<Marker> _markers = {}; // Set to store markers on the map

  @override
  Widget build(BuildContext context) {
    final selectLocationViewModel =
        Provider.of<SelectLocationViewModel>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        title: Text('Select Location', style: textStyle()["titleMedium"]),
      ),
      body: Stack(children: [
        Consumer<SelectLocationViewModel>(builder: (context, value, child) {
          return GoogleMap(
            onMapCreated: (GoogleMapController controller) {},
            onLongPress: (LatLng point) async {
              // Handle the long-press event here
              print('Long Pressed: $point');
              selectLocationViewModel.addTempMarker(point: point);
              // Add a red temporary marker
              // _markers.clear(); // Clear existing markers
              // _markers.add(
              //   Marker(
              //     markerId: const MarkerId('selected_location'),
              //     position: point,
              //     icon: BitmapDescriptor.defaultMarkerWithHue(
              //       BitmapDescriptor.hueRed,
              //     ),
              //   ),
              // );

              // Reverse geocode to get the address information
              List<Placemark> placemarks = await placemarkFromCoordinates(
                  point.latitude, point.longitude);
              Placemark place = placemarks[0];

              // ignore: use_build_context_synchronously
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (BuildContext context) {
                  return Container(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      width: MediaQuery.sizeOf(context).width * 1,
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Selected Location',
                              style: textStyle(
                                  textColor: Colors.yellow)["titleMedium"]),
                          const SizedBox(height: 8.0),
                          Text(
                              'Address: ${place.name}, ${place.locality} ${place.country} ',
                              style: textStyle()["titleSmall"]),
                          // Text(
                          //     'City: ${place.locality}, Country: ${place.country}'),
                          // Text('State: ${place.administrativeArea}'),
                          // Text('Country: ${place.country}'),
                        ],
                      ));
                },
              ).whenComplete(() {
                selectLocationViewModel.removeTempMarker();
              });
            },
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
            initialCameraPosition: CameraPosition(
              target: selectLocationViewModel.currentLocation ??
                  const LatLng(0.0, 0.0),
              zoom: 15.0,
            ),
            markers: selectLocationViewModel.markers,
          );
        })
      ]),
    );
  }
}
