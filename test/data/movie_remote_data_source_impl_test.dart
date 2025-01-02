import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_info_app/data/core/api_client.dart';
import 'package:movie_info_app/data/data_source/movie_remote_data_source_impl.dart';
import 'package:movie_info_app/data/dto/movie_detail_model.dart';
import 'package:movie_info_app/data/dto/movie_response_model.dart';

class MockApiClient extends Mock implements ApiClient {}

void main() {
  late MovieRemoteDataSourceImpl dataSource;
  late MockApiClient mockApiClient;

  setUp(() {
    mockApiClient = MockApiClient();
    dataSource = MovieRemoteDataSourceImpl(mockApiClient);
  });

  final tMovieResponse = {
    'results': [
      {
        "id": 123, //
        "title": "The Lord of the Rings",
        "overview": "A story about a powerful ring.",
        "poster_path": "/poster.jpg",
        "release_date": "2001-12-19",
        "budget": 93000000,
        "revenue": 871368364,
        "runtime": 178,
        "vote_average": 8.8,
        "vote_count": 17000,
        "genres": [
          {"id": 12, "name": "Adventure"},
          {"id": 14, "name": "Fantasy"}
        ],
        "production_companies": [
          {"id": 1, "logo_path": "/logo1.png", "name": "New Line Cinema"}
        ]
      }
    ]
  };

  group('MovieRemoteDataSource', () {
    test('getPlayingNow returns list of movies', () async {
      // Arrange
      when(() => mockApiClient.get('/movie/now_playing'))
          .thenAnswer((_) async => tMovieResponse);

      // Act
      final result = await dataSource.getPlayingNow();

      // Assert
      expect(result, isA<List<MovieResponseModel>>());
      expect(result.length, 1);
      //expect(result.first.title, 'Test Movie');
      verify(() => mockApiClient.get('/movie/now_playing')).called(1);
    });

    test('getPopular returns list of movies', () async {
      // Arrange
      when(() => mockApiClient.get('/movie/popular'))
          .thenAnswer((_) async => tMovieResponse);

      // Act
      final result = await dataSource.getPopular();

      // Assert
      expect(result, isA<List<MovieResponseModel>>());
      expect(result.length, 1);
      verify(() => mockApiClient.get('/movie/popular')).called(1);
    });

    test('getTopRated returns list of movies', () async {
      // Arrange
      when(() => mockApiClient.get('/movie/top_rated'))
          .thenAnswer((_) async => tMovieResponse);

      // Act
      final result = await dataSource.getTopRated();

      // Assert
      expect(result, isA<List<MovieResponseModel>>());
      expect(result.length, 1);
      verify(() => mockApiClient.get('/movie/top_rated')).called(1);
    });

    test('getUpcoming returns list of movies', () async {
      // Arrange
      when(() => mockApiClient.get('/movie/upcoming'))
          .thenAnswer((_) async => tMovieResponse);

      // Act
      final result = await dataSource.getUpcoming();

      // Assert
      expect(result, isA<List<MovieResponseModel>>());
      expect(result.length, 1);
      verify(() => mockApiClient.get('/movie/upcoming')).called(1);
    });

    test('getMovieDetail returns movieDetailModel', () async {
      const movieId = 123;
      when(() => mockApiClient.get('/movie/${movieId}'))
          .thenAnswer((_) async => tMovieResponse);

      // Act
      final result = await dataSource.getMovieDetail(movieId);
      print(result); // Instance of movie detail model
      // Assert
      expect(result, isA<MovieDetailModel>());

      verify(() => mockApiClient.get('/movie/${movieId}')).called(1);
    });
  });
}
