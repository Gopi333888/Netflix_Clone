import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';

class VideoListItem extends StatelessWidget {
  const VideoListItem({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.accents[index % Colors.accents.length],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //left side
                CircleAvatar(
                  backgroundColor: Colors.black.withOpacity(0.5),
                  radius: 30,
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.volume_mute,
                        size: 30,
                      )),
                ),

                // right side
                const Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage(
                            'https://media.themoviedb.org/t/p/w300_and_h450_bestv2/qhb1qOilapbapxWQn9jtRCMwXJF.jpg'),
                      ),
                    ),
                    VideoActions(icon: Icons.emoji_emotions, tittle: 'LOL'),
                    VideoActions(icon: Icons.add, tittle: 'My List'),
                    VideoActions(icon: Icons.share, tittle: 'Share'),
                    VideoActions(icon: Icons.play_arrow, tittle: 'Play')
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class VideoActions extends StatelessWidget {
  const VideoActions({super.key, required this.icon, required this.tittle});
  final IconData icon;
  final String tittle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 30,
          ),
          Text(
            tittle,
            style: TextStyle(fontSize: 16, color: whiteClr),
          )
        ],
      ),
    );
  }
}
