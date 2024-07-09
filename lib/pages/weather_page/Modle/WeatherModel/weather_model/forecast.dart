import 'package:weather_app/pages/weather_page/Modle/WeatherModel/weather_model/forecastday.dart';

class Forecast {
	List<ForecastDay>? forecastday;

	Forecast({this.forecastday});

	Forecast.fromJson(Map<String, dynamic> json) {
		if (json['forecastday'] != null) {
			forecastday = [];
			json['forecastday'].forEach((v) {
				forecastday!.add(ForecastDay.fromJson(v));
			});
		}
	}
}