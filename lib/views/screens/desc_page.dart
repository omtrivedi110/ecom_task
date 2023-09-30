import 'package:ecom_task/controller/cart_controller.dart';
import 'package:ecom_task/modals/cart_modals.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class DetailPage extends StatelessWidget {
  DetailPage({super.key});

  CartController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    Products products = ModalRoute.of(context)!.settings.arguments as Products;
    return Scaffold(
      appBar: AppBar(
        title: Text(products.title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: products.images
                      .map(
                        (e) => SizedBox(
                          height: s.height * 0.4,
                          child: Image.network(e.toString(), fit: BoxFit.cover),
                        ),
                      )
                      .toList(),
                ),
              ),
              const SizedBox(height: 50),
              Row(
                children: [
                  Expanded(child: Text(products.desc)),
                  const SizedBox(
                    width: 5,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("₹ ${products.price.toString()}"),
                      Text("Rating : ${products.rating} ⭐"),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Obx(() {
        return FloatingActionButton(
          onPressed: () {
            controller.addProduct(products: products);
          },
          child: Column(
            children: [
              Text(
                "${controller.cart_products.length}",
              ),
              const Icon(Icons.add_shopping_cart_outlined),
            ],
          ),
        );
      }),
    );
  }
}
