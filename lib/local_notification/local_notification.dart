import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

/*
class LocalNotification{
  static final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static Future init()async{
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');
    final DarwinInitializationSettings initializationSettingsDarwin =
    DarwinInitializationSettings(
        onDidReceiveLocalNotification: (id, title,body,payload)=>null );
    final LinuxInitializationSettings initializationSettingsLinux =
    LinuxInitializationSettings(
        defaultActionName: 'Open notification');
    final InitializationSettings initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: initializationSettingsDarwin,
        linux: initializationSettingsLinux);
    _flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: (details)=> null,);
  }


  static Future showSimpleNotification({
    required String title,
    required String body,
    required String payload,
})async {
    const AndroidNotificationDetails androidNotificationDetails =
    AndroidNotificationDetails('your channel id', 'your channel name',
        channelDescription: 'your channel description',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker');
    const NotificationDetails notificationDetails =
    NotificationDetails(android: androidNotificationDetails);
    await _flutterLocalNotificationsPlugin.show(
        0, title, body, notificationDetails,
        payload: payload);
  }
}*/

class LocalNotificationService {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static onTap(NotificationResponse notificationResponse) {}

  static Future init() async {
    InitializationSettings settings = const InitializationSettings(
        android: AndroidInitializationSettings("@mipmap/ic_launcher"),
        iOS: DarwinInitializationSettings());
    flutterLocalNotificationsPlugin.initialize(
      settings,
      onDidReceiveNotificationResponse: onTap,
      onDidReceiveBackgroundNotificationResponse: onTap,
    );
  }

  static showBasicNotification() async {
    NotificationDetails details = const NotificationDetails(
      android: AndroidNotificationDetails("id 1", "Basic Notification",
          importance: Importance.max, priority: Priority.high),
    );
    await flutterLocalNotificationsPlugin.show(
        0, "Basic Notification", "body", details,
        payload: "Payload Details");
  }

  static showPeriodicalNotification() async {
    NotificationDetails details = const NotificationDetails(
      android: AndroidNotificationDetails("id 2", "Repeated Notification",
          importance: Importance.max, priority: Priority.high),
    );
    await flutterLocalNotificationsPlugin.periodicallyShow(
        1, "Repeated Notification", "body", RepeatInterval.everyMinute, details,
        payload: "Payload Details");
  }

  static Future<void> showScheduledNotification() async {
    AndroidNotificationDetails android = const AndroidNotificationDetails(
        "id 3", "Schedule Notification",
        importance: Importance.max, priority: Priority.high);
    NotificationDetails details = NotificationDetails(
      android: android,
    );
    tz.initializeTimeZones();
    /* print("${tz.local.name}");
    print("${tz.TZDateTime.now(tz.local).hour.toString()}");*/
    await flutterLocalNotificationsPlugin.zonedSchedule(
      2,
      "Schedule Notification",
      "body",
      tz.TZDateTime(tz.local,2024,5,5,8,43),
      details,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  static cancelNotification(int id) async {
    flutterLocalNotificationsPlugin.cancel(id);
  }
}
