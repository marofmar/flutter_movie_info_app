import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_info_app/presentation/widgets/theme_notifier.dart';

class CommonAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final String title;

  const CommonAppBar({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeNotifierProvider); // 현재 테마 구독
    final themeNotifier = ref.read(themeNotifierProvider.notifier); // 변경

    return AppBar(
      toolbarHeight: 46,
      title: Text(
        title,
        style: GoogleFonts.kodeMono(
          textStyle: const TextStyle(fontSize: 16),
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(
            themeMode == ThemeMode.dark ? Icons.light_mode : Icons.dark_mode,
          ),
          onPressed: () {
            themeNotifier.toggleTheme();
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(46);
}
