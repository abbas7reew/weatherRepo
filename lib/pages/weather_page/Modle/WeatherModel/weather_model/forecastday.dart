
import 'package:weather_app/pages/weather_page/Modle/WeatherModel/weather_model/day.dart';
import 'package:weather_app/pages/weather_page/Modle/WeatherModel/weather_model/hour.dart';

class ForecastDay {
	String? date;
	int? dateEpoch;
	Day? day;
	List<Hour>? hour;

	ForecastDay({this.date, this.dateEpoch, this.day, this.hour});

	ForecastDay.fromJson(Map<String, dynamic> json) {
		date = json['date'] as String?;
		dateEpoch = json['date_epoch'] as int?;
		day = json['day'] != null ? Day.fromJson(json['day']) : null;
		if (json['hour'] != null) {
			hour = [];
			json['hour'].forEach((v) {
				hour!.add(Hour.fromJson(v));
			});
		}
	}
}