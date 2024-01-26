import 'package:flutter/material.dart';
import 'package:netflix/core/colors/constants.dart';

class MainCard1 extends StatelessWidget {
  const MainCard1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 9),
      child: Container(
        width: 140,
        height: 200,
        decoration: BoxDecoration(
            borderRadius: setRadius,
            image: const DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://media.themoviedb.org/t/p/w300_and_h450_bestv2/mTMAxrRaDp0TFpdFVinD3grrqr9.jpg'))),
      ),
    );
  }
}
