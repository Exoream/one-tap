import 'package:ecommerce/routes/routes_named.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BestSellerProduct extends StatelessWidget {
  final String name;
  final double price;
  final double rating;
  final int reviewCount;
  final String imagePath;
  final int? productId;

  const BestSellerProduct({
    Key? key,
    required this.name,
    required this.price,
    required this.rating,
    required this.reviewCount,
    required this.imagePath,
    this.productId,
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
          GestureDetector(
            onTap: () {
              Get.toNamed(RoutesNamed.productDetail, arguments: productId);
            },
            child: Image.network(
              imagePath,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            name,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),
          Text(
            "Price: \$${price.toStringAsFixed(2)}",
            style: const TextStyle(fontSize: 14, color: Colors.green),
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
              Text(
                "($reviewCount reviews)",
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
