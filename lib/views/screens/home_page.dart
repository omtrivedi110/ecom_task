import 'package:ecom_task/controller/cart_controller.dart';
import 'package:ecom_task/modals/cart_modals.dart';
import 'package:ecom_task/utils/routes_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});

  CartController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(MyRoutes.cart);
            },
            icon: const Icon(Icons.shopping_cart_rounded),
          ),
          PopupMenuButton(
              icon: const Icon(Icons.sort),
              itemBuilder: (ctx) => [
                    PopupMenuItem(
                      child: ElevatedButton(
                        onPressed: () => controller.sortingAZ(),
                        child: const Icon(Icons.sort_by_alpha_rounded),
                      ),
                    ),
                    PopupMenuItem(
                      child: ElevatedButton(
                        onPressed: () => controller.sortingZA(),
                        child: const Text("Z-A"),
                      ),
                    ),
                    PopupMenuItem(
                      child: TextButton.icon(
                        onPressed: () => controller.sortRating(),
                        icon: const Icon(Icons.star),
                        label: const Text("Rating"),
                      ),
                    ),
                    PopupMenuItem(
                      child: TextButton(
                        onPressed: () {
                          controller.sortPriceLH();
                        },
                        child: const Text("Low Price"),
                      ),
                    ),
                    PopupMenuItem(
                      child: TextButton(
                        onPressed: () {
                          controller.sortPriceHL();
                        },
                        child: const Text("High Price"),
                      ),
                    ),
                    PopupMenuItem(
                      child: TextButton(
                        onPressed: () {
                          controller.sortCategoryAZ();
                        },
                        child: const Text("Category A-Z"),
                      ),
                    ),
                    PopupMenuItem(
                      child: TextButton(
                        onPressed: () {
                          controller.sortCategoryZA();
                        },
                        child: const Text("Category Z-A"),
                      ),
                    ),
                  ]),
        ],
      ),
      body: FutureBuilder(
        future: controller.getAllProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Obx(() {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: GridView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    Products products = snapshot.data![index];
                    return GestureDetector(
                      onTap: () =>
                          Get.toNamed(MyRoutes.desc, arguments: products),
                      child: GridTile(
                        header: Text(
                          products.title,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        child: Image.network(
                          products.thumb,
                          fit: BoxFit.fill,
                        ),
                      ),
                    );
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                  ),
                ),
              );
            });
          } else if (snapshot.hasError) {
            return Text(
              snapshot.error.toString(),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
