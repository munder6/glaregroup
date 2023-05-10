import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CheckoutButton extends StatelessWidget {
  final String textbutton;
  final void Function()? onPressed;
  const CheckoutButton({Key? key,this.onPressed,required this.textbutton}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      height: 50,
      textColor: Colors.white,
      color: AppColor.primaryColor,
      onPressed: onPressed,
      child:  Text(textbutton, style:const TextStyle(fontSize: 18),),
    );
  }
}
