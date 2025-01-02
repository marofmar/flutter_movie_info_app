import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  ApiConstants._(); // private constructor - 초기화 방지 cannot be initiated.
  // print(ApiConstants.apiKey) 이런식으로 사용
  // var api = ApiConstants(); 이런식으로 사용 불가
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static String apiKey = dotenv.env['TMDB_READ_ACCESS_TOKEN']!;
  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';
}
