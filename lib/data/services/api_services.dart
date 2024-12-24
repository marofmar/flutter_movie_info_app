import 'dart:convert';

import 'package:movie_info_app/data/model/movie.dart';

class ApiServices {
  final String apiKey;
  final String baseUrl = 'https://api.themoviedb.org';

  ApiServices({required this.apiKey});

  get http => null;

  Future<List<Movie>> getMovies() async {
    final response =
        await http.get(Uri.parse('$baseUrl/movie/popular?api_key=$apiKey'));
    if (response.statusCode == 200) {
      final List<dynamic> json = jsonDecode(response.body);
      return json.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
