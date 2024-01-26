import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/core/colors/constants.dart';

class NumbersCard extends StatelessWidget {
  const NumbersCard({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 50,
              height: 200,
            ),
            Container(
              width: 140,
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: setRadius,
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://media.themoviedb.org/t/p/w300_and_h450_bestv2/mTMAxrRaDp0TFpdFVinD3grrqr9.jpg'))),
            ),
          ],
        ),
        Positioned(
          bottom: -40,
          left: 10,
          child: BorderedText(
            strokeWidth: 10.0,
            strokeColor: Colors.white,
            child: Text(
              '${index + 1}',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w700,
                  fontSize: 120,
                  decoration: TextDecoration.none,
                  color: Colors.black),
            ),
          ),
        )
      ],
    );
  }
}
