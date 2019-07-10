import 'package:http/http.dart' as http;
import 'dart:convert';

var weatherData;

class netWorking {
  Future<dynamic> getData(String location) async {
    try {
      http.Response response = await http.get(
          'https://openweathermap.org/data/2.5/weather?q=$location&appid=b6907d289e10d714a6e88b30761fae22');
      if (response.statusCode == 200) {
        String data = response.body;
        weatherData = jsonDecode(data);
        return weatherData;
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }
}
