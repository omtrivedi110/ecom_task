import 'package:ecom_task/utils/routes_utils.dart';
import 'package:ecom_task/views/screens/cart_page.dart';
import 'package:ecom_task/views/screens/desc_page.dart';
import 'package:ecom_task/views/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/cart_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  CartController controller = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
      ),
      getPages: [
        GetPage(name: MyRoutes.home, page: () => HomePage()),
        GetPage(name: MyRoutes.cart, page: () => CartPage()),
        GetPage(name: MyRoutes.desc, page: () => DetailPage()),
      ],
    );
  }
}
