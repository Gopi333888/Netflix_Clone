import 'package:flutter/material.dart';
import 'package:netflix/core/colors/constants.dart';
import 'package:netflix/presentation/search/widgets/tittle.dart';

const imageUrls =
    'https://media.themoviedb.org/t/p/w300_and_h450_bestv2/qhb1qOilapbapxWQn9jtRCMwXJF.jpg';

class SearchResultWidgets extends StatelessWidget {
  const SearchResultWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(tittle: 'Movies & Tv'),
        setHeight,
        Expanded(
            child: GridView.count(
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1 / 1.6,
          crossAxisCount: 3,
          shrinkWrap: true,
          children: List.generate(20, (index) {
            return const MainCard();
          }),
        ))
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: const DecorationImage(
              image: NetworkImage(imageUrls), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(10)),
    );
  }
}
