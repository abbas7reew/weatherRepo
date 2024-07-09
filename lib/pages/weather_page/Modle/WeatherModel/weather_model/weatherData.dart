import 'package:weather_app/pages/weather_page/Modle/WeatherModel/weather_model/current.dart';
import 'package:weather_app/pages/weather_page/Modle/WeatherModel/weather_model/forecast.dart';
import 'package:weather_app/pages/weather_page/Modle/WeatherModel/weather_model/location.dart';



class WeatherData {
  Location? location;
  Current? current;
  Forecast? forecast;

  WeatherData({this.location, this.current, this.forecast});

  WeatherData.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null ? Location.fromJson(json['location']) : null;
    current = json['current'] != null ? Current.fromJson(json['current']) : null;
    forecast = json['forecast'] != null ? Forecast.fromJson(json['forecast']) : null;
  }
}