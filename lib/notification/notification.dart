import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static bool isNotificationsEnabled = false;
  static Duration intervalBetweenNotifications = const Duration(seconds: 10);
  static Duration intervalBetweenNightNotifications = const Duration(seconds: 10);
  static DateTime selectedTime = DateTime.now();
  static DateTime selectedTimeNight = DateTime.now();
  static DateTime endTime = DateTime.now().add(Duration(minutes:30));
  static DateTime endTimeNight = DateTime.now().add(Duration(minutes:30));


  static Future<void> onDidReceiveNotification(
      NotificationResponse notificationResponse) async {
    // Handle the notification interaction
    if (notificationResponse.payload != null) {
      debugPrint("Notification payload: ${notificationResponse.payload}");
      // Navigate to a specific screen or perform an action
    }
  }

  static Future<void> init() async {
    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings("@mipmap/ic_launcher");

    const DarwinInitializationSettings iosInitializationSettings =
        DarwinInitializationSettings();

    const InitializationSettings initializationSettings =
        InitializationSettings(
            android: androidInitializationSettings,
            iOS: iosInitializationSettings);

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        print("Notification clicked with payload: ${response.payload}");
      },
    );

    //request permission from android
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  //show instant notification
  static Future<void> showInstantNotification(String title, String body) async
  {
     const  NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: AndroidNotificationDetails(
        "channel_Id",
        "channel_Name",
        channelDescription: 'description',
        importance: Importance.max,
        priority: Priority.high,
      ),
      iOS: DarwinNotificationDetails(),
    );
    await flutterLocalNotificationsPlugin.show(
        0, title, body, platformChannelSpecifics);
  }

  static Future<void> scheduleNotification(
      List<String> messages, DateTime time,Duration separateTime,DateTime endTime) async {
    tz.TZDateTime scheduledTime = tz.TZDateTime.from(
     time,
        tz.local
    );

    tz.TZDateTime stopTime = tz.TZDateTime.from(
        endTime,
        tz.local
    );

     const  NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: AndroidNotificationDetails(
        "channel_Id",
        "channel_Name",
        channelDescription: 'description',
        importance: Importance.max,
        priority: Priority.high,
      ),
      iOS: DarwinNotificationDetails(),
    );
    if (scheduledTime.isBefore(tz.TZDateTime.now(tz.local))) {
      scheduledTime = scheduledTime.add(Duration(days: 1));
    }

    for (int i = 0; i < messages.length; i++) {
      if (scheduledTime.isBefore(stopTime)) {
        tz.TZDateTime notifyTime = tz.TZDateTime.from(scheduledTime, tz.local);

      tz.TZDateTime notificationTime =
      notifyTime.add(Duration(seconds: i * separateTime.inSeconds));
      print("Notification scheduled at: $notificationTime");


     await flutterLocalNotificationsPlugin.zonedSchedule(
        i,
        "Azkar",
        messages[i],
       notificationTime,
        platformChannelSpecifics,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        matchDateTimeComponents: DateTimeComponents.time, // Repeat daily
      );
      print("Notification scheduled: ${messages[i]} at $notificationTime");

    }else {
        print("Notification skipped: ${messages[i]} (end time reached)");
        break;
      }
    print("+++++++++++++++++++++++++++++++++++++++++++++++");
    print(tz.TZDateTime.now);
  }
  }

 static Future<void> schedulePrayerNotification(
      String title, String body, DateTime time) async {
    tz.TZDateTime scheduledTime = tz.TZDateTime.from(
        time,
        tz.local
    );
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
        "channel_Id",
        "channel_Name",
        channelDescription: 'description',
        importance: Importance.max,
      priority: Priority.high,
        sound: RawResourceAndroidNotificationSound('beautifull_azan')
    );

    const NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      title,
      body,
      scheduledTime,
      platformChannelSpecifics,
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime,
      androidScheduleMode:AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

}
