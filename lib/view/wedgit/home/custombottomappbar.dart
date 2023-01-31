import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';



class CustomButtonAppBar extends StatelessWidget {
  final void Function()? onPressed;
  final String textBottom;
  final IconData iconData;
  final bool? active ;

  CustomButtonAppBar({Key? key,
   required this.textBottom,
   required this.iconData,
   this.onPressed,
   required this.active
 }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed ,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children:  [
          Icon(iconData, color: active == true ? AppColor.primaryColor : AppColor.greydark),
          //Text(textBottom, style: TextStyle(color: active == true ? AppColor.secondColor : AppColor.greydark),)
        ],
      ),
    );
  }
}
