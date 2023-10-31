// lib/models/city_weather.dart
import 'package:freezed_annotation/freezed_annotation.dart';
part 'city_weather.freezed.dart';
part 'city_weather.g.dart';

// TODO: JSONの構造をもとにmodelを作成
@freezed
class CityWeather with _$CityWeather {
  const factory CityWeather({
    required List<Weather> weather,
    required Main main,
  }) = _CityWeather;
  factory CityWeather.fromJson(Map<String, dynamic> json) =>
      _$CityWeatherFromJson(json);
}

@freezed
class Weather with _$Weather {
  const factory Weather({
    required int id,
    required String main,
    required String description,
    required String icon,
  }) = _Weather;
  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
}

@freezed
class Main with _$Main {
  const factory Main({
    required double temp,
    required double feels_like,
    required double temp_min,
    required double temp_max,
    required double pressure,
    required double humidity,
    // required double sea_level,  // この2つは場所によって
    // required double grnd_level, // 返されないので除外している．
  }) = _Main;
  factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);
}
