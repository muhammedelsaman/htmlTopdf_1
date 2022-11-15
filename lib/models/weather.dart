
import 'package:covert_html_to_pdf/blocs/providers/weather_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositories/weather_repository.dart';

class Weather {
  final String cityName;
  final double temperatureCelsius;

  Weather({
    required this.cityName,
    required this.temperatureCelsius,
  });

  @override
  //bool operator ==(Object o) {
    bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Weather &&
        other.cityName == cityName &&
        other.temperatureCelsius == temperatureCelsius;
  }

  @override
  int get hashCode => cityName.hashCode ^ temperatureCelsius.hashCode;
}

class WeatherError extends WeatherState {
  final String message;
   WeatherError(this.message);

  @override
  // bool operator ==(Object o) {
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WeatherError && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}


// Coll StateNotifier

class WeatherNotifier extends StateNotifier<WeatherState> {
  final WeatherRepository _weatherRepository;

  WeatherNotifier(this._weatherRepository) : super(WeatherInitial());

  Future<void> getWeather(String cityName) async {
    try {
      state = WeatherLoading();
      final weather = await _weatherRepository.fetchWeather(cityName);
      state = WeatherLoaded(weather);
    } on NetworkException {
      state = WeatherError("Couldn't fetch weather. Is the device online?");
    }
  }
}