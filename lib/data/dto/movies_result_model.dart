import 'package:movie_info_app/data/dto/movie_response_model.dart';

class MoviesResultModel {
  List<MovieResponseModel>? movies;

  MoviesResultModel({
    this.movies,
  });

  MoviesResultModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      movies = (json['results'] as List<dynamic>)
          .map((v) => MovieResponseModel.fromJson(v as Map<String, dynamic>))
          .toList();
    } else {
      movies = []; // initialize with empty list if results are null
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
