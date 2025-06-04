import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/models/product_model.dart';
import 'package:e_commerce_app/di/injection.dart';
import 'package:e_commerce_app/presentation/bloc/products/products_controller.dart';
import 'package:e_commerce_app/presentation/views/products/product_details_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

class CardProduct extends StatelessWidget {
  final ProductModel product;

  CardProduct({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 240,
      decoration: BoxDecoration(
        // color: Colors.grey,
        borderRadius: BorderRadius.circular(15),
      ),
      child: GestureDetector(
        onTap: () => Get.to(ProductDetailsPage(productId: product.id)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
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
                Positioned(
                  bottom: 0,
                  right: 8,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Icon(Icons.favorite_outline, size: 17),
                  ),
                ),
              ],
            ),
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
            Text(product.title, overflow: TextOverflow.ellipsis, maxLines: 1),
            SizedBox(height: 2),
            Text(product.price.toInt().toString()),
          ],
        ),
      ),
    );
  }
}
