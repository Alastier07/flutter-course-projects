import 'dart:convert';

import 'package:http/http.dart' as http;

const MY_API_KEY = 'eGAH8tuGAHBCIWwjedft12LZ4K0YQcJN';

class LocationHelper {
  static String generateLocationPreviewImage(
      {double? latitude, double? longitude}) {
    return 'https://www.mapquestapi.com/staticmap/v5/map?locations=$latitude,$longitude&size=@2x&defaultMarker=marker-md-3B5998-22407F&key=$MY_API_KEY&type=hyb';
  }

  static String generateAddressPreviewImage(String address) {
    return 'https://www.mapquestapi.com/staticmap/v5/map?locations=$address&size=@2x&defaultMarker=marker-md-3B5998-22407F&key=$MY_API_KEY&type=hyb';
  }

  static Future<List<Map<String, dynamic>>> getPlaceAddress(
      String location) async {
    final url = Uri.parse(
        'http://www.mapquestapi.com/geocoding/v1/address?key=$MY_API_KEY&location=$location');
    final response = await http.get(url);
    final dataAddress = json.decode(response.body)['results'][0];
    final placeAdrress =
        '${dataAddress['locations'][0]['adminArea5']}, ${dataAddress['locations'][0]['adminArea4']}, ${dataAddress['locations'][0]['adminArea3']}, ${dataAddress['locations'][0]['adminArea1']}';
    final placeLat = dataAddress['locations'][0]['latLng']['lat'];
    final placeLng = dataAddress['locations'][0]['latLng']['lng'];
    return [
      {'plAddress': placeAdrress, 'plLat': placeLat, 'plLng': placeLng}
    ];
  }

  // static Future<String> getPlaceLatitude(String location) async {
  //   final url = Uri.parse(
  //       'http://www.mapquestapi.com/geocoding/v1/address?key=$MY_API_KEY&location=$location');
  //   final response = await http.get(url);
  //   return json.decode(response.body)['results'][0]['locations'][0]['latLng']
  //       ['lat'];
  // }

  // static Future<String> getPlaceLongitude(String location) async {
  //   final url = Uri.parse(
  //       'http://www.mapquestapi.com/geocoding/v1/address?key=$MY_API_KEY&location=$location');
  //   final response = await http.get(url);
  //   return json.decode(response.body)['results'][0]['locations'][0]['latLng']
  //       ['lng'];
  // }
}
