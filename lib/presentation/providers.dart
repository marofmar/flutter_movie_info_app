// ViewModel에서 직접 객체 생성하지 않을 수 있게
// UseCase 공급해주는 Provider 생성
// ViewModel 내에서는 Provider에 의해 UseCase 공급받음.

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_info_app/data/data_source/movie_asset_data_source_impl.dart';
import 'package:movie_info_app/data/data_source/movie_data_source.dart';
import 'package:movie_info_app/data/repository/movie_repository_impl.dart';
import 'package:movie_info_app/domain/usecase/fetch_movies_usecase.dart';

final _movieDataSourceProvider = Provider<MovieDataSource>((ref) {
  return MovieAssetDataSourceImpl(rootBundle);
});

final _movieRepositoryProvider = Provider(
  (ref) {
    final dataSource = ref.read(_movieDataSourceProvider);
    return MovieRepositoryImpl(dataSource);
  },
);

final fetchMoviesUsecaseProvider = Provider(
  (ref) {
    final movieRepo = ref.read(_movieRepositoryProvider);
    return FetchMoviesUsecase(movieRepo);
  },
);
