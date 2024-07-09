import 'package:equatable/equatable.dart';

import 'current.dart';
import 'forecast.dart';
import 'location.dart';

class Weather {
	// تأكد من توافق الحقول مع البيانات المستلمة من API
	final Location? location;
	final Current? current;
	final Forecast? forecast;

	Weather({this.location, this.current, this.forecast});

	factory Weather.fromJson(Map<String, dynamic> json) {
		return Weather(
			location: Location.fromJson(json['location']),
			current: Current.fromJson(json['current']),
			forecast: Forecast.fromJson(json['forecast']),
		);
	}
}
