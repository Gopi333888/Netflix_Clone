import 'package:flutter/material.dart';
import 'package:netflix/core/colors/constants.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key, required this.titile});
  final String titile;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          setWidth,
          Text(
            titile,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
          ),
          const Spacer(),
          const Icon(
            Icons.cast,
            color: Colors.white,
            size: 30,
          ),
          setWidth,
          Container(
            width: 30,
            height: 30,
            color: Colors.blue,
          ),
          setWidth,
        ],
      ),
    );
  }
}
