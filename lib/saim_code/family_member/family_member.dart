import 'package:family_tree_test/saim_code/family_member/widget/verticle_line.dart';
import 'package:flutter/material.dart';

class FamilyMember extends StatelessWidget {
  final double top;
  final double left;
  final double radius;
  final Color color;
  final String label;
  final bool withVerticalLine;

  const FamilyMember({
    super.key,
    required this.top,
    required this.left,
    required this.radius,
    required this.color,
    required this.label,
    this.withVerticalLine = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (withVerticalLine)
          Positioned(
            top: top - 40,
            left: left + radius - 1,
            child: const VerticalLine(height: 40),
          ),
        Positioned(
          top: top,
          left: left,
          child: CircleAvatar(
            radius: radius,
            backgroundColor: color,
            backgroundImage: AssetImage(label),
          ),
        ),
      ],
    );
  }
}
