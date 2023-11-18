import '../models/weather.model.dart';

final dummy = [
  Weather(
    name: "New York",
    lastUpdated: DateTime.parse("2023-11-15T12:00:00"),
    weather: "Cloudy",
    temperature: 20,
    feelsLike: 18,
    humidity: 75,
    wind: 10.5,
    forecast: [
      ForecastModel(weather: "Rain", temperature: 18, wind: 12.3),
      ForecastModel(weather: "Clear", temperature: 22, wind: 8.5),
      ForecastModel(weather: "Cloudy", temperature: 19, wind: 11.2),
      ForecastModel(weather: "Thunderstorm", temperature: 17, wind: 14.0),
    ],
  ),
  Weather(
    name: "London",
    lastUpdated: DateTime.parse("2023-11-15T12:00:00"),
    weather: "Rainy",
    temperature: 15,
    feelsLike: 13,
    humidity: 80,
    wind: 8.8,
    forecast: [
      ForecastModel(weather: "Clear", temperature: 14, wind: 7.2),
      ForecastModel(weather: "Cloudy", temperature: 16, wind: 9.0),
      ForecastModel(weather: "Rainy", temperature: 15, wind: 8.5),
      ForecastModel(weather: "Snow", temperature: 13, wind: 10.2),
    ],
  ),
  Weather(
    name: "Tokyo",
    lastUpdated: DateTime.parse("2023-11-15T12:00:00"),
    weather: "Sunny",
    temperature: 25,
    feelsLike: 27,
    humidity: 60,
    wind: 6.2,
    forecast: [
      ForecastModel(weather: "Clear", temperature: 26, wind: 5.5),
      ForecastModel(weather: "Partly Cloudy", temperature: 24, wind: 5.2),
      ForecastModel(weather: "Rainy", temperature: 23, wind: 7.0),
      ForecastModel(weather: "Thunderstorm", temperature: 25, wind: 6.5),
    ],
  ),
];
