import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../models/products_model.dart';

class ProductTile extends StatelessWidget {
  var productAvailable = true;
  final Product product;
  ProductTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 180,
                  width: double.infinity,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: product.imageLink != null
                      ? Image.network(
                          product.imageLink,
                          fit: BoxFit.cover,
                        )
                      : Image.asset("images/baba.jpg"),
                ),
                Positioned(
                  //  Obx(
                  //   (() => CircleAvatar(
                  //       backgroundColor: Colors.white,
                  //       child: IconButton(
                  //         icon: const Icon(Icons.favorite_rounded),
                  //         onPressed: () {},
                  //       ))),
                  // ),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: const Icon(Icons.favorite_outline),
                      onPressed: () {},
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 8),
            Text(
              product.name,
              maxLines: 2,
              style: const TextStyle(
                  fontFamily: 'avenir', fontWeight: FontWeight.w600),
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            if (product.rating != null)
              Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      product.rating.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                    const Icon(
                      Icons.star,
                      size: 16,
                      color: Colors.blue,
                    )
                  ],
                ),
              ),
            SizedBox(height: 8),
            Text(
              '\$${product.price}',
              style: const TextStyle(fontSize: 32, fontFamily: 'avenir'),
            )
          ],
        ),
      ),
    );
  }
}
