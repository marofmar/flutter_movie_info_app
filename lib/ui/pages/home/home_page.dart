import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('영화 목록')),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(10),
              height: 200,
              child: Row(
                children: [
                  AspectRatio(
                    aspectRatio: 2 / 3,
                    child: Image.network("https://picsum.photos/200/300",
                        fit: BoxFit.cover),
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('제목'),
                      Text('개봉일'),
                      Text('상영시간'),
                      Text('감독'),
                      Text('배우'),
                    ],
                  )),
                ],
              ),
            );
          }),
    );
  }
}
