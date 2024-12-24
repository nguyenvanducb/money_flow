import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateProvider((ref) => 0);

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var widthS = MediaQuery.of(context).size.width;
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
                SizedBox(
                  width: widthS / 3 - 15,
                  child: Text('VNINDEX'),
                ),
                SizedBox(
                  width: widthS / 3 - 15,
                  child: Text('HNXINDEX'),
                ),
                SizedBox(
                  width: widthS / 3 - 15,
                  child: Text('UPINDEX'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
