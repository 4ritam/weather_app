import 'dart:convert';

import 'package:flutter/foundation.dart';

class Weather {
  String name;
  DateTime lastUpdated;
  String weather;
  int temperature;
  int feelsLike;
  int humidity;
  double wind;
  List<ForecastModel> forecast;
  Weather({
    required this.name,
    required this.lastUpdated,
    required this.weather,
    required this.temperature,
    required this.feelsLike,
    required this.humidity,
    required this.wind,
    required this.forecast,
  });

  Weather copyWith({
    String? name,
    DateTime? lastUpdated,
    String? weather,
    int? temperature,
    int? feelsLike,
    int? humidity,
    double? wind,
    List<ForecastModel>? forecast,
  }) {
    return Weather(
      name: name ?? this.name,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      weather: weather ?? this.weather,
      temperature: temperature ?? this.temperature,
      feelsLike: feelsLike ?? this.feelsLike,
      humidity: humidity ?? this.humidity,
      wind: wind ?? this.wind,
      forecast: forecast ?? this.forecast,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'lastUpdated': lastUpdated.millisecondsSinceEpoch,
      'weather': weather,
      'temperature': temperature,
      'feelsLike': feelsLike,
      'humidity': humidity,
      'wind': wind,
      'forecast': forecast.map((x) => x.toMap()).toList(),
    };
  }

  factory Weather.fromMap(Map<String, dynamic> map) {
    return Weather(
      name: map['name'] as String,
      lastUpdated:
          DateTime.fromMillisecondsSinceEpoch(map['lastUpdated'] as int),
      weather: map['weather'] as String,
      temperature: map['temperature'] as int,
      feelsLike: map['feelsLike'] as int,
      humidity: map['humidity'] as int,
      wind: map['wind'] as double,
      forecast: List<ForecastModel>.from(
        (map['forecast'] as List<int>).map<ForecastModel>(
          (x) => ForecastModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Weather.fromJson(String source) =>
      Weather.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'WeatherModel(name: $name, lastUpdated: $lastUpdated, weather: $weather, temperature: $temperature, feelsLike: $feelsLike, humidity: $humidity, wind: $wind, forecast: $forecast)';
  }

  @override
  bool operator ==(covariant Weather other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.lastUpdated == lastUpdated &&
        other.weather == weather &&
        other.temperature == temperature &&
        other.feelsLike == feelsLike &&
        other.humidity == humidity &&
        other.wind == wind &&
        listEquals(other.forecast, forecast);
  }

  @override
  int get hashCode {
    return name.hashCode ^
        lastUpdated.hashCode ^
        weather.hashCode ^
        temperature.hashCode ^
        feelsLike.hashCode ^
        humidity.hashCode ^
        wind.hashCode ^
        forecast.hashCode;
  }
}

class ForecastModel {
  String weather;
  int temperature;
  double wind;
  ForecastModel({
    required this.weather,
    required this.temperature,
    required this.wind,
  });

  ForecastModel copyWith({
    String? weather,
    int? temperature,
    double? wind,
  }) {
    return ForecastModel(
      weather: weather ?? this.weather,
      temperature: temperature ?? this.temperature,
      wind: wind ?? this.wind,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'weather': weather,
      'temperature': temperature,
      'wind': wind,
    };
  }

  factory ForecastModel.fromMap(Map<String, dynamic> map) {
    return ForecastModel(
      weather: map['weather'] as String,
      temperature: map['temperature'] as int,
      wind: map['wind'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory ForecastModel.fromJson(String source) =>
      ForecastModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ForecastModel(weather: $weather, temperature: $temperature, wind: $wind)';

  @override
  bool operator ==(covariant ForecastModel other) {
    if (identical(this, other)) return true;

    return other.weather == weather &&
        other.temperature == temperature &&
        other.wind == wind;
  }

  @override
  int get hashCode => weather.hashCode ^ temperature.hashCode ^ wind.hashCode;
}
