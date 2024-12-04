import 'package:family_tree_test/saim_code/family_member/family_member.dart';
import 'package:family_tree_test/saim_code/family_member/widget/horizontal_line.dart';
import 'package:family_tree_test/saim_code/family_member/widget/verticle_line.dart';
import 'package:flutter/material.dart';

class FamilyTree extends StatefulWidget {
  const FamilyTree({super.key});

  @override
  _FamilyTreeState createState() => _FamilyTreeState();
}

class _FamilyTreeState extends State<FamilyTree> {
  Offset _offset = Offset.zero; // Position of the family tree

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    double start = 1;
    double horizontalLineStart = 0;

    return GestureDetector(
      onPanUpdate: (details) {
        setState(() {
          _offset += details.delta; // Update the offset during drag
        });
      },
      child: Stack(
        children: [
          Transform.translate(
            offset: _offset,
            child: Stack(
              children: [
                // Connecting lines
                Positioned(
                  top: screenHeight * 0.2 - 40,
                  left: screenWidth * 0.3,
                  child: HorizontalLine(width: screenWidth * 0.4),
                ),
                Positioned(
                  top: screenHeight * 0.2 - 40,
                  left: screenWidth * 0.5 - 1,
                  child: VerticalLine(height: screenHeight * 0.2),
                ),

                // Family members
                FamilyMember(
                  top: screenHeight * 0.1,
                  left: screenWidth * 0.3 - 40,
                  radius: 40,
                  color: Colors.orange,
                  label: 'assets/boy.png',
                ),
                FamilyMember(
                  top: screenHeight * 0.1,
                  left: screenWidth * 0.7 - 40,
                  radius: 40,
                  color: const Color(0xff7D7AB4),
                  label: 'assets/girl.png',
                ),

                ...List.generate(4, (index) {
                  if (index == 0) {
                    start /= 4;
                    horizontalLineStart = start;
                  } else {
                    start += horizontalLineStart;
                  }
                  return FamilyMember(
                    top: screenHeight * 0.4,
                    left: screenWidth * start - 30,
                    radius: 30,
                    color: Colors.orange,
                    label: 'assets/boy.png',
                    withVerticalLine: true,
                  );
                }),
                Positioned(
                  top: screenHeight * 0.4 - 40,
                  left: screenWidth * horizontalLineStart,
                  child: HorizontalLine(width: screenWidth * start),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
