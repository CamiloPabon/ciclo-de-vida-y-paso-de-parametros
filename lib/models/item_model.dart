class Item {
  final int id;
  final String title;
  bool isFavorite;

  Item({
    required this.id,
    required this.title,
    this.isFavorite = false,
  });
}
