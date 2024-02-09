class DataProducts {
  final int id;
  final String title;
  final double price;
  final double rating;
  final int reviewCount;
  final String imagePath;
  final String category;
  final String description;

  const DataProducts(
      {required this.id,
      required this.title,
      required this.price,
      required this.rating,
      required this.reviewCount,
      required this.imagePath,
      required this.category,
      required this.description});

  factory DataProducts.fromJson(Map<String, dynamic> json) => DataProducts(
        id: json['id'],
        title: json['title'],
        price: json['price'].toDouble(),
        rating: json['rating']['rate'].toDouble(),
        reviewCount: json['rating']['count'],
        imagePath: json['image'],
        category: json['category'],
        description: json['description'],
      );
}
