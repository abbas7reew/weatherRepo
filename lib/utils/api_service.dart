import 'package:dio/dio.dart';
import 'package:weather_app/pages/weather_page/Modle/WeatherModel/weather_model/weatherData.dart';




  class ApiService {
  final Dio _dio = Dio();
  final String apiKey = '1f248c408da945409d1222412242306';

  Future<WeatherData> getWeather(String loc) async {
  try {
  final response = await _dio.get(
  'https://api.weatherapi.com/v1/forecast.json?key=$apiKey&q=$loc&days=1&aqi=no&alerts=no');
  if (response.statusCode == 200) {
  return WeatherData.fromJson(response.data);
  } else {
  throw Exception('Failed to load weather data');
  }
  } catch (e) {
  throw Exception('Failed to load weather data: $e');
  }
  }

}