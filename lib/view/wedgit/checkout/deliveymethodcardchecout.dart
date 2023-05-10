import 'package:flutter/material.dart';
import 'package:glaregroup/core/constant/color.dart';
import 'package:glaregroup/core/constant/imageasset.dart';

class DeliveryMethodCardCheckout extends StatelessWidget {
  final String textMethod;
  final String imageName;
  final bool isActive;
  final void Function()? onTapDeliveryMethod;
  const DeliveryMethodCardCheckout({Key? key, required this.textMethod, required this.isActive, this.onTapDeliveryMethod, required this.imageName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onTapDeliveryMethod,
      child: Card(
        color: isActive == true ? AppColor.primaryColor : AppColor.white,
        elevation: 10,
        shadowColor: AppColor.black.withOpacity(0.5),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
        ),
        child: Column(
          children: [
            Container(
              height: 190,
              width: 150,
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Image.asset(imageName, scale: 5,),
                  const SizedBox(height: 3),
                  Text(textMethod,
                    style: TextStyle(
                        color: isActive == true ?  AppColor.white : AppColor.primaryColor
                    ),)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
