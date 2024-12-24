import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money_flow/theme/custom_colors_theme.dart';

final counterProvider = StateProvider((ref) => 0);

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var widthS = MediaQuery.of(context).size.width;
    final colors = Theme.of(context).extension<CustomColorsTheme>()!;
    Widget item(String title, {isLine = true}) {
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
      // Consumer is a builder widget that allows you to read providers.
      child: Consumer(
        builder: (context, ref, _) {
          final count = ref.watch(counterProvider);
          return Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Colors.black54),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                item('VNINDEX'),
                item('HNXINDEX'),
                item('UPINDEX', isLine: false),
              ],
            ),
          );
        },
      ),
    );
  }
}
