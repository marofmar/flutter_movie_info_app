import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_info_app/presentation/widgets/theme_notifier.dart';
import 'package:movie_info_app/theme.dart';
import 'package:movie_info_app/presentation/pages/home/movie_list_page.dart';

void main() async {
  await dotenv.load(fileName: "/Users/yujinchung/Projects/movie_info_app/.env");
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeNotifierProvider); // 현재 테마 구독

    return MaterialApp(
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: themeMode,
      home: HomePage(),
    );
  }
}
