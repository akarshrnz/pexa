import 'package:flutter/material.dart';
import '../model/movie_model.dart';
import '../repository/movie_repository.dart';

class MovieProvider with ChangeNotifier {
  final MovieRepository _repository;

  MovieProvider(this._repository);

  List<MovieModel> _movies = [];
  bool _isLoading = false;

  List<MovieModel> get movies => _movies;
  bool get isLoading => _isLoading;

  Future<void> fetchPopularMovies() async {
    _isLoading = true;
    notifyListeners();

    try {
      final data = await _repository.fetchPopularMovies();
      _movies = [];
      _movies = data;
    } catch (e) {
      print("error is $e");
      _movies = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
