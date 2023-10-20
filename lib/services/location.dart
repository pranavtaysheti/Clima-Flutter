import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';

const String apiKey = "60a67f790ae70df281b69c9c15bbc896";

class Location {
  late double latitude;
  late double longitude;

  void getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);

      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
