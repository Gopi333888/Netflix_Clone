import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/infrastructure/functions.dart/movies_functions.dart';
import 'package:netflix/model/model.dart';
import 'package:netflix/presentation/home/widgets/custom_button.dart';
import 'package:netflix/presentation/home/widgets/number_title_card.dart';
import 'package:netflix/presentation/home/widgets/playbutton.dart';
import 'package:netflix/presentation/widgets/main_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  late Future<List<Movie>> trendingMovies;
  late Future<List<Movie>> horrorMovies;
  late Future<List<Movie>> comedyMovies;
  late Future<List<Movie>> actionMovies;
  late Future<List<Movie>> upComingMovies;

  @override
  void initState() {
    trendingMovies = getTrendingMovies();
    horrorMovies = getHorrorMovies();
    comedyMovies = getComedyMovies();
    actionMovies = getActionMovies();
    upComingMovies = getUpComingMovies();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ValueListenableBuilder(
        valueListenable: scrollNotifier,
        builder: (BuildContext, context, index) {
          return NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              final ScrollDirection direction = notification.direction;
              if (direction == ScrollDirection.reverse) {
                scrollNotifier.value = false;
              } else if (direction == ScrollDirection.forward) {
                scrollNotifier.value = true;
              }
              return true;
            },
            child: Stack(
              children: [
                ListView(
                  children: [
                    Column(
                      children: [
                        const HomeBackgroundCard(),
                        MainTitleCard(
                          movies: trendingMovies,
                          title: "Trending Movies",
                        ),
                        setHeight,
                        MainTitleCard(
                          movies: horrorMovies,
                          title: 'Horror Movies',
                        ),
                        setHeight,
                        NumberTitleCard(movies: upComingMovies),
                        setHeight,
                        MainTitleCard(
                          movies: comedyMovies,
                          title: 'Comedy Movies',
                        ),
                        setHeight,
                        MainTitleCard(
                          movies: actionMovies,
                          title: 'Action films',
                        )
                      ],
                    ),
                  ],
                ),
                scrollNotifier.value == true
                    ? AnimatedContainer(
                        duration: const Duration(milliseconds: 6000),
                        width: double.infinity,
                        height: 100,
                        color: Colors.black.withOpacity(0.6),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Image(
                                  image: NetworkImage(
                                      'https://upload.wikimedia.org/wikipedia/commons/f/ff/Netflix-new-icon.png'),
                                  width: 60,
                                  height: 60,
                                ),
                                const Spacer(),
                                const Icon(
                                  Icons.cast,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                setWidth,
                                Container(
                                  width: 30,
                                  height: 30,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(appBarImage),
                                          fit: BoxFit.cover)),
                                ),
                                setHeight,
                              ],
                            ),
                            setHeight5,
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "TV Shows",
                                  style: textStyle,
                                ),
                                Text(
                                  "Movies",
                                  style: textStyle,
                                ),
                                Text(
                                  'Categories',
                                  style: textStyle,
                                )
                              ],
                            )
                          ],
                        ))
                    : setHeight
              ],
            ),
          );
        },
      ),
    ));
  }
}

class HomeBackgroundCard extends StatelessWidget {
  const HomeBackgroundCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 600,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(kMainImage), fit: BoxFit.cover)),
        ),
        const Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomIconWithText(icon: Icons.add, text: 'My List '),
                PlayButton(),
                CustomIconWithText(icon: Icons.info_outline, text: 'Info'),
              ],
            ),
          ),
        )
      ],
    );
  }
}
