import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glaregroup/controller/orders/ordersarchive_controller.dart';
import 'package:glaregroup/core/constant/imageasset.dart';
import 'package:rating_dialog/rating_dialog.dart';



void showDialogRating (BuildContext context, String ordersid){
  showDialog(
    context: context,
    barrierDismissible: true, // set to false if you want to force a rating
    builder: (context) =>  RatingDialog(
      initialRating: 1.0,
      // your app's name?
      title: Text(
        '147'.tr,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      // encourage your user to leave a high rating?
      message: Text(
        '148'.tr,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 15),
      ),
      // your app's logo?
      image: Image.asset(AppImageAsset.logo,width: 150, height: 150,),
      submitButtonText: '146'.tr,
      commentHint: '149'.tr,
      onCancelled: () => print('cancelled'),
      onSubmitted: (response) {
        OrdersArchiveController controller = Get.find();
        //print('rating: ${response.rating}, comment: ${response.comment}');
        controller.submitRating(ordersid, response.rating, response.comment);

      },
    ),
  );
}