import 'package:geolocator/geolocator.dart';

class Location {
  double longitude;
  double latitutde;

  Future<void> getCurrentLocation() async {
    try {
      Position position =
          await getCurrentPosition(desiredAccuracy: LocationAccuracy.best);

      longitude = position.longitude;
      latitutde = position.latitude;
    } catch (e) {}
  }
}
