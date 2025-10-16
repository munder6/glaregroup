import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';
import 'package:glaregroup/controller/orders/orderpending_controller.dart';
import 'package:glaregroup/core/constant/color.dart';

final _ringtone = FlutterRingtonePlayer();

Future<void> requestPermissionNotification() async {
  final settings = await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  print('Notification permission: ${settings.authorizationStatus}');
}

void fcmConfig() {
  FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
    print("================== Notification (onMessage) ===================");
    print("Title: ${message.notification?.title}");
    print("Body : ${message.notification?.body}");
    print("Data : ${message.data}");

    await _ringtone.play(
      android: AndroidSounds.notification,
      ios: IosSounds.glass,
      volume: 1.0,
      looping: false,
      asAlarm: false,
    );

    Get.snackbar(
      message.notification?.title ?? "Notification",
      message.notification?.body ?? "",
      backgroundColor: AppColor.white,
      duration: const Duration(seconds: 3),
    );

    refreshPageNotification(message.data);
  });

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    print("================== Notification (openedApp) ===================");
    print("Data : ${message.data}");
    refreshPageNotification(message.data);
  });
}

void refreshPageNotification(Map<String, dynamic> data) {
  print("=================== Page Id ==================");
  print(data['pageid']);
  print("=================== Page Name ==================");
  print(data['pagename']);
  print("=================== Current Route ==================");
  print(Get.currentRoute);

  if (Get.currentRoute == "/orderspending" &&
      data['pagename'] == "refreshorderpending") {
    final OrdersPendingController controller = Get.find();
    controller.refreshOrder();
  }
}
