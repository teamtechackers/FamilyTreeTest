import 'package:flutter/material.dart';

class HorizontalLine extends StatelessWidget {
  final double width;

  const HorizontalLine({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      width: width,
      color: Colors.black,
    );
  }
}
