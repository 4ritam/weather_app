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

  Stream<WeatherModel> weatherDataStream(String loc) async* {
    while (true) {
      WeatherModel data = await getWeatherData(loc);
      yield data;
      await Future.delayed(const Duration(seconds: 15));
    }
  }

  Stream<List<WeatherModel>> weatherListDataStream(
      List<String> locList) async* {
    while (true) {
      List<WeatherModel> result = [];
      for (String loc in locList) {
        WeatherModel data = await getWeatherData(loc);
        result.add(data);
      }
      yield result;
      await Future.delayed(const Duration(seconds: 15));
    }
  }
}
