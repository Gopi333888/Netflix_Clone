import 'package:flutter/material.dart';
import 'package:netflix/core/colors/constants.dart';
import 'package:netflix/presentation/widgets/custom_button.dart';

class BackGroundCard extends StatelessWidget {
  const BackGroundCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 600,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(mainImage), fit: BoxFit.cover),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 13),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CustomButton(
                  icons: Icons.add,
                  buttonName: 'My List',
                ),
                _Playbutton(),
                const CustomButton(icons: Icons.info, buttonName: 'Info')
              ],
            ),
          ),
        )
      ],
    );
  }

  TextButton _Playbutton() {
    return TextButton.icon(
        style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.white)),
        onPressed: () {},
        icon: const Icon(
          Icons.play_arrow,
          size: 30,
          color: Colors.black,
        ),
        label: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'Play',
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ));
  }
}
