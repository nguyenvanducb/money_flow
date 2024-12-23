import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateProvider((ref) => 0);

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      // Consumer is a builder widget that allows you to read providers.
      child: Consumer(
        builder: (context, ref, _) {
          final count = ref.watch(counterProvider);
          return Text('$count');
        },
      ),
    );
  }
}
