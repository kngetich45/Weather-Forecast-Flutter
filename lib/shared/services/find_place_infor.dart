import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

Future<String?> getAddressFromLatLong(Position position) async {
  List<Placemark> placemarks =
      await placemarkFromCoordinates(position.latitude, position.longitude);
  Placemark place = placemarks[0];

  return '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode} ${place.country}';
}
