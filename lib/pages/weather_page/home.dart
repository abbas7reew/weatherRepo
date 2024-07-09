import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubit/weatherCubit/weather_cubit.dart';
import 'package:weather_app/generated/l10n.dart';
import 'package:weather_app/pages/Search_View/search_view.dart';
import 'package:weather_app/pages/weather_page/widget/weather_Info.dart';



class WeatherPage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Weather'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: S.of(context).search1,
                border: OutlineInputBorder(),
              ),
              onSubmitted: (value) {
                BlocProvider.of<WeatherCubit>(context).fetchWeather(value);
              },
            ),
            SizedBox(height: 20),
            Expanded(
              child: BlocBuilder<WeatherCubit, WeatherState>(
                builder: (context, state) {
                  if (state is WeatherInitial) {
                    return Center(child: Text(S.of(context).search));
                  } else if (state is WeatherLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is WeatherLoaded) {
                    return WeatherInfoBody(state.weatherData);
                  } else if (state is WeatherError) {
                    return Center(child: Text(state.message));
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text('Weather App'),
  //       actions: [
  //         IconButton(onPressed: () {
  //           Navigator.of(context).push(MaterialPageRoute(builder: (context) {
  //             return SearchView();
  //           }),
  //           );
  //         },
  //             icon: Icon(Icons.search)),
  //       ],
  //     ),
  //     body: Center(
  //       child: BlocBuilder<WeatherCubit, WeatherState>(
  //           builder: (context, state) {
  //             if (state is WeatherLoaded) {
  //               return WeatherInfoBody(BlocProvider.of<WeatherCubit>(context).weatherModel!);
  //             }
  //             else if (state is WeatherInitial) {
  //               return NoWeatherBody();
  //             }
  //             else if (state is WeatherIndicator) {
  //               return CircularProgressIndicator();
  //             }
  //   else if (state is WeatherFailure) {
  //               return Text('oops failure');
  //   }
  //
  //             else{
  //               return Text('oops there was an error');
  //             }
  //           }
  //       ),
  //     ),
  //   );
  // }