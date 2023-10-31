// lib/api/openweathermap/repositories/weathermap_repository.dart
import 'package:dio/dio.dart';
import 'package:web_api_retrofit/api/openweathermap/clients/weathermap_client.dart';
import 'package:web_api_retrofit/env/env.dart';
import 'package:web_api_retrofit/models/city_weather.dart';

// DI用に抽象クラスを作成する．
abstract class WeathermapRepository {
  Future<CityWeather> fetchData({
    // 必須引数
    required double lat,
    required double lon,
    // オプション引数
    String? units,
    String? lang,
  });
}

// Repositoryの実装
class WeathermapRepositoryImpl implements WeathermapRepository {
  final WeathermapClient _client;
  // 引数にclientを指定してシングル・インスタンスに出来る．
  WeathermapRepositoryImpl([WeathermapClient? client])
      : _client = client ?? WeathermapClient(Dio());

  @override
  // APIを呼び出してデータを持ってくる関数
  Future<CityWeather> fetchData({
    // 必須引数
    required double lat,
    required double lon,
    // 初期値ありオプション引数
    String? units = 'metric',
    String? lang = 'ja',
  }) async {
    final CityWeather data =
        await _client.getCityWeather(lat, lon, Env.key1, units!, lang!);
    return data;
  }
}

// とりあえずMockデータで動かしたいときの例
class WeathermapRepositoryMock implements WeathermapRepository {
  @override
  Future<CityWeather> fetchData({
    // 必須引数
    required double lat,
    required double lon,
    // オプション引数
    String? units,
    String? lang,
  }) async {
    const _weather =
        Weather(id: 0, main: "sunny", description: "ss", icon: "sun");
    const _main = Main(
        temp: 23.5,
        feels_like: 23.5,
        temp_min: 10.0,
        temp_max: 25.5,
        pressure: 1023,
        humidity: 50.2);
    const _cityweather = CityWeather(weather: [_weather], main: _main);
    return _cityweather;
  }
}
