import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:shopx/controllers/product_controlller.dart';
import 'package:shopx/views/product_tile.dart';

class HomeScreen extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        leading: const Icon(Icons.arrow_back_ios),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    "ShopX",
                    style: TextStyle(
                        fontFamily: "avenir",
                        fontSize: 30,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.view_list_rounded),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.grid_view),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(6),
              child: Obx(
                (() {
                  if (productController.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return MasonryGridView.builder(
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    itemCount: productController.productList.length,
                    gridDelegate:
                        const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      return ProductTile(
                          product: productController.productList[index]);
                    },
                  );
                }),
              ),
            ),
          )
        ],
      ),
    );
  }
}
