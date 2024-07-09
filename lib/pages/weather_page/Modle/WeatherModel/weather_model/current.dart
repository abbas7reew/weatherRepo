import 'package:weather_app/pages/weather_page/Modle/WeatherModel/weather_model/condition.dart';

class Current {
	int? lastUpdatedEpoch;
	String? lastUpdated;
	double? tempC;
	double? tempF;
	int? isDay;
	Condition? condition;
	double? windMph;
	double? windKph;
	int? windDegree;
	String? windDir;
	double? pressureMb;
	double? pressureIn;
	double? precipMm;
	double? precipIn;
	int? humidity;
	int? cloud;
	double? feelslikeC;
	double? feelslikeF;
	double? windchillC;
	double? windchillF;
	double? heatindexC;
	double? heatindexF;
	double? dewpointC;
	double? dewpointF;
	double? visKm;
	double? visMiles;
	double? uv;
	double? gustMph;
	double? gustKph;

	Current({
		this.lastUpdatedEpoch,
		this.lastUpdated,
		this.tempC,
		this.tempF,
		this.isDay,
		this.condition,
		this.windMph,
		this.windKph,
		this.windDegree,
		this.windDir,
		this.pressureMb,
		this.pressureIn,
		this.precipMm,
		this.precipIn,
		this.humidity,
		this.cloud,
		this.feelslikeC,
		this.feelslikeF,
		this.windchillC,
		this.windchillF,
		this.heatindexC,
		this.heatindexF,
		this.dewpointC,
		this.dewpointF,
		this.visKm,
		this.visMiles,
		this.uv,
		this.gustMph,
		this.gustKph,
	});

	Current.fromJson(Map<String, dynamic> json) {
		lastUpdatedEpoch = json['last_updated_epoch'] as int?;
		lastUpdated = json['last_updated'] as String?;
		tempC = json['temp_c']?.toDouble();
		tempF = json['temp_f']?.toDouble();
		isDay = json['is_day'] as int?;
		condition = json['condition'] != null ? Condition.fromJson(json['condition']) : null;
		windMph = json['wind_mph']?.toDouble();
		windKph = json['wind_kph']?.toDouble();
		windDegree = json['wind_degree'] as int?;
		windDir = json['wind_dir'] as String?;
		pressureMb = json['pressure_mb']?.toDouble();
		pressureIn = json['pressure_in']?.toDouble();
		precipMm = json['precip_mm']?.toDouble();
		precipIn = json['precip_in']?.toDouble();
		humidity = json['humidity'] as int?;
		cloud = json['cloud'] as int?;
		feelslikeC = json['feelslike_c']?.toDouble();
		feelslikeF = json['feelslike_f']?.toDouble();
		windchillC = json['windchill_c']?.toDouble();
		windchillF = json['windchill_f']?.toDouble();
		heatindexC = json['heatindex_c']?.toDouble();
		heatindexF = json['heatindex_f']?.toDouble();
		dewpointC = json['dewpoint_c']?.toDouble();
		dewpointF = json['dewpoint_f']?.toDouble();
		visKm = json['vis_km']?.toDouble();
		visMiles = json['vis_miles']?.toDouble();
		uv = json['uv']?.toDouble();
		gustMph = json['gust_mph']?.toDouble();
		gustKph = json['gust_kph']?.toDouble();
	}
}