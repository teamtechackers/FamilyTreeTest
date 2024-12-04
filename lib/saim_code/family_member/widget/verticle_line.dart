import 'package:flutter/material.dart';

class VerticalLine extends StatelessWidget {
  final double height;

  const VerticalLine({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: height,
      color: Colors.black,
    );
  }
}
