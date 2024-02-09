import 'package:ecommerce/pages/product/data_product.dart';
import 'package:ecommerce/routes/routes_named.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/controller/product_controller.dart';
import 'package:get/get.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products', style: TextStyle(color: Colors.blue),),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
        ],
        iconTheme: const IconThemeData(color: Colors.blue),
      ),
      body: GetBuilder<ProductController>(
        init: ProductController(),
        builder: (productController) {
          if (productController.products.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: (productController.products.length / 2).ceil(),
              itemBuilder: (context, index) {
                final int startIndex = index * 2;
                final int endIndex =
                    startIndex + 2 <= productController.products.length
                        ? startIndex + 2
                        : productController.products.length;

                return Row(
                  children: List.generate(endIndex - startIndex, (index) {
                    final product =
                        productController.products[startIndex + index];
                    final DataProduct dataProduct = DataProduct(
                      name: product.title,
                      price: product.price,
                      rating: product.rating,
                      reviewCount: product.reviewCount,
                      imagePath: product.imagePath,
                    );
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Get.toNamed(
                              RoutesNamed.productDetail,
                              arguments: product.id,
                            );
                          },
                          child: dataProduct,
                        ),
                      ),
                    );
                  }),
                );
              },
            );
          }
        },
      ),
    );
  }
}
