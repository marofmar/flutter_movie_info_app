import 'package:movie_info_app/data/dto/movie_response_model.dart';

class MoviesResultModel {
  List<MovieResponseModel>? movies;

  MoviesResultModel({
    this.movies,
  });

  MoviesResultModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      movies = <MovieResponseModel>[];
      json['results'].forEach((v) {
        movies!.add(MovieResponseModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (movies != null) {
      data['results'] = movies!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
