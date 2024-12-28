// {
//   "title": "Avatar",
//   "released": "18 Dec 2009",
//   "runtime": "162 min",
//   "director": "James Cameron",
//   "actors": "Sam Worthington, Zoe Saldana, Sigourney Weaver, Stephen Lang",
//   "poster": "https://ia.media-imdb.com/images/M/MV5BMTYwOTEwNjAzMl5BMl5BanBnXkFtZTcwODc5MTUwMw@@._V1_SX300.jpg",
//   "imdbRating": "7.9"
// },

// moviedto 클래스 정의
class MovieDto {
  final String title;
  final String released;
  final String runtime;
  final String director;
  final String actors;
  final String poster;

  MovieDto({
    required this.title,
    required this.released,
    required this.runtime,
    required this.director,
    required this.actors,
    required this.poster,
  });

  // Json을 가지고 movieDtio를 만드는 함수
  MovieDto.fromJson(Map<String, dynamic> map)
      : this(
          title: map['title'],
          released: map['released'],
          runtime: map['runtime'],
          director: map['director'],
          actors: map['actors'],
          poster: map['poster'],
        );

  // MovieDto 오브젝트를 가지고 json을 만드는 함수
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'released': released,
      'runtime': runtime,
      'director': director,
      'actors': actors,
      'poster': poster,
    };
  }
}
