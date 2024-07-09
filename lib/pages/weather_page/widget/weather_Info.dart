import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/pages/weather_page/Modle/WeatherModel/weather_model/weatherData.dart';


class WeatherInfoBody extends StatelessWidget {
  final WeatherData weatherData;

  const WeatherInfoBody(this.weatherData);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              "${weatherData.location!.name}",
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(
              'Updated at: ${weatherData.forecast?.forecastday?[0].date}',
              style: const TextStyle(fontSize: 22),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      '${weatherData.forecast?.forecastday?[0].hour?[0].tempC} °C',
                      style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Max Temp: ${weatherData.forecast?.forecastday?[0].day?.maxTempC} °C' ,maxLines: 1, ),
                      Text('Min Temp: ${weatherData.forecast?.forecastday?[0].day?.minTempC} °C',maxLines: 1,),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row( children: [
                Center(
                  child: CachedNetworkImage(
                    width: 140,
                    height: 150,
                    imageUrl: 'https:${weatherData.forecast?.forecastday?[0].day?.condition?.icon}',
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                const SizedBox(width: 20),
                Text(weatherData.forecast?.forecastday?[0].day?.condition?.text ?? 'sunny'),
              ],),
            ),

            const SizedBox(height: 10),
            Center(
              child: Text(
                '${weatherData.location?.country}' ,
                style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}