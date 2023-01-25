import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';



class TextSignUp extends StatelessWidget {

  final String text;
  final String text2;
  final void Function() onTap;


  const TextSignUp({Key? key, required this.text, required this.text2, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text2),
        const SizedBox(width: 3,),
        InkWell(
          onTap: onTap,
          child:
          Text(text, style: const TextStyle(color: AppColor.primaryColor),),
        )
      ],
    );
  }
}
