class Dish {
  const Dish({
    required this.imagePath,
    required this.title,
    required this.rating,
    required this.reviews,
    this.points = 0,
  });

  final String imagePath;
  final String title;
  final double rating;
  final int reviews;
  final int points;
}
