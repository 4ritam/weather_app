import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/controllers/weather.controller.dart';

import '../../models/weather.model.dart';

class LocationListScreen extends ConsumerWidget {
  const LocationListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<WeatherModel> weatherData = [];

    final locations = ref.watch(weatherControllerProvider).location;

    ref.watch(weatherDataListStreamProvider).when(
      data: (data) {
        weatherData = data;
      },
      error: (error, stackTrace) {
        print(stackTrace);
      },
      loading: () {
        weatherData = [];
      },
    );
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text(
            "Location",
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.search_outlined))
          ],
        ),
        body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(child: ,);
          },
        ),
      ),
    );
  }
}
