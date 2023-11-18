import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/models/weather.model.dart';
import 'package:weather_app/repositories/weather.repositories.dart';

final weatherControllerProvider = Provider<WeatherController>((ref) =>
    WeatherController(repository: ref.read(weatherRepositoryProvider)));

class WeatherController {
  final WeatherRepository _repository;

  int _defaultLocation = 0;
  Weather? screenData;

  WeatherController({
    required WeatherRepository repository,
  }) : _repository = repository {
    screenData = _repository.getWeatherData(_defaultLocation);
  }

  void changeDefault(int i) {
    _defaultLocation = i;
    screenData = _repository.getWeatherData(i);
    print(screenData);
  }
}
