import 'package:flutter/material.dart';
import 'package:glaregroup/core/constant/color.dart';

class AddressChooseCheckout extends StatelessWidget {
  final String title;
  final String subtitle;
  final void Function()? onTapAddressChoose;
  final bool isActive;
  final IconData? iconAddress;

  const AddressChooseCheckout({Key? key, required this.title, required this.subtitle, required this.isActive, this.onTapAddressChoose, this.iconAddress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapAddressChoose,
      child: Card(
        color: isActive == true ? AppColor.primaryColor : AppColor.white,
        elevation: 10,
        shadowColor: AppColor.black.withOpacity(0.5),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
        ),
        child:  ListTile(
          title: Text(title, style: TextStyle(color: isActive == true ? AppColor.white : AppColor.black),),
          subtitle: Text(subtitle,style: TextStyle(color: isActive == true ? Colors.white70 : null),),
          trailing: Icon(iconAddress, color: isActive == true ? AppColor.white :null),
        ),
      ),
    );
  }
}
