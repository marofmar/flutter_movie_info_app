import 'package:movie_info_app/data/dto/movie_detail_model.dart';
import 'package:movie_info_app/data/dto/movie_response_model.dart';

abstract interface class MovieRemoteDataSource {
  Future<List<MovieResponseModel>> getPlayingNow();
  Future<List<MovieResponseModel>> getPopular();
  Future<List<MovieResponseModel>> getTopRated();
  Future<List<MovieResponseModel>> getUpcoming();
  Future<MovieDetailModel> getMovieDetail(int movieId);
}
