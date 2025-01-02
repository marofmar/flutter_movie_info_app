# Movie Info App

🐥 프로젝트 개요

Movie Info App은 Flutter와 Riverpod 상태 관리 라이브러리를 사용하여 영화 정보를 조회할 수 있는 모바일 애플리케이션입니다. 이 앱은 현재 상영 중인 영화, 인기 영화, 평점 높은 영화, 개봉 예정 영화 등의 정보를 제공하며, 각 영화의 상세 정보 페이지로 이동하여 추가 정보를 확인할 수 있습니다.

(현재 영어 버전만 지원 2025.01.02)

📸 앱 시연

![2025-01-02](assets/record2.gif)

🐣 주요 기능

1. 홈 화면

   다양한 섹션으로 영화 리스트를 분류하여 표시:

   현재 상영 중 (Now Playing)

   인기 순 (Popular)

   평점 높은 순 (Top Rated)

   개봉 예정 (Coming Soon)

   각 섹션은 가로 스크롤 방식으로 영화 포스터를 표시합니다.

   가장 인기 있는 영화를 큰 포스터로 강조.

2. 영화 상세 페이지

   영화 제목, 태그라인, 러닝타임, 개요, 그리고 포스터를 표시.

   Hero 애니메이션을 사용하여 영화 포스터 전환 시 시각적 효과 제공.

3. 다크 모드 및 라이트 모드

   앱 전역에서 테마 전환 가능.

   앱바에 다크 모드/라이트 모드 전환 버튼 제공.

🐣 기술 스택

    프로그래밍 언어: Dart

    프레임워크: Flutter

    상태 관리: Riverpod

    API 연동: HTTP 클라이언트를 사용하여 영화 데이터 API 호출

    디자인: Google Fonts, Hero Animation

🐣 프로젝트 구조

```
lib/
├── data/
│ ├── core/
│ │ ├── api_client.dart
│ │ ├── api_constants.dart
│ └── data_source/
│ ├── movie_remote_data_source.dart
│ ├── movie_remote_data_source_impl.dart
├── domain/
│ ├── entity/
│ │ ├── movie_entity.dart
│ │ └── movie_detail_entity.dart
│ ├── repository/
│ │ └── movie_repository.dart
│ ├── usecase/
│ ├── get_movie_detail.dart
│ ├── get_playing_now.dart
│ ├── get_popular.dart
│ ├── get_top_rated.dart
│ └── get_upcoming.dart
├── presentation/
│ ├── pages/
│ │ ├── home/
│ │ │ ├── home_page.dart
│ │ │ └── movie_list_view_model.dart
│ │ ├── detail/
│ │ ├── movie_detail_page.dart
│ │ └── movie_detail_view_model.dart
│ ├── widgets/
│ ├── common_app_bar.dart
│ ├── theme_notifier.dart
│ └── carousel.dart
├── main.dart
```

🐣 API 사용

- 영화 데이터 API: The Movie Database (TMDB)

- API Key 관리: .env 파일을 사용하여 민감한 정보 보호

🐣 주요 구현

1. 상태 관리 (State Management)

- Riverpod의 StateNotifier와 StateNotifierProvider를 사용하여 상태 관리 구현.

- MovieListNotifier와 MovieDetailNotifier로 영화 리스트 및 상세 정보를 각각 관리.

2. Hero 애니메이션

- 영화 포스터 전환 시 Hero 위젯을 사용하여 자연스러운 화면 전환 효과 구현.

3. 다크 모드 및 라이트 모드

- ThemeNotifier를 통해 테마 전환 로직 구현.

- MaterialApp의 theme 및 darkTheme를 활용하여 테마 적용.

4. 테스트

- API 연동 및 JSON 파싱 테스트.

- MovieDetailModel과 MovieDetailEntity 간의 변환 로직 테스트.

🐣 설치 및 실행

1. 의존성 설치

`flutter pub get`

2. .env 파일 생성

루트 디렉토리 위치에 .env 파일을 만들고, TMDB API 키를 추가합니다:

> .env.template 파일을 참조하세요. 아래와 같은 형식입니다.

```
# themoviedb.org에서 발급받은 api 키 정보를 입력하여 사용하세요.
TMDB_API_KEY=1234
TMDB_READ_ACCESS_TOKEN=1234
```


3. 애플리케이션 실행

`flutter run`

🐣 향후 개선 사항

검색 기능: 영화 검색 UI 및 API 연동 추가.

오프라인 지원: 영화 데이터를 로컬에 캐싱하여 네트워크가 없을 때도 사용 가능하게 구현.

테스트 확대: 위젯 및 통합 테스트 추가.
