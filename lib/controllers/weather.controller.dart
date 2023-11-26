// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:weather_app/models/weather.model.dart';
import 'package:weather_app/repositories/weather.repositories.dart';

final weatherControllerProvider = Provider<WeatherController>(
  (ref) => WeatherController(
    repository: ref.watch(weatherRepositoryProvider),
  ),
);

final weatherDataStreamProvider =
    StreamProvider((ref) => ref.watch(weatherControllerProvider).getWeather());

final weatherDataListStreamProvider = StreamProvider(
    (ref) => ref.watch(weatherControllerProvider).getWeatherList());

class WeatherController {
  final WeatherRepository _repository;

  final int _defaultLocation = 0;
  final List<String> _locations = ["Agartala"];

  WeatherController({
    required WeatherRepository repository,
  }) : _repository = repository;

  List<String> get location => _locations;

  Stream<WeatherModel> getWeather() {
    return _repository.weatherDataStream(_locations[_defaultLocation]);
  }

  Stream<List<WeatherModel>> getWeatherList() {
    return _repository.weatherListDataStream(_locations);
  }
}
