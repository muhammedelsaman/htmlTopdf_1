import 'package:covert_html_to_pdf/models/weather.dart';
import 'package:covert_html_to_pdf/repositories/weather_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final weatherRepositoryProvider = Provider<WeatherRepository>(
        (ref) => FakeWeatherRepository());

final weatherNotifierProvider = StateNotifierProvider(
    (ref) => WeatherNotifier(ref.watch(weatherRepositoryProvider))
);
