import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final locationstats;

  HomePage({
    this.locationstats,
  });

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  void updateUI(dynamic locationData) {
    city = locationData['data']['city'];
    state = locationData['data']['state'];
    country = locationData['data']['country'];
    temprature = locationData['data']['current']['weather']['tp'];
    humidity = locationData['data']['current']['weather']['hu'];
    aqIndex = locationData['data']['current']['pollution']['aqius'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.pink[200],
                  borderRadius: BorderRadius.circular(20),
                ),
                height: MediaQuery.of(context).size.height / 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.cloud_circle,
                          color: Colors.white,
                          size: 40,
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Text(
                          '$temprature °C',
                          style: TextStyle(color: Colors.white, fontSize: 35),
                        ),
                      ],
                    ),
                    Text(
                      '$city | $state | $country',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
