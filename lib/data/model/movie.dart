class Movie {
  final String title; // 영화 제목
  final String releaseDate; // 개봉일
  final String tagLine; // 줄거리
  final int runTime; // 상영시간
  final String posterPath; // 포스터 경로
  final String overview; // 영화설명
  final double voteAverage; // 평점
  final int voteCount; // 평점투표수
  final int popularity; // 인기점수
  final int revenue; // 수익
  final int budget; // 예산
  final String originalLanguage; // 원어
  final String originalTitle; // 원제
  final String backdropPath; // 배경 이미지 경로
  final bool adult; // 성인 여부
  final String genre; // 장르
  final List<String> productionCompanies; // 제작사

  Movie(
      {required this.title,
      required this.releaseDate,
      required this.tagLine,
      required this.runTime,
      required this.posterPath,
      required this.overview,
      required this.voteAverage,
      required this.voteCount,
      required this.popularity,
      required this.revenue,
      required this.budget,
      required this.originalLanguage,
      required this.originalTitle,
      required this.backdropPath,
      required this.adult,
      required this.genre,
      required this.productionCompanies});
}

Movie.fromJson(Map<String, dynamic> json) {
  return Movie(
    title: json['title'],
    releaseDate: json['release_date'],
    tagLine: json['tagline'],
    runTime: json['runtime'],
    posterPath: json['poster_path'],
    overview: json['overview'],
    voteAverage: json['vote_average'],
    voteCount: json['vote_count'],
    popularity: json['popularity'],
    revenue: json['revenue'],
    budget: json['budget'],
  );
}
