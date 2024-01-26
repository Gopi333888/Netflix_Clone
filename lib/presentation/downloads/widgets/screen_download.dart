import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/colors/constants.dart';
import 'package:netflix/presentation/widgets/app_bar_widgets.dart';

class ScreenDownload extends StatelessWidget {
  ScreenDownload({super.key});
  final _widgetList = [
    const _SmartDownloads(),
    const Section2(),
    const Section3()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppBarWidget(
              titile: "Downloads",
            )),
        body: ListView.separated(
            padding: const EdgeInsets.all(10),
            itemBuilder: (context, index) => _widgetList[index],
            separatorBuilder: (context, index) => const SizedBox(
                  height: 25,
                ),
            itemCount: _widgetList.length));
  }
}

//section 1
class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 10),
      child: Row(
        children: [
          setWidth,
          Icon(
            Icons.settings,
            color: whiteClr,
          ),
          setWidth,
          Text("Smart Downloads")
        ],
      ),
    );
  }
}

//Section2
class Section2 extends StatelessWidget {
  const Section2({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final imageList = [
      "https://images.ctfassets.net/4cd45et68cgf/3tCOzPxx4SdNL8gBcC8Dp6/1a6ba2f129270f78d44cb3be6a123687/EN-GB_Paradise_Main_Vertical_RGB_PRE__1_.jpg",
      "https://bleedingcool.com/wp-content/uploads/2019/01/IO_Vertical-Main_RGB-900x900.jpg",
      "https://deadline.com/wp-content/uploads/2021/05/OXYGEN_Vertical_RGB_FR.jpg"
    ];
    return Column(
      children: [
        const Text(
          "Introducing Downloads for you",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: whiteButtonClr, fontSize: 23, fontWeight: FontWeight.w900),
        ),
        setHeight20,
        const Text(
          "We will download a personalised selection of\n movies and shows for you, so there is\n always something to watch on your \ndevice ",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: greyClr, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: size.width,
          height: size.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                radius: size.width * 0.38,
                backgroundColor: greyClr.shade800,
              ),
              DownloadsImagewidgets(
                imageList: imageList[0],
                margin: const EdgeInsets.only(left: 140, bottom: 50),
                angle: 25,
                size: Size(size.width * 0.38, size.width * 0.52),
              ),
              DownloadsImagewidgets(
                imageList: imageList[1],
                margin: const EdgeInsets.only(right: 140, bottom: 50),
                angle: -25,
                size: Size(size.width * 0.38, size.width * 0.52),
              ),
              DownloadsImagewidgets(
                imageList: imageList[2],
                margin: const EdgeInsets.only(left: 0, bottom: 5),
                size: Size(size.width * 0.43, size.width * 0.61),
                radius: 10,
              )
            ],
          ),
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 340,
          child: MaterialButton(
            onPressed: () {},
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: blueButtonClr,
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Set Up",
                style: TextStyle(
                    color: whiteClr, fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        setHeight,
        MaterialButton(
          onPressed: () {},
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: whiteButtonClr,
          child: const Text(
            "See what you can download",
            style: TextStyle(
                color: blackClr, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}

class DownloadsImagewidgets extends StatelessWidget {
  const DownloadsImagewidgets(
      {super.key,
      this.angle = 0,
      required this.imageList,
      required this.margin,
      required this.size,
      this.radius = 10});
  final String imageList;
  final double angle;
  final EdgeInsets margin;
  final Size size;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: margin,
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            color: blackClr,
            image: DecorationImage(
                image: NetworkImage(imageList), fit: BoxFit.cover)),
      ),
    );
  }
}
