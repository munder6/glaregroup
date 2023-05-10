import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomButtonCoupon extends StatelessWidget {
  final String textbutton;
  final void Function()? onPressed;
  const CustomButtonCoupon({Key? key,this.onPressed,required this.textbutton}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50)
        ),
        child: MaterialButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          height: 50,
          textColor: Colors.white,
          color: AppColor.primaryColor,
          onPressed: onPressed,
          child:  Text(textbutton, style:const TextStyle(fontSize: 18),),
        ),
      ),
    );
  }
}
