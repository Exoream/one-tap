import 'package:flutter/material.dart';

class DataProduct extends StatelessWidget {
  final String? id;
  final String name;
  final double price;
  final double rating;
  final int reviewCount;
  final String imagePath;
  final String? category;
  final String? description;

  const DataProduct({
    Key? key,
    this.id,
    required this.name,
    required this.price,
    required this.rating,
    required this.reviewCount,
    required this.imagePath,
    this.category,
    this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            name,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Text(
                'Price: ',
              ),
              Text(
                '\$${price.toStringAsFixed(2)}',
                style: const TextStyle(
                    color: Colors.green, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.star, color: Colors.yellow),
              Text(
                rating.toString(),
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(width: 8),
              FittedBox(
                child: Text(
                  "($reviewCount reviews)",
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
