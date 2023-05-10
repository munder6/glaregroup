import 'package:flutter/material.dart';
import 'package:glaregroup/core/constant/color.dart';

class CardPaymentMethod extends StatelessWidget {
  final String title;
  final bool isActive;
  final IconData? icon;
  const CardPaymentMethod({Key? key, required this.title, required this.isActive, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Card(
      color: isActive == true ? AppColor.primaryColor : AppColor.white,
      elevation: 10,
      shadowColor: AppColor.black.withOpacity(0.5),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
      ),
      child:  ListTile(
        title:  Text(title,
          style: TextStyle(
              color:  isActive == true ? AppColor.white : AppColor.black
          ),
        ),
        trailing: Icon(icon,
          color: isActive == true ? AppColor.white :null,
        ),
      ),
    );
  }
}
