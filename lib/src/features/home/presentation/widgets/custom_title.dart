import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  final String titleText;

  const CustomTitle({super.key, required this.titleText});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(8.0),
        child: Align(
            alignment: Alignment.centerLeft,
            child: Text(titleText,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18))));
  }
}
