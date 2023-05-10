import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glaregroup/core/constant/color.dart';



class CustomButtonAddAddress extends StatelessWidget {

  final String text;
  final void Function()? onPressed;


  const CustomButtonAddAddress({Key? key, required this.text, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 50,right: 50),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        padding: const EdgeInsets.symmetric(vertical: 15),
        onPressed: onPressed,
        color: AppColor.primaryColor,
        textColor: Colors.white,
        child: Text(text),
      ),
    );
  }
}
