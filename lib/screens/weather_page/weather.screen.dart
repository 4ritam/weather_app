import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:video_player/video_player.dart';
import 'package:weather_app/controllers/weather.controller.dart';

import 'widgets/widgets.dart';

class WeatherScreen extends ConsumerStatefulWidget {
  const WeatherScreen({super.key});

  @override
  ConsumerState<WeatherScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<WeatherScreen> {
  late VideoPlayerController _controller;
  int i = 0;
  @override
  void initState() {
    _controller = VideoPlayerController.asset("assets/cloudy.mp4");
    _controller.initialize().then((_) {
      _controller.setLooping(true);
      setState(() {
        _controller.play();
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final weatherController = ref.watch(weatherControllerProvider);
    return SafeArea(
      child: Stack(
        children: [
          SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: _controller.value.size.width,
                height: _controller.value.size.height,
                child: VideoPlayer(_controller),
              ),
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: Row(children: [
                const Icon(Icons.pin_drop),
                const SizedBox(
                  width: 8,
                ),
                Text(weatherController.screenData!.name),
              ]),
            ),
            body: Column(
              children: [
                const Spacer(
                  flex: 3,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Column(
                      children: [
                        Text(
                          DateFormat('MMM d, E').format(DateTime.now()),
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
                          "Updated ${DateFormat('d/M/yyy h:mm a').format(weatherController.screenData!.lastUpdated)}",
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
                const Spacer(
                  flex: 2,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 3.5,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: WeatherInfo(
                      weatherCondition: weatherController.screenData!.weather,
                      icon: Icons.cloud,
                      temperature:
                          weatherController.screenData!.temperature.toString(),
                    ),
                  ),
                ),
                const Spacer(
                  flex: 2,
                ),
                Row(
                  children: [
                    const Spacer(
                      flex: 1,
                    ),
                    AdditionalInfoItem(
                      context: context,
                      info: "Humidity",
                      data:
                          "${weatherController.screenData!.humidity.toString()}%",
                      icon: Icons.water_drop_outlined,
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    AdditionalInfoItem(
                      context: context,
                      info: "Wind",
                      data:
                          "${weatherController.screenData!.wind.toString()}km/h",
                      icon: Icons.wind_power_outlined,
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    AdditionalInfoItem(
                      context: context,
                      info: "Feels Like",
                      data:
                          "${weatherController.screenData!.feelsLike.toString()}°C",
                      icon: Icons.thermostat,
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                  ],
                ),
                const Spacer(
                  flex: 1,
                ),
              ],
            ),
            bottomNavigationBar: Card(
              margin: const EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.0),
              ),
              color: const Color.fromARGB(59, 41, 41, 41),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: weatherController.screenData!.forecast.map((e) {
                    i++;
                    return SizedBox(
                      width: MediaQuery.of(context).size.width / 8,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: DailyForecastItem(
                          day: DateUtils.addDaysToDate(DateTime.now(), i),
                          icon: Icons.sunny,
                          temperature: e.temperature,
                          wind: e.wind,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
