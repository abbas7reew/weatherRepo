import 'package:equatable/equatable.dart';

import 'condition.dart';

class Current extends Equatable {

	final double? tempC;
	final double? tempF;


	const Current({

		this.tempC,
		this.tempF,

	});

	factory Current.fromJson(Map<String, dynamic> json) => Current(

				tempC: json['temp_c'] as double?,
				tempF: (json['temp_f'] as num?)?.toDouble(),

			);

	Map<String, dynamic> toJson() => {

				'temp_c': tempC,
				'temp_f': tempF,

			};

	@override
	List<Object?> get props {
		return [

				tempC,
				tempF,

		];
	}
}
