import 'package:get/get_rx/src/rx_types/rx_types.dart';

class Products {
  final String title;
  final String desc;
  final int price;
  final String thumb;
  final List images;
  final dynamic rating;
  final String category;
  RxInt qty = 1.obs;

  Products({
    required this.desc,
    required this.images,
    required this.price,
    required this.thumb,
    required this.category,
    required this.rating,
    required this.title,
  });

  factory Products.formMap({required Map data}) {
    return Products(
      desc: data['description'],
      images: data['images'],
      price: data['price'],
      category: data['category'],
      thumb: data['thumbnail'],
      title: data['title'],
      rating: data['rating'],
    );
  }
}
