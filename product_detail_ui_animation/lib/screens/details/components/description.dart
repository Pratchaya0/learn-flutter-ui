import 'package:flutter/material.dart';
import 'package:product_detail_ui_animation/constants.dart';
import 'package:product_detail_ui_animation/models/Product.dart';

class Description extends StatelessWidget {
  final Product product;

  const Description({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: Text(
        product.description,
        style: const TextStyle(height: 1.5),
      ),
    );
  }
}
