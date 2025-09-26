

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Buttons extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  Buttons({
    super.key,
    required this.text,
    required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      // ignore: sort_child_properties_last
      child: Text(text),
      color: Colors.amber[200],
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Colors.amber[400]!,
          width: 5
        )
      ),
    );
  }
}