import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/pages/weather_page/Modle/WeatherModel/weather_model/weatherData.dart';
import 'package:weather_app/utils/api_service.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {

  bool isLight=true;
  bool iconBool=true;

  Locale locale=Locale('en');

  IconData lightIcon= Icons.sunny;
  IconData darkIcon= Icons.nights_stay;
  final ApiService apiService;
  WeatherCubit(this.apiService) : super(WeatherInitial());

  Future<void> fetchWeather(String location) async {
    try {
      emit(WeatherLoading());
      final weatherData = await apiService.getWeather(location);
      emit(WeatherLoaded(weatherData));
    } catch (e) {
      emit(WeatherError(e.toString()));
    }
  }

  changeMode(){
    isLight=!isLight;
    emit(ModeSuccess());
  }

  changeIcon(){
    iconBool=!iconBool;
    emit(IconSuccess());
  }

   changeLanguage(String lan){
    locale= Locale(lan);

    emit(LangSuccess());

  }
}



  // Future<Weather?> getWeather( String value) async{
  //   emit(WeatherIndicator());
  //   try {
  //
  //      weatherModel = await ApiService().get( value);
  //
  //     emit(WeatherLoaded());
  //     return weatherModel;
  //   }catch(e){
  //     emit(WeatherFailure(weather:e.toString()));
  //   }
  // }







  // Future<void> getWeather(String loc) async{
  //  // emit(LoadingWeather());
  //   try {
  //
  //    weather = await ApiService(Dio()).get(loc) ;
  //    emit(SuccessWeather());
  //   //  weather =  Weather.fromJson(rew);
  //     switch(weather!.current!.condition!.text){
  //       case 'Mist' :{
  //         KbackColor=Color(0xffFFA957);
  //         KTextColor=Color(0xffFAFAFA);
  //       }
  //       case 'light rain' :{
  //         KTextColor=Color(0xff000000);
  //         KbackColor=Color(0xffFAFAFA);
  //       }
  //     }
  //
  //   }catch(e){
  //     emit(FailureWeather());
  //   }
  // }

