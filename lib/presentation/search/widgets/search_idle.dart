import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/api.constants.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/search/widgets/title.dart';

class SearchIdleWidget extends StatelessWidget {
  final Future<List<dynamic>> movies;
  const SearchIdleWidget({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SearchTitle(title: 'Top Searches'),
      setHeight,
      FutureBuilder(
        future: movies,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('error is :${snapshot.error}');
          } else if (snapshot.hasData) {
            return Expanded(
              child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    final movie = snapshot.data![index];
                    final image =
                        ApiConstants.imageBaseUrl + (movie.backDropPath ?? '');
                    final titleOfMovie = movie.orginaltitle ?? '';
                    print(image);
                    print(titleOfMovie);

                    return TopSearchMovieTile(
                        imageUrl: image, title: titleOfMovie);
                  },
                  separatorBuilder: (context, index) => setHeight20,
                  itemCount: snapshot.data!.length),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      )
    ]);
  }
}

class TopSearchMovieTile extends StatelessWidget {
  final String imageUrl;
  final String title;
  const TopSearchMovieTile(
      {super.key, required this.imageUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.35,
          height: 65,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(imageUrl))),
        ),
        setWidth,
        Expanded(
            child: Text(
          title,
          style: const TextStyle(
              color: whiteClr, fontWeight: FontWeight.bold, fontSize: 16),
        )),
        const CircleAvatar(
          backgroundColor: whiteClr,
          radius: 20,
          child: CircleAvatar(
            backgroundColor: blackClr,
            radius: 19,
            child: Icon(
              CupertinoIcons.play_fill,
              color: whiteClr,
            ),
          ),
        )
      ],
    );
  }
}
