import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';

class VideoListItem extends StatelessWidget {
  final String image;
  const VideoListItem({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image:
              DecorationImage(image: NetworkImage(image), fit: BoxFit.cover)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //left side
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.black.withOpacity(0.5),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.volume_off,
                    color: whiteClr,
                    size: 30,
                  )),
            ),
            // rightside
            Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(image),
                ),
              ),
              const VideoActionWidget(
                  icon: Icons.emoji_emotions, title: 'Share'),
              const VideoActionWidget(icon: Icons.add, title: 'LOL'),
              const VideoActionWidget(icon: Icons.share, title: 'My List'),
              const VideoActionWidget(icon: Icons.play_arrow, title: 'Play'),
            ]),
          ],
        ),
      ),
    );
  }
}

class VideoActionWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  const VideoActionWidget({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(children: [
        Icon(
          icon,
          color: Colors.white,
          size: 30,
        ),
        Text(
          title,
          style: const TextStyle(color: whiteClr, fontSize: 16),
        )
      ]),
    );
  }
}
