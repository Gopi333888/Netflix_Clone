import 'package:flutter/material.dart';

class SearchTextTitle extends StatelessWidget {
  const SearchTextTitle({
    super.key,
    required this.tittle,
  });
  final String tittle;
  @override
  Widget build(BuildContext context) {
    return Text(
      tittle,
      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    );
  }
}
