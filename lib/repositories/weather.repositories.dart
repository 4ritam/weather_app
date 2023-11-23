import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/models/weather.model.dart';
import 'package:weather_app/services/weather.service.dart';

final weatherRepositoryProvider = Provider<WeatherRepository>(
  (ref) => WeatherRepository(
    weatherService: WeatherService(
      apiKey: "a081f1a9fe694c9f94b92852231811",
    ),
  ),
);

class WeatherRepository {
  final WeatherService weatherService;

  WeatherRepository({required this.weatherService});

  Future<WeatherModel> getWeatherData(String loc) async {
    return weatherService.getCurrentWeather(loc);
  }

}
