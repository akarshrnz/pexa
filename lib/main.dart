import 'package:flutter/material.dart';
import 'package:pexa_carcare_test/core/AppRoutes.dart';
import 'package:pexa_carcare_test/core/navigation.service.dart';
import 'package:pexa_carcare_test/features/movie/data/movie_provider.dart';
import 'package:pexa_carcare_test/features/movie/repository/movie_repository.dart';
import 'package:provider/provider.dart';
import 'core/theme/theme_notifier.dart';
import 'features/home/presentation/home_screen.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeNotifier()),
       ChangeNotifierProvider(create: (_) => MovieProvider(MovieRepository())),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
                        navigatorKey: NavigationService.navigatorKey,

      debugShowCheckedModeBanner: false,
                        routes: appRoutes,

      title: 'My App',
      theme: themeNotifier.currentTheme,
      home: const HomeScreen(),
    );
  }
}
