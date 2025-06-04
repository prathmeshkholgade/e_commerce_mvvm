import 'package:e_commerce_app/di/injection.dart';
import 'package:e_commerce_app/presentation/bloc/products/products_controller.dart';
import 'package:e_commerce_app/presentation/widgets/card_product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryPage extends StatefulWidget {
  final String? category;
  const CategoryPage({super.key, this.category});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final productsController = sl<ProductsController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      productsController.categoryProducts.clear(); // CLEAR STATE
      if (widget.category != null) {
        productsController.getProductsByCategoryies(widget.category!);
      } else {
        productsController.getProducts();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final allproducts = productsController.products;
    final categoryProducts = productsController.categoryProducts;
    final bool isCategorySelected = widget.category != null;
    final product = isCategorySelected ? categoryProducts : allproducts;
    return Scaffold(
      appBar: AppBar(title: Text(widget.category ?? "All Products")),
      body: Obx(
        () => SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Wrap(
                      children: [
                        Icon(Icons.filter_list, size: 20),
                        SizedBox(width: 5),
                        Text("Filter", style: TextStyle(fontSize: 18)),
                      ],
                    ),
                    InkWell(
                      onTap: showSortings,
                      child: Wrap(
                        children: [
                          Icon(Icons.format_align_center_sharp),
                          SizedBox(width: 5),
                          Text("Sort By"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              productsController.isLoading.value
                  ? CircularProgressIndicator()
                  : Wrap(
                    runSpacing: 10,
                    spacing: 15,
                    children:
                        product
                            .map((product) => CardProduct(product: product))
                            .toList(),
                  ),
            ],
          ),
        ),
      ),
    );
  }

  void showSortings() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(10),
          height: 180,
          width: double.infinity,
          child: Column(
            children: [
              Text(
                "Sort By",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              ListTile(
                onTap: () {
                  if (widget.category != null && widget.category!.isNotEmpty) {
                    productsController.sortProductsCategoryByPrice(
                      widget.category!,
                      "asc",
                    );
                  } else {
                    productsController.sortProductsByPrice("asc");
                  }
                },
                title: Text("Price: High to low"),
              ),
              ListTile(
                onTap: () {
                  if (widget.category != null && widget.category!.isNotEmpty) {
                    productsController.sortProductsCategoryByPrice(
                      widget.category!,
                      "desc",
                    );
                  } else {
                    productsController.sortProductsByPrice("desc");
                  }
                },
                title: Text("Price: Low to High"),
              ),
            ],
          ),
        );
      },
    );
  }
}
