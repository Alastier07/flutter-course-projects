import 'package:flutter/material.dart';
import 'package:location/location.dart';

import '../helpers/location_helper.dart';

class LocationInput extends StatefulWidget {
  final Function onSelectPlace;

  LocationInput(this.onSelectPlace);

  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String _previewImageUrl;
  final _addressController = TextEditingController();
  String _locationAPI;

  Future<void> _getCurrentUserLocation() async {
    final locData = await Location().getLocation();
    final staticMapImageUrl = LocationHelper.generateLocationPreviewImage(
      latitude: locData.latitude,
      longitude: locData.longitude,
    );
    setState(() {
      _previewImageUrl = staticMapImageUrl;
      // print(_previewImageUrl);
    });
    _locationAPI = '${locData.latitude},${locData.longitude}';
    widget.onSelectPlace(_locationAPI);
  }

  Future<void> _getAddressInputLocation() async {
    String _addressInput = _addressController.text;

    if (_addressInput == null || _addressInput == '') {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('An Error Occured!'),
          content: Text('Please provide location address.'),
          actions: <Widget>[
            FlatButton(
              child: Text('Okay'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      );
    } else {
      _locationAPI = _addressInput.replaceAll(' ', '+');
      final staticMapImageUrl =
          LocationHelper.generateAddressPreviewImage(_locationAPI);
      setState(() {
        _previewImageUrl = staticMapImageUrl;
        // print(_previewImageUrl);
      });
      widget.onSelectPlace(_locationAPI);
      // final placeDetails = await LocationHelper.getPlaceAddress(_locationAPI);
      // print(placeDetails.first['plAddress']);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          decoration: InputDecoration(labelText: 'Address (Optional)'),
          controller: _addressController,
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey,
            ),
          ),
          child: _previewImageUrl == null
              ? Text(
                  'No Location Chosen',
                  textAlign: TextAlign.center,
                )
              : Image.network(
                  _previewImageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.location_on),
              label: Text('Current Location'),
              textColor: Theme.of(context).primaryColor,
              onPressed: _getCurrentUserLocation,
            ),
            FlatButton.icon(
              icon: Icon(Icons.map),
              label: Text('Address Location'),
              textColor: Theme.of(context).primaryColor,
              onPressed: _getAddressInputLocation,
            ),
          ],
        ),
      ],
    );
  }
}
