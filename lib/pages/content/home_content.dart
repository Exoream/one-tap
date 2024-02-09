import 'package:ecommerce/controller/product_best_seller.dart';
import 'package:ecommerce/pages/content/best_seller.dart';
import 'package:ecommerce/pages/content/icon_lable.dart';
import 'package:ecommerce/routes/routes_named.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.search,
                      size: 18,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    hintText: "Search"),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                height: 150,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage("assets/img/background.jpg"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconLabel(
                    iconData: Icons.local_offer,
                    label: "Discount",
                    onPressed: () {},
                  ),
                  IconLabel(
                    iconData: Icons.monetization_on,
                    label: "Top Up",
                    onPressed: () {},
                  ),
                  IconLabel(
                    iconData: Icons.videogame_asset,
                    label: "Gaming",
                    onPressed: () {},
                  ),
                  IconLabel(
                    iconData: Icons.accessibility,
                    label: "Fashion",
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconLabel(
                    iconData: Icons.devices_other,
                    label: "Electronic",
                    onPressed: () {},
                  ),
                  IconLabel(
                    iconData: Icons.desktop_windows,
                    label: "Computer",
                    onPressed: () {},
                  ),
                  IconLabel(
                    iconData: Icons.local_hospital,
                    label: "Health",
                    onPressed: () {},
                  ),
                  IconLabel(
                    iconData: Icons.shopping_basket,
                    label: "Other",
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              GetBuilder<ProductBestSellerController>(
                init: ProductBestSellerController(),
                builder: (productController) {
                  if (productController.products.isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Best Seller",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Get.toNamed(RoutesNamed.product);
                              },
                              child: const Text(
                                "See More",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Expanded(
                              child: BestSellerProduct(
                                name: productController.products[2].title,
                                price: productController.products[2].price,
                                rating: productController.products[2].rating,
                                reviewCount:
                                    productController.products[2].reviewCount,
                                imagePath:
                                    productController.products[2].imagePath,
                                productId: productController.products[2].id,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: BestSellerProduct(
                                name: productController.products[3].title,
                                price: productController.products[3].price,
                                rating: productController.products[3].rating,
                                reviewCount:
                                    productController.products[3].reviewCount,
                                imagePath:
                                    productController.products[3].imagePath,
                                productId: productController.products[3].id,
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
