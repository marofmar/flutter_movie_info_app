import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:movie_info_app/data/core/api_client.dart';
import 'package:movie_info_app/data/data_source/movie_remote_data_source_impl.dart';
import 'package:movie_info_app/data/dto/movie_response_model.dart';

void main() async {
  await dotenv.load(fileName: "/Users/yujinchung/Projects/movie_info_app/.env");
  late ApiClient apiClient;
  late MovieRemoteDataSourceImpl dataSource;

  setUp(() {
    apiClient = ApiClient(Client());
    dataSource = MovieRemoteDataSourceImpl(apiClient);
  });

  group('Integration test', () {
    test('getPlayingNow fetches movies successfully', () async {
      final result =
          await dataSource.getPlayingNow(); // List<MovieResponseModel>
      expect(result, isNotNull);
      expect(result, isA<List<MovieResponseModel>>());
      expect(result.length, greaterThan(0));

      final first = result.first;
      print('First Now playing: ${first.title}');
      expect(first.title, isNotEmpty);
    });

    test('getPopular fetches movies successfully', () async {
      final result = await dataSource.getPopular();
      expect(result, isNotNull);
      expect(result, isA<List<MovieResponseModel>>());
      expect(result.length, greaterThan(0));

      final first = result.first;
      print('First popular: ${first.title}');
      expect(first.title, isNotEmpty);
    });

    test('getPopular fetches movies successfully', () async {
      final result = await dataSource.getTopRated();
      expect(result, isNotNull);
      expect(result, isA<List<MovieResponseModel>>());
      expect(result.length, greaterThan(0));

      final first = result.first;
      print('First top rated: ${first.title}');
      expect(first.title, isNotEmpty);
    });

    test('getPopular fetches movies successfully', () async {
      final result = await dataSource.getUpcoming();
      expect(result, isNotNull);
      expect(result, isA<List<MovieResponseModel>>());
      expect(result.length, greaterThan(0));

      final first = result.first;
      print('First Upcoming: ${first.title}');
      expect(first.title, isNotEmpty);
    });

    test('getMovieDetail fetches movies details successfully', () async {
      final movieId = 123; // the lord of the rings
      final result = await dataSource.getMovieDetail(movieId);

      print('movie detail title: ${result.title}');
      expect(result.title, isNotEmpty);
      expect(result.overview, isNotEmpty);
    });
  });
}
