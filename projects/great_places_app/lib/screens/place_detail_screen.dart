import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/great_places.dart';

import '../helpers/location_helper.dart';

class PlaceDetailScreen extends StatelessWidget {
  static const routeName = '/place-details';
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments;
    final selectedPlace =
        Provider.of<GreatPlaces>(context, listen: false).findById(id);

    final staticMapImageUrl = LocationHelper.generateLocationPreviewImage(
      latitude: selectedPlace.location.latitude,
      longitude: selectedPlace.location.longitude,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedPlace.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 250,
              width: double.infinity,
              child: Image.file(
                selectedPlace.image,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              selectedPlace.location.address,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(
                'Map Location',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20, color: Colors.blue),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              height: 250,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(staticMapImageUrl,
                    fit: BoxFit.cover, width: double.infinity),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
