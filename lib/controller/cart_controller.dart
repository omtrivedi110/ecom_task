import 'dart:developer';
import 'package:ecom_task/helpers/cart_helper.dart';
import 'package:ecom_task/modals/cart_modals.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  RxInt amount = 0.obs;
  RxList<Products> cart_products = <Products>[].obs;
  RxList<Products> allProducts = <Products>[].obs;
  RxInt tmp_amount = 0.obs;

  Future<List<Products>?> getAllProducts() async {
    allProducts(await ApiHelper.apiHelper.assign());
    return allProducts;
  }

  addProduct({required Products products}) {
    if (cart_products.contains(products)) {
      return Get.snackbar(
        "Already Added !!😊",
        "Done",
      );
    } else {
      cart_products.add(products);
      return Get.snackbar(
        "Added..😊",
        "Thak You !",
      );
    }
  }

  totalAmount() {
    amount = 0.obs;
    for (var element in cart_products) {
      tmp_amount.value += element.price;
      tmp_amount.value *= element.qty.toInt();
      amount.value += tmp_amount.toInt();
      tmp_amount = 0.obs;
    }
  }

  increaseQty({required int index}) {
    cart_products[index].qty.value++;
  }

  decrease({required int index}) {
    if (cart_products[index].qty.value == 0) {
      cart_products.removeAt(index);
    } else {
      cart_products[index].qty.value--;
    }
  }

  sortingAZ() {
    allProducts.sort(
      (a, b) => a.title.toLowerCase().compareTo(
            b.title.toLowerCase(),
          ),
    );
  }

  sortingZA() {
    allProducts.sort(
      (a, b) => b.title.toLowerCase().compareTo(
            a.title.toLowerCase(),
          ),
    );
  }

  sortCategoryAZ() {
    allProducts.sort(
        (a, b) => a.category.toLowerCase().compareTo(b.category.toLowerCase()));
  }

  sortCategoryZA() {
    allProducts.sort(
        (a, b) => b.category.toLowerCase().compareTo(a.category.toLowerCase()));
  }

  sortPriceLH() {
    allProducts.sort((a, b) => a.price.compareTo(b.price));
  }

  sortPriceHL() {
    allProducts.sort((a, b) => b.price.compareTo(a.price));
  }

  sortRating() {
    int c = 0;
    allProducts.sort((a, b) {
      if (double.parse(a.rating.toString()) <
          double.parse(b.rating.toString())) {
        c++;
        log(allProducts[c].rating.toString());
        return 0;
      } else {
        return 1;
      }
    });
  }

  delete({required Products products}) {
    cart_products.remove(products);
  }
}
