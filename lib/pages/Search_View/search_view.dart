import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubit/weatherCubit/weather_cubit.dart';


class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('Search City '),
    ),

      body:  Padding(
        padding:  EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child:  TextField(
            onSubmitted: (value) async{
             var weather= BlocProvider.of<WeatherCubit>(context).fetchWeather( value );
              Navigator.of(context).pop();
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: 32,
                horizontal: 16,
              ),
              hintText: 'Enter City Name',
              suffixIcon: Icon(Icons.search),
              labelText: 'Search',
              border: OutlineInputBorder(),

            ),
          ),
        ),
      ),
    );
  }
}
