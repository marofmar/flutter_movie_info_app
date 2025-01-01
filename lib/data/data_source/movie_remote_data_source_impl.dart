import 'dart:convert';

import 'package:movie_info_app/data/dto/movie_detail_model.dart';
import 'package:movie_info_app/data/core/api_client.dart';
import 'package:movie_info_app/data/data_source/movie_remote_data_source.dart';
import 'package:movie_info_app/data/dto/movie_response_model.dart';
import 'package:movie_info_app/data/dto/movies_result_model.dart';

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final ApiClient _client;
  MovieRemoteDataSourceImpl(this._client);

  @override
  Future<List<MovieResponseModel>> getPlayingNow() async {
    final response = await _client.get("/movie/now_playing");
    final movies = MoviesResultModel.fromJson(response).movies;
    print('nowPlaying: $movies?,length');
    print(jsonEncode(movies));
    return movies ?? [];
  }

  @override
  Future<List<MovieResponseModel>> getPopular() async {
    final response = await _client.get("/movie/popular");
    final movies = MoviesResultModel.fromJson(response).movies;
    return movies ?? [];
  }

  @override
  Future<List<MovieResponseModel>> getTopRated() async {
    final response = await _client.get("/movie/top_rated");
    final movies = MoviesResultModel.fromJson(response).movies;
    return movies ?? [];
  }

  @override
  Future<List<MovieResponseModel>> getUpcoming() async {
    final response = await _client.get("/movie/upcoming");
    final movies = MoviesResultModel.fromJson(response).movies;
    return movies ?? [];
  }

  @override
  Future<MovieDetailModel> getMovieDetail(int movieId) async {
    final response = await _client.get("/movie/$movieId");
    return MovieDetailModel.fromJson(response);
  }
}
