
// ignore_for_file: deprecated_member_use

import 'package:covert_html_to_pdf/blocs/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../blocs/providers/weather_notifier.dart';
import '../../models/weather.dart';

class WeatherSearchPage extends StatefulWidget {
  const WeatherSearchPage({Key? key}) : super(key: key);

  @override
  State<WeatherSearchPage> createState() => _WeatherSearchPageState();
}

class _WeatherSearchPageState extends State<WeatherSearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather Search"),
      ),
      body: ProviderListener(
          onChange: (BuildContext context, previous, value) {  },
          provider: weatherNotifierProvider,
          child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          alignment: Alignment.center,
            child: Consumer(builder: (context, WidgetRef ref, child) {
              final state = ref.watch(weatherNotifierProvider);
              if (state is WeatherInitial) {
                return buildInitialInput();
              } else if (state is WeatherLoading) {
                return buildLoading();
              } else if (state is WeatherLoaded) {
                return buildColumnWithData(state.weather);
              } else {
                return buildInitialInput();
              }
            },
            ),
          ),
      ),
    );
  }

  Widget buildInitialInput() {
    return const Center(
      child: CityInputField(),
    );
  }

  Widget buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Column buildColumnWithData(Weather weather) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          weather.cityName,
          style: const TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          // Display the temperature with 1 decimal place
          "${weather.temperatureCelsius.toStringAsFixed(1)} °C",
          style: const TextStyle(fontSize: 80),
        ),
        const CityInputField(),
      ],
    );
  }
}

class CityInputField extends ConsumerWidget {
  const CityInputField({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextField(
        onSubmitted: (value) => submitCityName(ref, value),
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          hintText: "Enter a city",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          suffixIcon: const Icon(Icons.search),
        ),
      ),
    );
  }

  void submitCityName(WidgetRef ref, String cityName) {
    ref.read(weatherNotifierProvider.notifier).getWeather(cityName);
  }
}







