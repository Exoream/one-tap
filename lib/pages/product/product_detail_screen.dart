import 'package:ecommerce/routes/routes_named.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/controller/product_controller.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int? productId = Get.arguments as int?;
    final ProductController productController = Get.find<ProductController>();

    // Cek apakah produk sudah diambil dan tersedia di state
    if (productId != null && productController.products.isNotEmpty) {
      final product =
          productController.products.firstWhere((p) => p.id == productId);
      return Scaffold(
        appBar: AppBar(
          title: Text(product.title),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(35.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(product.imagePath),
                    fit: BoxFit.contain,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Divider(
                color: Colors.grey,
                thickness: 0.7,
                endIndent: 16,
              ),
              const SizedBox(height: 25),
              Text(
                product.title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  const Text(
                    'Category: ',
                  ),
                  Text(
                    // ignore: unnecessary_string_interpolations
                    '${product.category}',
                    style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  const Text(
                    'Price: ',
                  ),
                  Text(
                    '\$${product.price}',
                    style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    '${product.rating}',
                  ),
                  const SizedBox(width: 5),
                  Text(
                    '(${product.reviewCount} reviews)',
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              const Divider(
                color: Colors.grey,
                thickness: 0.7,
                endIndent: 16,
              ),
              const SizedBox(height: 25),
              const Text(
                'Description:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                product.description,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 25),
              const Divider(
                color: Colors.grey,
                thickness: 0.7,
                endIndent: 16,
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Get.offNamed(RoutesNamed.wishlist);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      icon: const Icon(Icons.favorite, color: Colors.white),
                      label: const Text(
                        'Wishlist',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      icon:
                          const Icon(Icons.shopping_cart, color: Colors.white),
                      label: const Text(
                        'Cart',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Product Detail'),
          centerTitle: true,
        ),
        body: const Center(
          child: Text('Product data is not provided'),
        ),
      );
    }
  }
}
