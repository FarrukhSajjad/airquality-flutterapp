import 'package:airquality/services/pollution.dart';
import 'package:airquality/widgets/healt_recomendation.dart';
import 'package:airquality/widgets/weather_update.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speedometer/flutter_speedometer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_icons/weather_icons.dart';

class HomePage extends StatefulWidget {
  final locationstats;

  HomePage({
    this.locationstats,
  });

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PollutionModel pollutionModel = PollutionModel();

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationstats);
    print(widget.locationstats);
  }

  var city;
  var state;
  var country;
  var temprature;
  var humidity;
  var aqIndex;
  String precaution;

  void updateUI(dynamic locationData) {
    city = locationData['data']['city'];
    state = locationData['data']['state'];
    country = locationData['data']['country'];
    temprature = locationData['data']['current']['weather']['tp'];
    humidity = locationData['data']['current']['weather']['hu'];
    aqIndex = locationData['data']['current']['pollution']['aqius'];
    precaution = pollutionModel.getPollution(aqIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                WeatherUpdates(
                  temprature: temprature,
                  humidity: humidity,
                  city: city,
                  state: state,
                  country: country,
                ),
                SizedBox(
                  height: 20,
                ),
                Speedometer(
                  size: 200,
                  minValue: 0,
                  maxValue: 310,
                  currentValue: aqIndex,
                  warningValue: 150,
                  backgroundColor: Colors.white,
                  meterColor: Colors.greenAccent,
                  warningColor: Colors.red,
                  kimColor: Colors.black,
                  displayNumericStyle: GoogleFonts.gayathri(
                    fontSize: 28,
                    color: Colors.blue,
                  ),
                  displayText: 'Air Quality Index',
                  displayTextStyle: GoogleFonts.robotoMono(
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Text(
                    '$precaution',
                    style: GoogleFonts.teko(
                      fontSize: 35,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'HEALTH RECOMMENDATIONS',
                        style: GoogleFonts.teko(
                          color: Colors.blue,
                          fontSize: 25,
                        ),
                      ),
                      Text(
                        'How to protect yourself from pollution in $city ?',
                        style:
                            GoogleFonts.openSans(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      NotificationListener<OverscrollIndicatorNotification>(
                        onNotification: (overscroll) {
                          overscroll.disallowGlow();
                        },
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              HealthRecomedation(
                                healthrec:
                                    'Sensitive groups should wear a mask outside',
                                howto: 'GET A MASK',
                                image: 'assets/images/mask.png',
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              HealthRecomedation(
                                healthrec: 'Run an air purifier',
                                howto: 'GET AN AIR PURIFIER',
                                image: 'assets/images/airpurifier.png',
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
