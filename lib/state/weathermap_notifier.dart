// lib/state/weathermap_notifier.dart

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_api_retrofit/models/city_weather.dart';
import 'package:web_api_retrofit/api/openweathermap/repositories/weathermap_repository.dart';

// 生成ファイル名
part 'weathermap_notifier.g.dart';

@riverpod
class WeathermapNotifier extends _$WeathermapNotifier {
  late final WeathermapRepository weathermapRepository;
  // 型は自作CityWeatherクラスを指定している
  @override
  Future<CityWeather> build() async {
    weathermapRepository = WeathermapRepositoryImpl();
    // 初期値は東京タワーの緯度・経度にしている．
    return await weathermapRepository.fetchData(
        lat: 35.6579781, lon: 139.7433048);
  }

  // 状態を変更するコード
  void updateState({required double lat_in, required double lon_in}) async {
    // 状態をloadingに上書き
    state = const AsyncValue.loading();

    // 緯度・経度を変更
    final data = await weathermapRepository.fetchData(lat: lat_in, lon: lon_in);

    // データを上書き
    state = AsyncValue.data(data);
  }
}
