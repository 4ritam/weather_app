import 'package:flutter/material.dart';
import 'package:weather_app/screens/weather/weather.screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColorDark: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      title: "Weather App",
      home: const WeatherScreen(),
    );
  }
}
