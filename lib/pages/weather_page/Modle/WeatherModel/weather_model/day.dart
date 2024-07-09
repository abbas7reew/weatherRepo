import 'package:equatable/equatable.dart';
import 'condition.dart';

class Day {
	double? maxTempC;
	double? minTempC;
	Condition? condition;


	Day({
		this.maxTempC,
		this.minTempC,
		this.condition

	});

	Day.fromJson(Map<String, dynamic> json) {
		maxTempC = json['maxtemp_c'] ?.toDouble();
		minTempC = json['mintemp_c'] ?.toDouble();
		condition = json['condition'] != null ? Condition.fromJson(json['condition']) : null;

	}
}