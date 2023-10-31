// lib/api/openweathermap/clients/weathermap_client.dart
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:web_api_retrofit/models/city_weather.dart';

// TODO: ファイル名変更
part 'weathermap_client.g.dart';

// TODO: baseUrlを変更
@RestApi(baseUrl: 'https://api.openweathermap.org/data/2.5')
abstract class WeathermapClient {
  // TODO: クラス・コンストラクタ名を変更
  factory WeathermapClient(Dio dio, {String baseUrl}) = _WeathermapClient;

  // TODO: リクエストメソッドを作成（複数作成可能）
  @GET('/weather') // 追加ヘッダ
  Future<CityWeather> getCityWeather(
    // クエリ
    @Query("lat") double lat,
    @Query("lon") double lon,
    @Query("appid") String appid,
    @Query("units") String units,
    @Query("lang") String lang,
  );
}
