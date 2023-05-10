import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CartItemsCount extends StatelessWidget {
  final String message;
  const CartItemsCount({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.symmetric(horizontal: 50),
      padding: const EdgeInsets.all(10),
      //height: 40,
      decoration: BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.circular(20)
      ),
      child: Text(message,textAlign: TextAlign.center, style: const TextStyle(color: AppColor.white,)),
    );
  }
}
