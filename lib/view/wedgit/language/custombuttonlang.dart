import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomButtonLang extends StatelessWidget {
  final String textbutton;
  final void Function()? onPressed;
  const CustomButtonLang({Key? key, required this.textbutton, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
      padding: const EdgeInsets.symmetric(horizontal: 30
      ),
      width: double.infinity,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50)
        ),
        child: MaterialButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          height: 45,
          textColor: Colors.white,
          color: AppColor.primaryColor,
          onPressed: onPressed,
          child:  Text(textbutton),
        ),
      ),
    );
  }
}
