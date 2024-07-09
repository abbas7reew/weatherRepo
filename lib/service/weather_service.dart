import 'package:dio/dio.dart';
import 'package:weather_app/pages/weather_page/Modle/weather/weather.dart';



class WeatherService{

   final Dio dio= Dio();



  Future<Weather> getCurrentWeather({String cityName="London"}) async {
    try {
      var response = await dio.get('https://api.weatherapi.com/v1/forecast.json?key=1f248c408da945409d1222412242306&q=$cityName&days=1&aqi=no&alerts=no');

        Weather rew = Weather.fromJson(response.data);
      return rew;
    }on DioException catch(e){
      final String errorMessage= e.response?.data['error']['message'] ?? 'oops error';
      throw Exception(errorMessage);
    }catch(e){
      throw Exception('oops ');
    }
}
}