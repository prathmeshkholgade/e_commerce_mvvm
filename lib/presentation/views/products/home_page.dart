import 'package:e_commerce_app/di/injection.dart';
import 'package:e_commerce_app/presentation/bloc/products/products_controller.dart';
import 'package:e_commerce_app/presentation/views/category/category_page.dart';
import 'package:e_commerce_app/presentation/views/products/widgets/category.dart';
import 'package:e_commerce_app/presentation/views/products/widgets/image_slider.dart';
import 'package:e_commerce_app/presentation/views/products/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final productsController = sl<ProductsController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      productsController.getProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final screenWidth = MediaQuery.of(context).size.width;
    final data = productsController.products;
    print("this is data u have to show on the ui $data");
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {},
              // onPressed: () {
              //   showSearch(
              //     context: context,
              //     delegate:

              //   );
              // },
              icon: const Icon(
                Icons.search,
                size: 30,
                color: Colors.blueAccent,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ImageSlider(),
            SizedBox(height: 10),
            // category
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Categories"),
                  GestureDetector(
                    onTap: () => Get.to(CategoryPage()),
                    child: Text(
                      "See All",
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            CategoriesList(),
            SizedBox(height: 10),
            //trending
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Trending"),
                  Text(
                    "See All",
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ],
              ),
            ),

            SizedBox(height: 5),
            Obx(() {
              if (productsController.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    alignment: WrapAlignment.start,
                    children:
                        data
                            .map((product) => ProductCard(product: product))
                            .toList(),
                  ),
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
