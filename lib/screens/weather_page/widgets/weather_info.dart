import 'package:flutter/material.dart';

class WeatherInfo extends StatelessWidget {
  final String weatherCondition;
  final IconData icon;
  final String temperature;
  const WeatherInfo({
    super.key,
    required this.weatherCondition,
    required this.icon,
    required this.temperature,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            icon,
            size: 48,
            shadows: const [
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
        Text(
          weatherCondition,
          style: const TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                blurRadius: 8.0,
                color: Colors.black54,
                offset: Offset(
                  2.0,
                  1.0,
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              temperature,
              style: const TextStyle(
                fontSize: 90,
                fontWeight: FontWeight.w500,
                shadows: [
                  Shadow(
                    blurRadius: 8.0,
                    color: Colors.black54,
                    offset: Offset(
                      2.0,
                      1.0,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 14),
              child: const Text(
                "°C",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      blurRadius: 5.0,
                      color: Colors.black54,
                      offset: Offset(
                        2.0,
                        2.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
