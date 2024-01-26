import 'package:flutter/material.dart';
import 'package:netflix/core/colors/constants.dart';
import 'package:netflix/presentation/widgets/main_card.dart';
import 'package:netflix/presentation/widgets/main_title.dart';

class MainTitleWidgets extends StatelessWidget {
  const MainTitleWidgets({
    super.key,
    required this.tittile,
  });
  final String tittile;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTittle(tittle: tittile),
        setHeight,
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(10, (index) => const MainCard1()),
          ),
        )
      ],
    );
  }
}
