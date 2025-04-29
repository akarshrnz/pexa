
import 'package:flutter/material.dart';
import 'package:pexa_carcare_test/features/counter/presentation/counter_screen.dart';
import 'package:pexa_carcare_test/features/country_search.dart/presentation/country_search_screen.dart';
import 'package:pexa_carcare_test/features/movie/presentation/movie_screen.dart';
import 'package:pexa_carcare_test/features/profile/presentation/profile_screen.dart';

String pathToProfile = '/Profile';
String pathToPost = '/post';
String pathToCounter = '/Counter';
String pathToCountrySearch = '/CountrySearchScreen';


final appRoutes = <String, WidgetBuilder>{
  pathToProfile: (context) => const ProfileScreen(),
  pathToPost: (context) => const MovieListScreen(),
  pathToCounter: (context) => const CounterScreen(),
  pathToCountrySearch: (context) => const CountrySearchScreen(),
 

};
