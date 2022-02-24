const MY_API_KEY = 'eGAH8tuGAHBCIWwjedft12LZ4K0YQcJN';

class LocationHelper {
  static String generateLocationPreviewImage(
      {double latitude, double longitude}) {
    return 'https://www.mapquestapi.com/staticmap/v5/map?locations=$latitude,$longitude&size=@2x&defaultMarker=marker-md-3B5998-22407F&key=$MY_API_KEY';
  }
}
