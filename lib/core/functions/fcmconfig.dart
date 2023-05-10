import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';
import 'package:glaregroup/controller/orders/orderpending_controller.dart';
import 'package:glaregroup/core/constant/color.dart';


requestPermissionNotification()async{
  NotificationSettings settings = await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}

fcmConfig(){
  FirebaseMessaging.onMessage.listen((message) {
    print("==================Notification===================");
    print(message.notification!.title);
    print(message.notification!.body);
    FlutterRingtonePlayer.playNotification(volume: 100);
    Get.snackbar(
        "${message.notification!.title}", "${message.notification!.body}",
      backgroundColor: AppColor.white
    );
    refreshPageNotification(message.data);
  });
}


refreshPageNotification(data){
  print("=================== Page Id==================");
  print(data['pageid']);
  print("=================== Page Name==================");
  print(data['pagename']);
  print("=================== Current Route ==================");
  print(Get.currentRoute);

  if(Get.currentRoute == "/orderspending" && data['pagename'] == "refreshorderpending"){
    OrdersPendingController controller = Get.find();
    controller.refreshOrder();
  }
}