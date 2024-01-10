// import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weatherModels.dart';

class WeatherData {





  static Future<Weather> fetchData() async {
    String api_key = 'c4527af374bc4cd3b98115634232411';

    String base_url = 'api.weatherapi.com';
    final queryParameters = {
      'key': '$api_key',
      'q': 'kochi',
    };

    var url = Uri.https(base_url, '/v1/current.json', queryParameters);

    final response = await http.get(url);

    if (response.statusCode == 200) {
      print(response.body);
      final model = weatherFromJson(response.body);
      print('country : ${model.location.country}');
      return model;
    } else {
      throw Exception('Failed to load data');
    }
  }
}