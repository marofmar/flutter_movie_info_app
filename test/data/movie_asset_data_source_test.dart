import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_info_app/data/data_source/movie_asset_data_source_impl.dart';

class MockAssetBundle extends Mock implements AssetBundle {}

void main() {
  //
  late MockAssetBundle mockAssetBundle; // nullable
  late MovieAssetDataSourceImpl dataSource;

  setUp(() {
    // 본격 실행 전 세팅할 것들
    mockAssetBundle = MockAssetBundle();
    dataSource = MovieAssetDataSourceImpl(mockAssetBundle);
  });

  test('MovieAssetDataSourceImple: fetchMovies return data test', () async {
    //
    when(
      () {
        // 어떠한 상황이 발생했을 때
        return mockAssetBundle.loadString(any());
      },
    ).thenAnswer(
        // 이렇게 리턴하시오.
        (_) async => """
  [{
    "title": "The Avengers",
    "released": "04 May 2012",
    "runtime": "143 min",
    "director": "Joss Whedon",
    "actors": "Robert Downey Jr., Chris Evans, Mark Ruffalo, Chris Hemsworth",
    "poster": "https://ia.media-imdb.com/images/M/MV5BMTk2NTI1MTU4N15BMl5BanBnXkFtZTcwODg0OTY0Nw@@._V1_SX300.jpg"
  }]
 """);
    final results = await dataSource!.fetchMovies();
    expect(results.length, 1);
  });
}
