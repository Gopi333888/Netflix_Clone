import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/colors/constants.dart';
import 'package:netflix/presentation/search/widgets/tittle.dart';

const imageUrl =
    'https://media.themoviedb.org/t/p/w250_and_h141_face/micMmUVPwGzw6lqzy96xmCgYxNL.jpg';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(
          tittle: 'Top Searches',
        ),
        setHeight20,
        Expanded(
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) => const TopSearchItemTile(),
              separatorBuilder: (context, index) => setHeight20,
              itemCount: 10),
        )
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  const TopSearchItemTile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenwidth * 0.4,
          height: 85,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(imageUrl), fit: BoxFit.cover)),
        ),
        setWidth,
        const Expanded(
            child: Text(
          'Movie Name',
          style: TextStyle(
              color: whiteClr, fontWeight: FontWeight.bold, fontSize: 16),
        )),
        const CircleAvatar(
          backgroundColor: whiteClr,
          radius: 23,
          child: CircleAvatar(
            backgroundColor: blackClr,
            radius: 21,
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
