import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/presentation/downloads/widgets/screen_download.dart';
import 'package:netflix/presentation/fast_laugh/screen_fast_laugh.dart';
import 'package:netflix/presentation/home/screen_home.dart';
import 'package:netflix/presentation/main_page/widgets/bottom_nav.dart';
import 'package:netflix/presentation/new_and_hot/new_and_hot.dart';
import 'package:netflix/presentation/search/screen_search.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({super.key});
  final pages = [
    ScreenHome(),
    ScreenNewAndHot(),
    ScreenFastLaugh(),
    ScreenSearch(),
    ScreenDownload()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: ValueListenableBuilder(
        valueListenable: indexChangedNotifier,
        builder: (context, int index, _) {
          return pages[index];
        },
      ),
      bottomNavigationBar: const BottomNavigationBarWidgets(),
    );
  }
}
