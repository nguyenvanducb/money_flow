import 'package:flutter/material.dart';
import 'package:money_flow/modules/menu/bottom_navigator_bar.dart';

typedef PageContentBuilder = Widget Function([dynamic arguments]);

final Map<String, PageContentBuilder> routes = {
  BottomNavigatorBar.routeName: ([Object? arguments]) =>
      const BottomNavigatorBar(),
};
