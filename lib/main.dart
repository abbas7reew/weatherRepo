import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:weather_app/firebase_options.dart';
import 'package:weather_app/generated/l10n.dart';
import 'package:weather_app/pages/Auth/login.dart';
import 'package:weather_app/pages/weather_page/Modle/ModeClass.dart';
import 'package:weather_app/utils/api_service.dart';
import 'Cubit/weatherCubit/weather_cubit.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(ApiService()),
      child: Builder(
        builder: (context) {
          return BlocBuilder<WeatherCubit, WeatherState>(
            builder: (context, state) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: BlocProvider
                    .of<WeatherCubit>(context)
                    .isLight ? ModeClass.lightMode : ModeClass.darkMode,


                localizationsDelegates: [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                locale:BlocProvider.of<WeatherCubit>(context).locale,
                home: LoginPage(),
              );
            },
          );
        }
      ),
    );
  }
}
