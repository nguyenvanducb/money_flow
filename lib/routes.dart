import 'package:flutter/material.dart';
import 'package:money_flow/modules/home/home.dart';

typedef PageContentBuilder = Widget Function([dynamic arguments]);

final Map<String, PageContentBuilder> routes = {
  Home.routeName: ([Object? arguments]) => const Home(),
};
