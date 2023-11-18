import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/extra/dummy_data.dart';

import '../models/weather.model.dart';

final weatherRepositoryProvider =
    Provider<WeatherRepository>((ref) => WeatherRepository());

class WeatherRepository {
  final List<Weather> _weatherData;

  WeatherRepository() : _weatherData = dummy;

  Weather getWeatherData(int i) {
    return _weatherData[i];
  }
}
