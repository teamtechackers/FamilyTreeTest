import 'package:family_tree_test/person_node.dart';

import 'package:flutter/material.dart';

class FamilyTreePainter extends CustomPainter {
  final PersonNode rootNode;

  FamilyTreePainter(this.rootNode);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint linePaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    final TextPainter textPainter = TextPainter(
      textDirection: TextDirection.ltr,
    );

    double startX = size.width / 2; // Center of the canvas
    double startY = 100; // Starting Y position for the root level
    double verticalSpacing = 100;
    double horizontalSpacing = 100;

    // Draw the tree starting from the root node
    _drawFamily(canvas, startX, startY, rootNode, textPainter, linePaint,
        verticalSpacing, horizontalSpacing);
  }

  void _drawFamily(
    Canvas canvas,
    double x,
    double y,
    PersonNode person,
    TextPainter textPainter,
    Paint linePaint,
    double verticalSpacing,
    double horizontalSpacing,
  ) {
    // Draw the main person
    _drawPersonNode(canvas, x, y, person.name, textPainter);

    // Draw spouse if exists
    if (person.spouse != null) {
      _drawPersonNode(
          canvas, x + horizontalSpacing, y, person.spouse!.name, textPainter);

      // Connect the couple
      canvas.drawLine(
        Offset(x + 20, y),
        Offset(x + horizontalSpacing - 20, y),
        linePaint,
      );
    }

    // Draw children
    if (person.children.isNotEmpty) {
      double childStartX =
          x - (person.children.length - 1) * horizontalSpacing / 2;
      double childY = y + verticalSpacing;

      for (var child in person.children) {
        // Connect parent to child
        canvas.drawLine(
          Offset(x, y + 20),
          Offset(childStartX, childY - 20),
          linePaint,
        );

        // Recursively draw child
        _drawFamily(canvas, childStartX, childY, child, textPainter, linePaint,
            verticalSpacing, horizontalSpacing);

        // Move to next child's position
        childStartX += horizontalSpacing;
      }
    }
  }

  void _drawPersonNode(
      Canvas canvas, double x, double y, String name, TextPainter textPainter) {
    const double radius = 20;
    final Paint circlePaint = Paint()..color = Colors.blue;

    // Draw circle
    canvas.drawCircle(Offset(x, y), radius, circlePaint);

    // Draw text
    textPainter.text = TextSpan(
      text: name,
      style: const TextStyle(color: Colors.white, fontSize: 10),
    );
    textPainter.layout();
    textPainter.paint(
      canvas,
      Offset(x - textPainter.width / 2, y - textPainter.height / 2),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
