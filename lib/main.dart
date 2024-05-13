import 'package:beeya/local_notification/local_notification.dart';
import 'package:beeya/pages/auth/sing_in.dart';
import 'package:beeya/pages/gift/gift_payment.dart';
import 'package:beeya/pages/gift/send_gift.dart';
import 'package:beeya/pages/guest/add_guest.dart';



import 'package:beeya/pages/guest/guest_details.dart';
import 'package:beeya/pages/guest/guest_list.dart';
import 'package:flutter/material.dart';
import 'package:beeya/pages/launchig_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'components/custom_text_field.dart';
import 'pages/guest/brides_mutual_friends.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  //WidgetsFlutterBinding.ensureInitialized();
await LocalNotificationService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
       // useMaterial3: true,
      ),
      home:   BridesMutualFriend(),
    );
  }
}
