import 'package:beeya/components/custom_button.dart';
import 'package:beeya/local_notification/local_notification.dart';
import 'package:flutter/material.dart';

class LaunchingPage extends StatefulWidget {
  const LaunchingPage({Key? key}) : super(key: key);

  @override
  State<LaunchingPage> createState() => _LaunchingPageState();
}

class _LaunchingPageState extends State<LaunchingPage> {
  @override
  Widget build(BuildContext context) {
    double height  = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return  Material(
      child: Scaffold(
      
        body: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/cover.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(image: const AssetImage("assets/images/love_icon.png"),height: height/4,),
                  Text(
                    "Beeya",
                    style: TextStyle(fontFamily: 'Cormorant',fontSize: height/13,color: Colors.white,fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: height*.04,),
                  CustomButton(onPressed: (){
                    LocalNotificationService.showBasicNotification();
                  }, backGroundColor: Colors.orangeAccent.shade100, buttonText: "Sign In"),
                  SizedBox(height: height*.02,),
                  CustomButton(onPressed: (){
                    LocalNotificationService.showPeriodicalNotification();
                  }, backGroundColor: Colors.white,textColor: Colors.black, buttonText: "Send e-Gift"),
                  SizedBox(height: height*.02,),
                  CustomButton(onPressed: ()async{
                   await LocalNotificationService.showScheduledNotification();
                  }, backGroundColor: Colors.white10, borderColor:Colors.orangeAccent.shade100 ,textColor: Colors.orangeAccent.shade100, buttonText: "Sign Up")
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
