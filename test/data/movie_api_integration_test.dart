import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:movie_info_app/data/core/api_client.dart';
import 'package:movie_info_app/data/data_source/movie_remote_data_source_impl.dart';
import 'package:movie_info_app/data/dto/movie_response_model.dart';
import 'package:movie_info_app/data/dto/movies_result_model.dart';

void main() {
  late ApiClient apiClient;
  late MovieRemoteDataSourceImpl dataSource;

  setUp(() {
    apiClient = ApiClient(Client());
    dataSource = MovieRemoteDataSourceImpl(apiClient);
  });

  group('Integration test', () {
    test('getPlayingNow fetches movies successfully', () async {
      final result = await apiClient.get('/movie/now_playing');
      expect(result, isNotNull);
      expect(result, isA<Map<String, dynamic>>());

      final moviesResult = MoviesResultModel.fromJson(result);
      expect(moviesResult.movies, isNotNull);
      expect(moviesResult.movies, isA<List<MovieResponseModel>>());
      expect(moviesResult.movies!.length, greaterThan(0));
    });
  });
}
