// lib/pages/home/home_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_api_retrofit/pages/home/home_page_controller.dart';
import 'package:web_api_retrofit/state/weathermap_notifier.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Weather map API')),
      body: Center(child: WeatherWidget()),
    );
  }
}

class WeatherWidget extends ConsumerWidget {
  const WeatherWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // providerを指定して状態を監視する．
    final weather = ref.watch(weathermapNotifierProvider);
    // AsyncValue
    final weather_text = weather.when(
      loading: () => const Text('準備中...'),
      error: (e, s) => Text('エラー $e'),
      data: (d) => Text('${d.weather[0].main}: ${d.main.temp}[℃]'),
    );
    // 更新ボタン
    final TokyoButton = ElevatedButton(
      onPressed: () {
        changeTokyo(ref);
      },
      child: const Text('東京'),
    );
    final RioButton = ElevatedButton(
      onPressed: () {
        changeRio(ref);
      },
      child: const Text('リオデジャネイロ'),
    );
    // 並べる
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        weather_text,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [TokyoButton, RioButton],
        )
      ],
    );
  }
}
