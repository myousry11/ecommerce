// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
//
// class TestView extends StatefulWidget {
//   const TestView({super.key});
//
//   @override
//   State<TestView> createState() => _TestViewState();
// }
//
// class _TestViewState extends State<TestView> {
//   getToken() async {
//     String? myToken = await FirebaseMessaging.instance.getToken();
//     print("================================================");
//     print(myToken); // Ensure you get a token
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     getToken();
//     FirebaseMessaging.instance.subscribeToTopic("users").then((_) {
//       print("Successfully subscribed to 'users' topic");
//     }).catchError((error) {
//       print("Error subscribing to topic: $error");
//     });
//
//     // Listen for incoming messages
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       print("Received message: ${message.notification?.title} - ${message.notification?.body}");
//     });
//
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       print("Message clicked! ${message.notification?.title}");
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(
//         children: [
//           Text("data"),
//         ],
//       ),
//     );
//   }
// }
