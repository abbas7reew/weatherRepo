

class Day {
	final double? maxtempC;
	final double? mintempC;

	Day({this.maxtempC, this.mintempC});

	factory Day.fromJson(Map<String, dynamic> json) {
		return Day(
			maxtempC: json['maxtemp_c'],
			mintempC: json['mintemp_c'],
		);
	}
}
