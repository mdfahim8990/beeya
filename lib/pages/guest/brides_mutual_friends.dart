import 'package:beeya/components/custom_button.dart';
import 'package:beeya/config/them_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BridesMutualFriend extends StatefulWidget {
  const BridesMutualFriend({super.key});

  @override
  State<BridesMutualFriend> createState() => _BridesMutualFriendState();
}

class _BridesMutualFriendState extends State<BridesMutualFriend> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: themBackGround,
      appBar: AppBar(
        title: const Text("Bride's Mutual Friends"),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: EdgeInsets.only(left: 12.sp),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        actions: [
          CustomButton(
            onPressed: () async {},
            backGroundColor: themPinkColor,
            textColor: Colors.white,
            buttonText: "Edit",
            buttonTextSize: 11.sp,
            icons: Padding(
              padding: EdgeInsets.only(right: 3.w),
              child: const Icon(Icons.edit_calendar_sharp),
            ),
          ),
          SizedBox(
            width: 10.w,
          )
        ],
      ),
      body: SafeArea(
        child: Column(

          children: [
            Container(
              color: themBlack,
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: width*0.06 , vertical: 5),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Text("Name",style: TextStyle(color: Colors.white),),

                    ),
                    Expanded(
                      flex: 3,
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Attendance",style: TextStyle(color: Colors.white),),
                          Text("Table No.",style: TextStyle(color: Colors.white),),
                        ],
                      ),
                    ),



                  ],
                ),
              ),
            ),
            SizedBox(
              height: height*.85,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width*0.06 , vertical: 5),
                child: ListView.builder(
                  itemCount: 50,
                  itemBuilder: (context, index) {
                    return  Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 5,
                                child: Row(
                                  children: [
                                    Text("$index ",style: TextStyle(color: themPinkColor,fontSize: 11.sp),),
                                    Text("  Full Name",style: TextStyle(color: Colors.black,fontSize: 11.sp),),
                                  ],
                                ),

                              ),
                              Expanded(
                                flex: 3,
                                child:  Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: width*0.03),
                                  child:  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [

                                  index/2 == 0 ?    Icon(Icons.check_circle,color: Colors.grey,size: 15.sp):Icon(Icons.check_circle,color: Colors.green,size: 15.sp),
                                      Text("02",style: TextStyle(color: Colors.black,fontSize: 11.sp),),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(),
                      ],
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
