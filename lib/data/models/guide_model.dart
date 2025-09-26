class GuideModel {
  final String title;
  final int id;
  final String author;
  final String content;

  GuideModel({
    required this.title,
    required this.id,
    required this.author,
    required this.content,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GuideModel && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'GuideModel{title: $title, id: $id, author: $author, content: $content}';
  }
}
