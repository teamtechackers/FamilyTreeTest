class PersonNode {
  final String name;
  PersonNode? spouse;
  List<PersonNode> children;

  PersonNode(this.name, {this.spouse, List<PersonNode>? children})
      : children = children ?? [];
}
