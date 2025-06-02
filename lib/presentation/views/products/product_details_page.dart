import 'package:e_commerce_app/di/injection.dart';
import 'package:e_commerce_app/presentation/bloc/products/products_controller.dart';
import 'package:e_commerce_app/presentation/views/products/widgets/add_to_cart_btn.dart';
import 'package:flutter/material.dart';

class ProductDetailsPage extends StatefulWidget {
  final int productId;
  const ProductDetailsPage({super.key, required this.productId});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  final productController = sl<ProductsController>();
  @override
  Widget build(BuildContext context) {
    final product = productController.products.firstWhere(
      (product) => product.id == widget.productId,
    );
    print("this is the single $product");
    return Scaffold(
      appBar: AppBar(title: Text("Product Details"), centerTitle: true),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(product.image),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(product.title),
            SizedBox(height: 10),
            Text(product.price.toString()),
            SizedBox(height: 10),
            Row(
              children: [
                Wrap(
                  children: List.generate(5, (index) {
                    return Icon(
                      Icons.star,
                      color:
                          index < product.rating.rate.toInt()
                              ? Colors.orange.shade400
                              : Colors.grey,
                    );
                  }),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(product.description, style: TextStyle(fontSize: 17)),
            SizedBox(height: 5),
            AddToCartBtn(onTap: () {}, height: 30),
          ],
        ),
      ),
    );
  }
}
