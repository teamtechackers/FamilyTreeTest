import 'package:family_tree_test/person_node.dart';
import 'package:flutter/material.dart';

import 'family_tree_painter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Build the family tree data
    var rootNode = buildFamilyTree();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Family Tree')),
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SizedBox(
              width: 900, // Width for the full scrollable area
              height: 900, // Height for the full scrollable area
              child: CustomPaint(
                size: const Size(900, 900), // Match the scrollable area
                painter: FamilyTreePainter(rootNode),
              ),
            ),
          ),
        ),
      ),
    );
  }

  PersonNode buildFamilyTree() {
    // Create children
    var child1 = PersonNode("Child 1");
    var child2 = PersonNode("Child 2");
    var child3 = PersonNode("Child 3");
    var child4 = PersonNode("Child 4");
    var child5 = PersonNode("Child 5");
    var child6 = PersonNode("Child 6");
    var child7 = PersonNode("Child 7");
    var child8 = PersonNode("Child 8");
    var child9 = PersonNode("Child 9");

    // Create parents
    var husband = PersonNode("Husband");
    var wife = PersonNode("Wife");

    // Define spouse relationship
    husband.spouse = wife;
    wife.spouse = husband;

    // Add children to parents
    // husband.children.addAll([child1, child2, child3]);
    husband.children.addAll([
      child1,
      child2,
      child3,
      child4,
      child5,
      child6,
      child7,
      child8,
      child9
    ]);
    /*wife.children.addAll([
      child1,
      child2,
      child3,
      child4,
      child5,
      child6,
      child7,
      child8,
      child9
    ]);*/

    return husband; // Root node
    // return wife;
  }
}
