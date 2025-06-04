import 'package:e_commerce_app/di/injection.dart';
import 'package:e_commerce_app/presentation/bloc/products/products_controller.dart';
import 'package:e_commerce_app/presentation/views/category/category_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';

class CategoriesList extends StatelessWidget {
  final productsController = sl<ProductsController>();
  CategoriesList({super.key});
  List CategoriesName = [
    "electronics",
    "jewelery",
    "men's clothing",
    "women's clothing",
  ];
  List categoriesImg = [
    "https://plus.unsplash.com/premium_photo-1679913792906-13ccc5c84d44?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1542291026-7eec264c27ff?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://plus.unsplash.com/premium_photo-1708958117373-5d354f07a61a?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1637223781681-7ae3779682a4?q=80&w=1972&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: CategoriesName.length,
        itemBuilder: (context, index) {
          return CategoryListWidget(
            img: categoriesImg[index],
            title: CategoriesName[index],
            onTap: () async {
              Get.to(CategoryPage(category: CategoriesName[index]));
            },
          );
        },
      ),
    );
  }
}

class CategoryListWidget extends StatelessWidget {
  final String img;
  final String title;
  final VoidCallback onTap;

  const CategoryListWidget({
    super.key,
    required this.img,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(left: 10, right: 5),
        width: 160,
        // decoration: BoxDecoration(
        //   image: DecorationImage(image: img, fit: BoxFit.cover),
        //   borderRadius: BorderRadius.circular(40),
        // ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(img),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(40),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.black.withAlpha(80),
                borderRadius: BorderRadius.circular(40),
              ),
            ),
            Center(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        //  Center(
        //   child: Text(
        //     title,
        //     style: TextStyle(
        //       color: Colors.white,
        //       fontSize: 16,
        //       fontWeight: FontWeight.w600,
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
