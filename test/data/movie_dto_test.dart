import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:movie_info_app/data/dto/movie_dto.dart';

void main() {
  test('movie dto: fromJson test', () {
    const sampleJasonString = """
  {
    "title": "Avatar",
    "released": "18 Dec 2009",
    "runtime": "162 min",
    "director": "James Cameron",
    "actors": "Sam Worthington, Zoe Saldana, Sigourney Weaver, Stephen Lang",
    "poster": "https://ia.media-imdb.com/images/M/MV5BMTYwOTEwNjAzMl5BMl5BanBnXkFtZTcwODc5MTUwMw@@._V1_SX300.jpg",
    "imdbRating": "7.9"
  }
""";

    final map = jsonDecode(sampleJasonString);
    final movieDto = MovieDto.fromJson(map);
    expect(movieDto.title, "Avatar");
  });
}
