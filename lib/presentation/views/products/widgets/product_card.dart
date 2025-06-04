import 'package:e_commerce_app/data/models/product_model.dart';
import 'package:e_commerce_app/presentation/views/products/product_details_page.dart';
import 'package:e_commerce_app/presentation/views/products/widgets/add_to_cart_btn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 240,
      decoration: BoxDecoration(
        // color: Colors.grey,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Get.to(ProductDetailsPage(productId: product.id));
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: NetworkImage(product.image),
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                ),
                SizedBox(height: 2),
                Wrap(
                  children: List.generate(5, (index) {
                    return Icon(
                      Icons.star,
                      color:
                          index < product.rating.rate.toInt()
                              ? Colors.orange.shade400
                              : Colors.grey,
                      size: 20,
                    );
                  }),
                ),
                Text(
                  product.title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                SizedBox(height: 2),
                Text(product.price.toString()),
              ],
            ),
          ),
          SizedBox(height: 2),
          AddToCartBtn(onTap: () {}),
        ],
      ),
    );
  }
}
