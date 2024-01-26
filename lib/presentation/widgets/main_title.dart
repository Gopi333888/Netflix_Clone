import 'package:flutter/material.dart';

class MainTittle extends StatelessWidget {
  const MainTittle({
    super.key,
    required this.tittle,
  });
  final String tittle;
  @override
  Widget build(BuildContext context) {
    return Text(
      tittle,
      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    );
  }
}
