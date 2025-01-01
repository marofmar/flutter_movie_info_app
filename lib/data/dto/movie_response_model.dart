import 'package:movie_info_app/domain/entity/movie_entity.dart';

/*
    {
      "adult": false,
      "backdrop_path": "/euYIwmwkmz95mnXvufEmbL6ovhZ.jpg",
      "genre_ids": [
        28,
        12,
        18
      ],
      "id": 558449,
      "original_language": "en",
      "original_title": "Gladiator II",
      "overview": "Years after witnessing the death of the revered hero Maximus at the hands of his uncle, Lucius is forced to enter the Colosseum after his home is conquered by the tyrannical Emperors who now lead Rome with an iron fist. With rage in his heart and the future of the Empire at stake, Lucius must look to his past to find strength and honor to return the glory of Rome to its people.",
      "popularity": 5872.166,
      "poster_path": "/2cxhvwyEwRlysAmRH4iodkvo0z5.jpg",
      "release_date": "2024-11-05",
      "title": "Gladiator II",
      "video": false,
      "vote_average": 6.8,
      "vote_count": 1533
    },
*/
class MovieResponseModel {
  final int id;
  final String title;
  final String? posterPath;
  final String overview;
  final String releaseDate;
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  String? originalLanguage;
  String? originalTitle;
  double? popularity;
  bool? video;
  double? voteAverage;
  int? voteCount;

  MovieResponseModel({
    required this.id,
    required this.title,
    this.posterPath,
    required this.overview,
    required this.releaseDate,
  });

  factory MovieResponseModel.fromJson(Map<String, dynamic> json) {
    return MovieResponseModel(
      id: json['id'] is int ? json['id'] : int.parse(json['id'].toString()),
      title: json['title'] ?? '',
      posterPath: json['poster_path'],
      overview: json['overview'] ?? '',
      releaseDate: json['release_date'] ?? '',
    )
      ..adult = json['adult']
      ..backdropPath = json['backdrop_path']
      ..genreIds = (json['genre_ids'] as List?)?.map((e) => e as int).toList()
      ..originalLanguage = json['original_language']
      ..originalTitle = json['original_title']
      ..popularity = json['popularity']?.toDouble()
      ..video = json['video']
      ..voteAverage = json['vote_average']?.toDouble()
      ..voteCount = json['vote_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['adult'] = adult;
    data['backdrop_path'] = backdropPath;
    data['genre_ids'] = genreIds;
    data['id'] = id;
    data['original_language'] = originalLanguage;
    data['original_title'] = originalTitle;
    data['overview'] = overview;
    data['popularity'] = popularity;
    data['poster_path'] = posterPath;
    data['release_date'] = releaseDate;
    data['title'] = title;
    data['video'] = video;
    data['vote_average'] = voteAverage;
    data['vote_count'] = voteCount;
    return data;
  }

  MovieEntity toEntity() {
    return MovieEntity(
      id: id ?? 0,
      title: title ?? '',
      posterPath: posterPath ?? '',
    );
  }
}
