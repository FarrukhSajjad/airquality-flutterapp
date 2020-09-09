import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper {
  final String url;
  NetworkHelper(this.url);

  Future getData() async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);

      // var city = jsonDecode(data)['data']['city'];
      // print(city);

      // var state = jsonDecode(data)['data']['state'];
      // var country = jsonDecode(data)['data']['country'];

      // //temprature data.current.weather.tp
      // var temp = jsonDecode(data)['data']['current']['weather']['tp'];
      // print(temp);

      // //Humidity, data.current.weather.hu
      // var humditity = jsonDecode(data)['data']['current']['weather']['hu'];
      // print(humditity);

      // //Air Quality Index, data.current.pollution.aqius
      // var aqIndex = jsonDecode(data)['data']['current']['pollution']['aqius'];
      // print(aqIndex);
    } else {
      print(response.statusCode);
    }
  }
}
