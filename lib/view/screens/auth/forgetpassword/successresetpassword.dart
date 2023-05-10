import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glaregroup/controller/auth/successresetpassword_controller.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/constant/imageasset.dart';
import '../../../wedgit/auth/custombuttonauth.dart';



class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SuccessResetPasswordControllerImp controller = Get.put(SuccessResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title:  Text("38".tr, style: Theme.of(context).textTheme.headline1!.copyWith(color: AppColor.grey)),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children:  [
            //const Center(child: Icon(Icons.check_circle_outline, size: 200,color: AppColor.primaryColor,)),
            const SizedBox(height: 30,),
            Image.asset(AppImageAsset.successall),
            const SizedBox(height: 70,),
            Text("36".tr,textAlign: TextAlign.center,),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: CustomButtonAuth(
                  text: "37".tr,
                  onPressed: () {
                    controller.goToPageLogin();
                  }
              ),
            ),
          ],
        ),
      ) ,

    );
  }
}
