// lib/pages/home/home_page_controller.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_api_retrofit/state/weathermap_notifier.dart';

void changeTokyo(WidgetRef ref) {
  // notifierを呼ぶ
  final notifier = ref.read(weathermapNotifierProvider.notifier);
  // データを変更
  notifier.updateState(lat_in: 35.6579781, lon_in: 139.7433048);
}

void changeRio(WidgetRef ref) {
  // notifierを呼ぶ
  final notifier = ref.read(weathermapNotifierProvider.notifier);
  // データを変更
  notifier.updateState(lat_in: -22.9023359, lon_in: -43.1795441);
}
