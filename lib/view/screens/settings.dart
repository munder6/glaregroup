import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:glaregroup/core/constant/color.dart';
import 'package:glaregroup/core/constant/imageasset.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                height: Get.width / 3,
                color: AppColor.primaryColor,
              ),
              Positioned(
                  top: Get.width / 4.5,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.circular(100)
                    ),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.grey[100],
                      backgroundImage: const AssetImage(AppImageAsset.logo),
              ),
                  )),
            ],
          ),
          const SizedBox(height: 100),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Card(
              child: Column(
                children:  [
                  ListTile(
                    onTap: (){},
                    title: const Text("Disable Notifications"),
                    trailing: const Icon(Icons.notifications_off_outlined),
                  ),
                //  const Divider(),
                  ListTile(
                    onTap: (){},
                    title: const Text("Address"),
                    trailing: const Icon(Icons.location_on),
                  ),
                 // const Divider(),
                  ListTile(
                    onTap: (){},
                    title: const Text("About Us"),
                    trailing: const Icon(Icons.info_outline),
                  ),
                 // const Divider(),
                  ListTile(
                    onTap: (){},
                    title: const Text("Contact Us"),
                    trailing: const Icon(Icons.contact_support_outlined),
                  ),
                //  const Divider(),
                  ListTile(
                    onTap: (){
                      
                    },
                    title: const Text("Logout"),
                    trailing: const Icon(Icons.logout),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
