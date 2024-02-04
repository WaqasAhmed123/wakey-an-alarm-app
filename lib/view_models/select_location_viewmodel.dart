import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../models/user_model.dart';

class SelectLocationViewModel extends ChangeNotifier {
  LatLng? selectedLocation = UserModel.currentLocation;
  
}
