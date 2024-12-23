import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money_flow/modules/menu/bottom_navigator_bar.dart';
import 'package:money_flow/routes.dart';
import 'package:money_flow/theme/app_theme.dart';

// A Counter example implemented with riverpod

void main() {
  runApp(
    // Adding ProviderScope enables Riverpod for the entire project
    const ProviderScope(child: MyApp()),
  );
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  String? _token;
  late Stream<String> _tokenStream;
  Route<dynamic> _onGenerateRoute(RouteSettings settings) {
    final PageContentBuilder? pageContentBuilder = routes[settings.name];
    if (pageContentBuilder != null) {
      return MaterialPageRoute<dynamic>(
          builder: (context) => settings.arguments != null
              ? pageContentBuilder(settings.arguments)
              : pageContentBuilder());
    }
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        body: Container(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
              textScaler: const TextScaler.linear(1), devicePixelRatio: 3),
          child: child!,
        );
      },
      debugShowCheckedModeBanner: false,
      title: 'Money Flow',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      darkTheme: AppTheme.get(isLight: false),
      home: BottomNavigatorBar(),
      // We use routeName so that we dont need to remember the name SignInScreen
      // initialRoute: SplashScreen.routeName,
      // initialRoute: Home.routeName,
      onGenerateRoute: _onGenerateRoute,
      // routes: routes,
    );
  }
}
