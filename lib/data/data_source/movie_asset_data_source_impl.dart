import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:movie_info_app/data/data_source/movie_data_source.dart';
import 'package:movie_info_app/data/dto/movie_dto.dart';

class MovieAssetDataSourceImpl implements MovieDataSource {
  MovieAssetDataSourceImpl(this._assetBundle);
  final AssetBundle
      _assetBundle; // 여기에 가짜 데이터 넣어서 테스트도 할 수 있다, flutter pub add -d mocktail
  @override
  Future<List<MovieDto>> fetchMovies() async {
    final jsonString =
        await _assetBundle.loadString("assets/movies.json"); // json 을 읽는다.
    final list = jsonDecode(jsonString);
    return List.from(list).map((e) => MovieDto.fromJson(e)).toList();
  }
}
