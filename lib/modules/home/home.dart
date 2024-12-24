import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money_flow/repository/apis/api_home.dart';
import 'package:money_flow/repository/apis/http_manager.dart';
import 'package:money_flow/theme/custom_colors_theme.dart';

final dataProvider = FutureProvider((ref) async {
  final apihome = APIHOME(HTTPManager(Dio()));
  return await apihome.indicator({
    "indexIds": [
      "VNINDEX",
      "VN30",
      "HNX30",
      "VNXALL",
      "HNXIndex",
      "HNXUpcomIndex"
    ]
  });
});

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var widthS = MediaQuery.of(context).size.width;
    final colors = Theme.of(context).extension<CustomColorsTheme>()!;
    final data = ref.watch(dataProvider);

    Widget item(String title, String value, {isLine = true}) {
      return Container(
        width: widthS / 3 - 15,
        height: 50,
        decoration: isLine
            ? BoxDecoration(
                border: Border(
                  right: BorderSide(
                      color: colors.characterColor,
                      width: 0.5), // Màu cho cạnh trái
                ),
              )
            : null,
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(color: colors.characterColor),
            ),
            Text(
              '200',
              style: TextStyle(
                  color: colors.characterColor, fontWeight: FontWeight.w700),
            )
          ],
        ),
      );
    }

    return Center(
      child: data.when(
        data: (data) {
          return Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: Colors.black54,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                item('VNINDEX', ''),
                item('HNXINDEX', ''),
                item('UPINDEX', '', isLine: false),
              ],
            ),
          );
        },
        loading: () => const CircularProgressIndicator(),
        error: (err, _) => Text('Lỗi: $err'),
      ),
    );
  }
}
