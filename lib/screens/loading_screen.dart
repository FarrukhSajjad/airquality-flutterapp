import 'package:airquality/screens/homepage.dart';
import 'package:airquality/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../services/location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double longitude;
  double latitude;

  Future<void> getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitutde;
    longitude = location.longitude;
    NetworkHelper networkHelper = NetworkHelper(
        'http://api.airvisual.com/v2/nearest_city?lat=$latitude&lon=$longitude&key=1be424d4-4480-4930-a76a-c43df2e17640');

    var locationData = await networkHelper.getData();
    Navigator.push(context, MaterialPageRoute(builder: (ctx) {
      return HomePage(
        locationstats: locationData,
      );
    }));
  }

  @override
  void initState() {
    getLocationData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitChasingDots(
          color: Colors.black,
          size: 50,
        ),
      ),
    );
  }
}
