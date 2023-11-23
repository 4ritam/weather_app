// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:weather_app/models/weather.model.dart';
import 'package:weather_app/repositories/weather.repositories.dart';

final weatherControllerProvider = Provider<WeatherController>(
  (ref) => WeatherController(
    repository: ref.read(weatherRepositoryProvider),
  ),
);

final weatherProvider = FutureProvider((ref) {
  return ref.read(weatherControllerProvider).getWeather();
});

class WeatherController {
  final WeatherRepository _repository;

  final String _defaultLocation = "Agartala";

  WeatherController({
    required WeatherRepository repository,
  }) : _repository = repository;

  Future<WeatherModel> getWeather() {
    return _repository.getWeatherData(_defaultLocation);
  }
}
