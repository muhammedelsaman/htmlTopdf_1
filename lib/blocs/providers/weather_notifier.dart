import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/weather.dart';
import '../../repositories/weather_repository.dart';

abstract class WeatherState {
  WeatherState();
}

class WeatherInitial extends WeatherState {

  WeatherInitial();
}

class WeatherLoading extends WeatherState {
   WeatherLoading();
}

class WeatherLoaded extends WeatherState {
  final Weather weather;
   WeatherLoaded(this.weather);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is WeatherLoaded && o.weather == weather;
  }

  @override
  int get hashCode => weather.hashCode;
}

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
