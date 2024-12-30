// ViewModel에서 직접 객체 생성하지 않을 수 있게
// UseCase 공급해주는 Provider 생성
// ViewModel 내에서는 Provider에 의해 UseCase 공급받음.

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:movie_info_app/data/core/api_client.dart';
import 'package:movie_info_app/data/data_source/movie_remote_data_source.dart';
import 'package:movie_info_app/data/data_source/movie_remote_data_source_impl.dart';
import 'package:movie_info_app/data/repository/movie_repository_impl.dart';
import 'package:movie_info_app/domain/repository/movie_repository.dart';
import 'package:movie_info_app/domain/usecase/get_playing_now.dart';

final apiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient(Client());
});

final movieRemoteDataSourceProvider = Provider<MovieRemoteDataSource>((ref) {
  final client = ref.watch(apiClientProvider);
  return MovieRemoteDataSourceImpl(client);
});

final movieRepositoryProvider = Provider<MovieRepository>(
  (ref) {
    final dataSource = ref.watch(movieRemoteDataSourceProvider);
    return MovieRepositoryImpl(dataSource);
  },
);

final getPlayingNowUsecaseProvider = Provider<GetPlayingNow>(
  (ref) {
    final movieRepo = ref.watch(movieRepositoryProvider);
    return GetPlayingNow(movieRepo);
  },
);
