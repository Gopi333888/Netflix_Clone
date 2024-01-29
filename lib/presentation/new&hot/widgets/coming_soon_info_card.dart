import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/model/model.dart';
import 'package:netflix/presentation/home/widgets/custom_button.dart';
import 'package:netflix/presentation/widgets/video_widget.dart';

import '../../../core/colors/colors.dart';

ValueNotifier<List<Movie>> newandHotNotifier = ValueNotifier([]);

class ComingSoonInfoCard extends StatelessWidget {
  const ComingSoonInfoCard({
    super.key,
    required this.imageUrl,
    required this.date,
    required this.title,
    required this.details,
  });

  final String imageUrl;
  final String date;
  final String title;
  final String details;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 23.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 50,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  date

                  // fetchDate(movieInfo.releaseDate!)
                  ,
                  style: const TextStyle(
                      fontSize: 18,
                      color: whiteClr,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VideoWidget(videoImage: imageUrl),
                setHeight,
                const Row(
                  children: [
                    Spacer(),
                    Row(
                      children: [
                        CustomIconWithText(
                          icon: Icons.alarm_rounded,
                          text: 'Remind me',
                        ),
                        setWidth,
                        CustomIconWithText(
                          icon: Icons.info_outline,
                          text: 'Info',
                        ),
                        setWidth,
                      ],
                    )
                  ],
                ),
                setHeight,
                // Text("Coming on ${fetchDay(movieInfo.releaseDate!)}"),
                setHeight,
                Text(
                  // movieInfo.originalTitle ?? 'Empty Title',
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -1,
                  ),
                ),
                setHeight,
                Text(
                  // movieInfo.overview,
                  details,
                  style: TextStyle(color: Colors.grey),
                ),
                setHeight20
              ],
            ),
          ),
        ],
      ),
    );
  }

  String fetchDate(String date) {
    //convert date in string format to date format
    DateTime dateInFormat = DateTime.parse(date);
    final formatDate = (DateFormat.MMMMd().format(dateInFormat)).split(" ");
    //add \n to make it in the displayable format eg:
    //APR
    //5
    return "${formatDate.first.substring(0, 3)} \n${formatDate.last} ";
  }

  String fetchDay(String date) {
    DateTime dateInFormat = DateTime.parse(date);
    final dayName = DateFormat('EEEE').format(dateInFormat);
    return dayName;
  }
}
