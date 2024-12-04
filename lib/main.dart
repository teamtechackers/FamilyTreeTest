// import 'package:flutter/material.dart';

// void main() {
//   runApp(const FamilyTreeApp());
// }

// class FamilyTreeApp extends StatelessWidget {
//   const FamilyTreeApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Family Tree UI'),
//         ),
//         body: CustomPaint(
//           painter: FamilyTreePainter(),
//           child: Container(),
//         ),
//       ),
//     );
//   }
// }

// class FamilyTreePainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = Colors.black
//       ..strokeWidth = 2;

//     final double circleRadius = 40;

//     // Positions
//     final husband = Offset(size.width / 3, size.height / 4);
//     final wife = Offset(2 * size.width / 3, size.height / 4);

//     // Draw husband and wife circles
//     paint.color = Colors.orange;
//     canvas.drawCircle(husband, circleRadius, paint);
//     paint.color = Colors.purple;
//     canvas.drawCircle(wife, circleRadius, paint);

//     // Calculate start and end points for the line between husband and wife
//     final lineStartHusband = Offset(
//       husband.dx + circleRadius,
//       husband.dy,
//     ); // Right edge of husband's circle
//     final lineStartWife = Offset(
//       wife.dx - circleRadius,
//       wife.dy,
//     ); // Left edge of wife's circle

//     // Draw line between husband and wife
//     paint.color = Colors.black;
//     canvas.drawLine(lineStartHusband, lineStartWife, paint);

//     // Draw vertical line below the center of the husband-wife connection
//     final verticalLineStart = Offset(
//       (lineStartHusband.dx + lineStartWife.dx) / 2,
//       husband.dy,
//     ); // Center of the horizontal line
//     final verticalLineEnd = Offset(
//       verticalLineStart.dx,
//       size.height / 2,
//     );
//     canvas.drawLine(verticalLineStart, verticalLineEnd, paint);

//     // Children positions
//     final child1 = Offset(size.width / 4, 3 * size.height / 4);
//     final child2 = Offset(size.width / 2, 3 * size.height / 4);
//     final child3 = Offset(3 * size.width / 4, 3 * size.height / 4);

//     // Horizontal line connecting children
//     canvas.drawLine(
//       Offset(size.width / 4, size.height / 2),
//       Offset(3 * size.width / 4, size.height / 2),
//       paint,
//     );

//     // Draw child circles
//     paint.color = Colors.blue;
//     canvas.drawCircle(child1, circleRadius, paint);
//     canvas.drawCircle(child2, circleRadius, paint);
//     canvas.drawCircle(child3, circleRadius, paint);

//     // Lines from horizontal line to children
//     canvas.drawLine(
//       Offset(size.width / 4, size.height / 2),
//       Offset(child1.dx, child1.dy - circleRadius),
//       paint,
//     ); // Top edge of child 1
//     canvas.drawLine(
//       Offset(size.width / 2, size.height / 2),
//       Offset(child2.dx, child2.dy - circleRadius),
//       paint,
//     ); // Top edge of child 2
//     canvas.drawLine(
//       Offset(3 * size.width / 4, size.height / 2),
//       Offset(child3.dx, child3.dy - circleRadius),
//       paint,
//     ); // Top edge of child 3
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
// }

import 'package:family_tree_test/saim_code/family_tree.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FamilyTreeApp());
}

class FamilyTreeApp extends StatelessWidget {
  const FamilyTreeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Family Tree UI'),
        ),
        body: const FamilyTree(),
      ),
    );
  }
}
