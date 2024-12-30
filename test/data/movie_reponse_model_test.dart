import 'package:flutter_test/flutter_test.dart';
import 'package:movie_info_app/data/dto/movie_response_model.dart';

void main() {
  group(
    'MovieResponseModel test',
    () {
      final mockJson = {
        "adult": false,
        "backdrop_path": "/tElnmtQ6yz1PjN1kePNl8yMSb59.jpg",
        "genre_ids": [16, 12, 10751, 35],
        "id": 1241982,
        "original_language": "en",
        "original_title": "Moana 2",
        "overview":
            "After receiving an unexpected call from her wayfinding ancestors, Moana journeys alongside Maui and a new crew to the far seas of Oceania and into dangerous, long-lost waters for an adventure unlike anything she's ever faced.",
        "popularity": 3081.616,
        "poster_path": "/m0SbwFNCa9epW1X60deLqTHiP7x.jpg",
        "release_date": "2024-11-21",
        "title": "Moana 2",
        "video": false,
        "vote_average": 6.969,
        "vote_count": 645
      };

      test('fromJson() should parse JSON correctly', () {
        final movie = MovieResponseModel.fromJson(mockJson);
        expect(movie.id, 1241982);
        expect(movie.title, 'Moana 2');
        expect(movie.posterPath, '/m0SbwFNCa9epW1X60deLqTHiP7x.jpg');
      });

      test('toEntity() should convert to MovieEntity correctly', () {
        final movie = MovieResponseModel.fromJson(mockJson);
        final entity = movie.toEntity();
        expect(entity.id, 1241982);
        expect(entity.title, 'Moana 2');
        expect(entity.posterPath, '/m0SbwFNCa9epW1X60deLqTHiP7x.jpg');
      });
    },
  );
}
