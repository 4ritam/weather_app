import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/controllers/weather.controller.dart';
import '../../models/weather.model.dart';
import 'widgets/widgets.dart';

class WeatherScreen extends ConsumerWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WeatherModel? _data;
    ref.watch(weatherDataStreamProvider).when(
          data: (data) {
            _data = data;
          },
          error: (error, stackTrace) {},
          loading: () {
            _data = null;
          },
        );
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.cyanAccent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
              icon: const Icon(
                Icons.menu,
              ),
              onPressed: () {},
            ),
          ],
          title: Row(
            children: [
              const Icon(Icons.pin_drop),
              const SizedBox(
                width: 8,
              ),
              _data != null ? Text(_data!.location!) : const Text("Loading"),
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Column(
                    children: [
                      Text(
                        _data != null
                            ? DateFormat('MMM d, E').format(DateTime.now())
                            : "--- --, ---",
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 40,
                          shadows: [
                            Shadow(
                              blurRadius: 5.0,
                              color: Colors.black54,
                              offset: Offset(
                                1.0,
                                1.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        _data != null
                            ? "Updated ${DateFormat('d/M/yyy h:mm a').format(_data!.lastUpdated!)}"
                            : "Updated --/--/-- --:-- --",
                        style: const TextStyle(
                          shadows: [
                            Shadow(
                              blurRadius: 8.0,
                              color: Colors.black54,
                              offset: Offset(
                                1.0,
                                2.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 2.5,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: WeatherInfo(
                    weatherCondition: _data != null ? _data!.condition! : null,
                    icon: _data != null ? _data!.conditionImage! : null,
                    temperature: _data != null ? _data!.temp! : null,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  const Spacer(
                    flex: 1,
                  ),
                  AdditionalInfoItem(
                    context: context,
                    info: "Humidity",
                    data:
                        "${_data != null ? _data!.humidity.toString() : "--"}%",
                    icon: Icons.water_drop_outlined,
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  AdditionalInfoItem(
                    context: context,
                    info: "Wind",
                    data:
                        "${_data != null ? _data!.wind.toString() : "--"}km/h",
                    icon: Icons.wind_power_outlined,
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  AdditionalInfoItem(
                    context: context,
                    info: "Feels Like",
                    data:
                        "${_data != null ? _data!.feelsLike!.round().toString() : "--"}°C",
                    icon: Icons.thermostat,
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Card(
                margin: const EdgeInsets.all(16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.0),
                ),
                color: const Color.fromARGB(59, 41, 41, 41),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: _data != null
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: _data!.forecast!.map((e) {
                            return SizedBox(
                              width: MediaQuery.of(context).size.width / 6,
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: DailyForecastItem(
                                  day: e.localTime!,
                                  icon: e.conditionImage!,
                                  temperature: e.temp!,
                                  wind: e.wind!,
                                ),
                              ),
                            );
                          }).toList())
                      : const Center(
                          child: CircularProgressIndicator.adaptive(),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
