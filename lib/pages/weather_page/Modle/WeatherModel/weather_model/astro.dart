class Astro {
	final String? sunrise;
	final String? sunset;
	final String? moonrise;
	final String? moonset;
	final String? moonPhase;
	final String? moonIllumination;

	Astro({
		this.sunrise,
		this.sunset,
		this.moonrise,
		this.moonset,
		this.moonPhase,
		this.moonIllumination,
	});

	factory Astro.fromJson(Map<String, dynamic> json) {
		return Astro(
			sunrise: json['sunrise'] as String?,
			sunset: json['sunset'] as String?,
			moonrise: json['moonrise'] as String?,
			moonset: json['moonset'] as String?,
			moonPhase: json['moon_phase'] as String?,
			moonIllumination: json['moon_illumination'] as String?,
		);
	}
}