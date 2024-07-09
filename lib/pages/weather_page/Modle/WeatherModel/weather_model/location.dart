import 'package:equatable/equatable.dart';

class Location {
	String? name;
	String? region;
	String? country;
	double? lat;
	double? lon;
	String? tzId;
	int? localtimeEpoch;
	String? localtime;

	Location({
		this.name,
		this.region,
		this.country,
		this.lat,
		this.lon,
		this.tzId,
		this.localtimeEpoch,
		this.localtime,
	});

	Location.fromJson(Map<String, dynamic> json) {
		name = json['name'] as String?;
		region = json['region'] as String?;
		country = json['country'] as String?;
		lat = json['lat']?.toDouble();
		lon = json['lon']?.toDouble();
		tzId = json['tz_id'] as String?;
		localtimeEpoch = json['localtime_epoch'] as int?;
		localtime = json['localtime'] as String?;
	}
}