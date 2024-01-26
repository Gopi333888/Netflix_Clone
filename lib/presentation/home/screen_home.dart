import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/core/colors/constants.dart';
import 'package:netflix/presentation/home/widget/numbers_title_card.dart';
import 'package:netflix/presentation/widgets/background_card.dart';
import 'package:netflix/presentation/widgets/main_tittle.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

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
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          BackGroundCard(),
                          MainTitleWidgets(
                            tittile: "Released in the past year",
                          ),
                          setHeight,
                          MainTitleWidgets(
                            tittile: 'Trending Now',
                          ),
                          setHeight,
                          NumberTitleCard(),
                          setHeight,
                          MainTitleWidgets(
                            tittile: 'Tense Dramas',
                          ),
                          setHeight,
                          MainTitleWidgets(
                            tittile: 'South Indian Cinema',
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                scrollNotifier.value == true
                    ? AnimatedContainer(
                        duration: const Duration(milliseconds: 6000),
                        width: double.infinity,
                        height: 100,
                        color: Colors.black.withOpacity(0.5),
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
                                  color: Colors.blue,
                                ),
                                setWidth,
                              ],
                            ),
                            setHeight,
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

  // ignore: non_constant_identifier_names
}
