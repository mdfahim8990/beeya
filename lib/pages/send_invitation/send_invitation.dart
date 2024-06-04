import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SendInvitationPage extends StatefulWidget {
  const SendInvitationPage({Key? key}) : super(key: key);

  @override
  State<SendInvitationPage> createState() => _SendInvitationPageState();
}

class _SendInvitationPageState extends State<SendInvitationPage> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(color: Colors.red, height: 100,width: 100,),
            const SizedBox(height: 25),  // SizedBox used for spacing
            Container(color: Colors.green, height: 100,width: 400,),
            const SizedBox(height: 25),  // SizedBox used for spacing
            Container(color: Colors.blue, height: 100,width: 600,),
            const SizedBox(height: 25),  // SizedBox used for spacing
            Container(color: Colors.orange, height: 100,width: 400,),
            const SizedBox(height: 25),  // SizedBox used for spacing
            Container(color: Colors.greenAccent, height: 100,width: 100,),
          ],
        ),
      ),
    );
  }
}
