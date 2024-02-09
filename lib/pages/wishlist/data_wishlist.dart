class Transaction {
  final String title;
  final double totalPrice;
  final String category;
  final DateTime date;
  final String imageURL;

  Transaction({
    required this.title,
    required this.totalPrice,
    required this.category,
    required this.date,
    required this.imageURL,
  });
}

