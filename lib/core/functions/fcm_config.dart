import 'package:ecommerce/controller/orders/order_pending_controller.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> requestPermissionNotification() async {
  NotificationSettings settings =
      await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print("User granted permission for notifications");
  } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    print("User granted provisional permission");
  } else {
    print("User declined or has not accepted notification permission");
  }
}

Future<void> initializeLocalNotifications() async {
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher'); // أيقونة الإشعار

  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
}

void showNotification(RemoteMessage message) {
  const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    'your_channel_id', // ID القناة
    'your_channel_name', // اسم القناة
    channelDescription: 'your_channel_description', // وصف القناة
    importance: Importance.max,
    priority: Priority.high,
    showWhen: true,
  );

  const NotificationDetails platformChannelSpecifics = NotificationDetails(
    android: androidPlatformChannelSpecifics,
  );

  flutterLocalNotificationsPlugin.show(
    message.notification.hashCode, // معرف الإشعار
    message.notification?.title, // عنوان الإشعار
    message.notification?.body, // نص الإشعار
    platformChannelSpecifics,
  );
}

void fcmConfig() {
  FirebaseMessaging.onMessage.listen((RemoteMessage remoteMessage) {
    print("============= Notification Received =============");
    print(remoteMessage.notification?.title);
    print(remoteMessage.notification?.body);

    // عرض الإشعار محليًا باستخدام flutter_local_notifications
    showNotification(remoteMessage);
    refreshPageNotification(remoteMessage.data);
  });
}

refreshPageNotification(data) {
  print(Get.currentRoute);
  print(data);

  if (Get.currentRoute == "/home" && data['pagename'] == "refreshorderpending") {
    print("Refreshing orders...");
    OrdersPendingController controller = Get.find();
    controller.refreshOrder();
    controller.update();
  }
}
