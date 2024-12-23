import 'package:flutter/material.dart';
import 'package:money_flow/theme/custom_colors_theme.dart';

class NavigationScreen extends StatefulWidget {
  final IconData iconData;

  const NavigationScreen(this.iconData, {super.key});

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColorsTheme>()!;
    return Container(
      color: Theme.of(context).colorScheme.surface,
      child: ListView(
        children: [
          SizedBox(height: 64),
          Center(
              child: Icon(
            widget.iconData,
            color: colors.activeNavigationBarColor,
            size: 160,
          )),
        ],
      ),
    );
  }
}
