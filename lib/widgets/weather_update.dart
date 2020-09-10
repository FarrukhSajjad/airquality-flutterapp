import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_icons/weather_icons.dart';

class WeatherUpdates extends StatelessWidget {
  const WeatherUpdates({
    Key key,
    @required this.temprature,
    @required this.humidity,
    @required this.city,
    @required this.state,
    @required this.country,
  }) : super(key: key);

  final int temprature;
  final int humidity;
  final String city;
  final String state;
  final String country;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.pink[50],
        borderRadius: BorderRadius.circular(10),
      ),
      height: MediaQuery.of(context).size.height / 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BoxedIcon(
                WeatherIcons.cloud,
                size: 30,
              ),
              SizedBox(
                width: 25,
              ),
              Text(
                '$temprature °C',
                style: GoogleFonts.architectsDaughter(
                    fontSize: 35, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BoxedIcon(
                WeatherIcons.humidity,
                size: 30,
              ),
              SizedBox(
                width: 25,
              ),
              Text(
                ' $humidity %',
                style: GoogleFonts.architectsDaughter(
                    fontSize: 35, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Text(
            '$city | $state | $country',
            style: TextStyle(color: Colors.black, fontSize: 25),
          ),
        ],
      ),
    );
  }
}
