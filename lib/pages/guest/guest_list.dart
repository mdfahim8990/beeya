import 'dart:math';

import 'package:beeya/components/custom_button.dart';
import 'package:beeya/config/them_config.dart';
import 'package:beeya/local_notification/local_notification.dart';
import 'package:beeya/pages/guest/guest_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GuestListPage extends StatefulWidget {
  const GuestListPage({Key? key}) : super(key: key);

  @override
  State<GuestListPage> createState() => _GuestListPageState();
}

class _GuestListPageState extends State<GuestListPage> {
  TextEditingController searchController = TextEditingController();
  final double _progressValue = 0.5;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    final height = MediaQuery.of(context).size.height -
        AppBar().preferredSize.height -
        MediaQuery.of(context).padding.top;
    double width = MediaQuery.of(context).size.width;
    final landscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Scaffold(
      backgroundColor: themBackGround,
      appBar: AppBar(
        title: const Text("Guest List"),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black, // it's fahim check for push update
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          CustomButton(
            onPressed: () async {
              await LocalNotificationService.showScheduledNotification();
            },
            backGroundColor: themPinkColor,
            textColor: Colors.white,
            buttonText: "Add",
            buttonTextSize: 11.sp,
            icons: Padding(
              padding: EdgeInsets.only(right: 6.w, left: 5),
              child: const Icon(Icons.person_add_alt_outlined),
            ),
          ),
          SizedBox(
            width: 10.w,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: height * .005,
              ),
              ClipPath(
                clipper: CustomClipPath(),
                child: Container(
                  width: width,
                  color: themPinkColor,
                  height: 140.h,
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "250/500",
                        style: TextStyle(
                            fontSize: 60.sp,
                            fontFamily: 'Cormorant',
                            color: Colors.white),
                      ),
                      Text(
                        "Confirmed Guest",
                        style: TextStyle(fontSize: 12.sp, color: Colors.white),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        width: width / 4,
                        child: LinearProgressIndicator(
                          value: _progressValue,
                          backgroundColor: Colors.grey,
                          valueColor:
                              const AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height * .02,
              ),
              Padding(
                padding:  EdgeInsets.only(left: 20.sp,right: 20.sp),
                child: CustomButton(onPressed: (){}, backGroundColor: themPinkColor, buttonText: 'Send Invite',buttonTextSize: 11.sp),
              ),
              SizedBox(
                height: height * .01,
              ),
              Container(
                color: themBlack,
                child: Padding(
                  padding: EdgeInsets.only(top: 15.0.sp),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20.sp, right: 20.sp),
                        child: SizedBox(
                          height: 40.h,
                          child: TextFormField(
                            controller: searchController,
                            keyboardType: TextInputType.text,
                            onFieldSubmitted: (String value) {
                              // FocusScope.of(context).requestFocus(_passwordFocus);
                            },
                            decoration: InputDecoration(
                              labelText: 'Search by name',
                              labelStyle: TextStyle(fontSize: 15.sp),
                              filled: true,
                              fillColor: Colors.white,
                              suffixIcon: const Icon(
                                Icons.search,
                                size: 30,
                                color: Colors.black26,
                              ),
                              hintStyle: const TextStyle(color: Colors.black26),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black26),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.orangeAccent),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * .01,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: width * .08,
                            right: width * .08,
                            bottom: 5,
                            top: 5),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Name",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "Additional Guest",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "Attendance",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 380.h,
                child: ListView.builder(
                  itemCount: 50,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                          left: width * .03, right: width * .1, top: 8),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const GuestDetails()),
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                              //SizedBox(width: 10.sp,),
                                Text(
                                  "Full Name",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 12.sp),
                                ),
                                Text(
                                  "02",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 12.sp),
                                ),
                                Icon(
                                  Icons.check_circle,
                                  size: 18.sp,
                                  color: Colors.green,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: width * .9,
                            child: const Divider(),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final roundingHeight = size.height * 3 / 3.5;

    final filledRectangle =
        Rect.fromLTRB(0, 0, size.width, size.height - roundingHeight);
    final roundingRectangle = Rect.fromLTRB(
        -5, size.height - roundingHeight * 2, size.width + 5, size.height);

    final path = Path();
    path.addRect(filledRectangle);

    path.arcTo(roundingRectangle, pi, -pi, true);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
