import 'package:flutter_test/flutter_test.dart';
import 'package:movie_info_app/domain/entity/movie_detail_entity.dart';

void main() {
  group('MovieDetailEntity Tests', () {
    test('should create a valid MovieDetailEntity object', () {
      // Arrange
      const int budget = 1000000;
      const List<String> genres = ['Action', 'Drama'];
      const int id = 12345;
      const List<String> productionCompanyLogos = ['/logo1.png', '/logo2.png'];
      const String overview = 'A great movie about testing.';
      const double popularity = 85.5;
      final DateTime releaseDate = DateTime(2024, 12, 25);
      const int revenue = 5000000;
      const int runtime = 120;
      const String tagline = 'Testing is fun!';
      const String title = 'The Test Movie';
      const double voteAverage = 8.5;
      const int voteCount = 1500;

      // Act
      final movieDetailEntity = MovieDetailEntity(
        posterPath: '',
        budget: budget,
        genres: genres,
        id: id,
        productionCompanyLogos: productionCompanyLogos,
        overview: overview,
        popularity: popularity,
        releaseDate: releaseDate,
        revenue: revenue,
        runtime: runtime,
        tagline: tagline,
        title: title,
        voteAverage: voteAverage,
        voteCount: voteCount,
      );

      // Assert
      expect(movieDetailEntity.budget, budget);
      expect(movieDetailEntity.genres, genres);
      expect(movieDetailEntity.id, id);
      expect(movieDetailEntity.productionCompanyLogos, productionCompanyLogos);
      expect(movieDetailEntity.overview, overview);
      expect(movieDetailEntity.popularity, popularity);
      expect(movieDetailEntity.releaseDate, releaseDate);
      expect(movieDetailEntity.revenue, revenue);
      expect(movieDetailEntity.runtime, runtime);
      expect(movieDetailEntity.tagline, tagline);
      expect(movieDetailEntity.title, title);
      expect(movieDetailEntity.voteAverage, voteAverage);
      expect(movieDetailEntity.voteCount, voteCount);
    });

    test('should handle edge cases', () {
      // Arrange
      const int budget = 0;
      const List<String> genres = [];
      const int id = 0;
      const List<String> productionCompanyLogos = [];
      const String overview = '';
      const double popularity = 0.0;
      final DateTime releaseDate = DateTime(1970, 1, 1); // Default date
      const int revenue = 0;
      const int runtime = 0;
      const String tagline = '';
      const String title = '';
      const double voteAverage = 0.0;
      const int voteCount = 0;

      // Act
      final movieDetailEntity = MovieDetailEntity(
        posterPath: '',
        budget: budget,
        genres: genres,
        id: id,
        productionCompanyLogos: productionCompanyLogos,
        overview: overview,
        popularity: popularity,
        releaseDate: releaseDate,
        revenue: revenue,
        runtime: runtime,
        tagline: tagline,
        title: title,
        voteAverage: voteAverage,
        voteCount: voteCount,
      );

      // Assert
      expect(movieDetailEntity.budget, 0);
      expect(movieDetailEntity.genres, []);
      expect(movieDetailEntity.id, 0);
      expect(movieDetailEntity.productionCompanyLogos, []);
      expect(movieDetailEntity.overview, '');
      expect(movieDetailEntity.popularity, 0.0);
      expect(movieDetailEntity.releaseDate, releaseDate);
      expect(movieDetailEntity.revenue, 0);
      expect(movieDetailEntity.runtime, 0);
      expect(movieDetailEntity.tagline, '');
      expect(movieDetailEntity.title, '');
      expect(movieDetailEntity.voteAverage, 0.0);
      expect(movieDetailEntity.voteCount, 0);
    });
  });
}
