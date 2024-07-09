import 'package:weather_app/pages/weather_page/Modle/WeatherModel/weather_model/condition.dart';

class Hour {


	double? tempC;

	Condition? condition;


	Hour({

		this.tempC,

		this.condition,

	});

	Hour.fromJson(Map<String, dynamic> json) {

		tempC = json['temp_c']?.toDouble();

		condition = json['condition'] != null ? Condition.fromJson(json['condition']) : null;

	}
}