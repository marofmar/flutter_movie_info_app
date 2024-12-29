import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_info_app/presentation/pages/home/movie_list_view_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('영화 목록')),
      body: Consumer(builder: (context, ref, child) {
        final movieList = ref.watch(movieListViewModelProvider);

        return ListView.builder(
            itemCount: movieList.length,
            itemBuilder: (context, index) {
              final movie = movieList[index];

              return Container(
                padding: EdgeInsets.all(10),
                height: 200,
                child: Row(
                  children: [
                    AspectRatio(
                      aspectRatio: 2 / 3,
                      child: Image.network(movie.poster, fit: BoxFit.cover),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(movie.title),
                        Text(movie.released),
                        Text(movie.runtime),
                        Text(movie.director),
                        Text(movie.actors),
                      ],
                    )),
                  ],
                ),
              );
            });
      }),
    );
  }
}
