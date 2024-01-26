import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.icons,
    required this.buttonName,
  });
  final IconData icons;
  final String buttonName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icons,
          size: 25,
          color: Colors.white,
        ),
        Text(
          buttonName,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
        )
      ],
    );
  }
}
