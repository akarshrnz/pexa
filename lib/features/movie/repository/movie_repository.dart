import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pexa_carcare_test/core/api_constants.dart';
import '../model/movie_model.dart';

class MovieRepository {
 // Replace with your actual key

  Future<List<MovieModel>> fetchPopularMovies() async {
    final url = Uri.parse(ApiConstants.popularMoviesPath);

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List results = data['results'] ?? [];
        return results.map((json) => MovieModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load movies');
      }
    } catch (e) {
      throw Exception('Error fetching movies: $e');
    }
  }
}
