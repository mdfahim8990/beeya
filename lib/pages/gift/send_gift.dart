import 'package:beeya/components/custom_button.dart';
import 'package:beeya/components/custom_text_field.dart';
import 'package:beeya/config/them_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SendGiftPage extends StatefulWidget {
  const SendGiftPage({Key? key}) : super(key: key);

  @override
  State<SendGiftPage> createState() => _SendGiftPageState();
}

class _SendGiftPageState extends State<SendGiftPage> {
  TextEditingController toController = TextEditingController();
  TextEditingController fromController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController massageController = TextEditingController();

  bool button1 = false;
  bool button2 = false;
  bool button3 = false;
  bool button4 = false;

  bool payButton1 = false;
  bool payButton2 = false;
  bool payButton3 = false;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      backgroundColor: themBackGround,
      appBar: AppBar(
        title: const Text("Send e-Gift"),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0),
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
      ),
      body: SingleChildScrollView(

        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 20.0.sp, right: 20.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextField(
                  controller: toController,
                  levelText: "To",
                  hintText: 'Full Name',
                  enabledBorderColor: themPinkColor,
                  keyboardType: TextInputType.text,
                  suffixIcon: const Icon(Icons.check_circle,color: Colors.green,),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  "Amount",
                  style: TextStyle(fontSize: 10.sp, color: themPinkColor),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(right: 3.0.w),
                      child: SizedBox(
                        //width: 60.w,
                        child: CustomButton(
                          onPressed: () {
                            setState(() {
                              if (button1 != true) {
                                button1 = true;
                                button2 = false;
                                button3 = false;
                                button4 = false;
                              }
                            });
                          },
                          icons: Icon(Icons.euro),
                          backGroundColor: Colors.white,
                          borderColor:
                              button1 ? themPinkColor : Colors.grey.shade400,
                          buttonText: "20",
                          buttonTextSize: 10.sp,
                          textColor: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left: 3.0.w,right: 3.w),
                      child: SizedBox(
                       // width: 60.w,
                        child: CustomButton(
                          onPressed: () {
                            setState(() {
                              if (button2 != true) {
                                button1 = false;
                                button2 = true;
                                button3 = false;
                                button4 = false;
                              }
                            });
                          },
                          icons: Icon(Icons.euro),
                          backGroundColor: Colors.white,
                          borderColor:
                              button2 ? themPinkColor : Colors.grey.shade400,
                          buttonText: "50",
                          buttonTextSize: 10.sp,
                          textColor: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left: 3.w,right: 3.w),
                      child: SizedBox(
                        //width: 60.w,
                        child: CustomButton(
                          onPressed: () {
                            setState(() {
                              if (button3 != true) {
                                button1 = false;
                                button2 = false;
                                button3 = true;
                                button4 = false;
                              }
                            });
                          },
                          icons: Icon(Icons.euro),
                          backGroundColor: Colors.white,
                          borderColor:
                              button3 ? themPinkColor : Colors.grey.shade400,
                          buttonText: "100",
                          buttonTextSize: 10.sp,
                          textColor: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left: 3.0.w,),
                      child: SizedBox(
                        //width: 60.w,
                        child: CustomButton(
                          onPressed: () {
                            setState(() {
                              if (button4 != true) {
                                button1 = false;
                                button2 = false;
                                button3 = false;
                                button4 = true;
                              }
                            });
                          },
                          icons: Icon(Icons.euro),
                          backGroundColor: Colors.white,
                          borderColor:
                              button4 ? themPinkColor : Colors.grey.shade400,
                          buttonText: "200",
                          buttonTextSize: 10.sp,
                          textColor: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h,),
                TextFormField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  focusNode: FocusNode(),
                  //onFieldSubmitted: (value) => onFieldSubmitted!(value),
                 // validator: (input) => validator!(input),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: "Or Other Amount",
                    labelStyle: TextStyle(color:Colors.grey.shade500,fontSize: 8.sp),
                    /*hintText: "Or Other Amount",
                    hintStyle: TextStyle(color: Colors.grey.shade400),*/
                   // prefixIcon: icon,
                    icon: const Icon(Icons.euro),
                    enabledBorder: const OutlineInputBorder(
                      borderSide:
                      BorderSide(color:  Colors.black26,width: 1.5),
                      borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide:
                      BorderSide(color: themPinkColor,width: 1.5),
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                  ),
        
                ),
                SizedBox(height: 8.h,),
                Divider(),
                SizedBox(height: 5.h,),
                CustomTextField(
                  controller: fromController,
                  levelText: "From",
                  hintText: 'Full Name',
                  enabledBorderColor: themPinkColor,
                  keyboardType: TextInputType.text,
                ),
                SizedBox(height: 10.h,),
                Text(
                  "Massage",
                  style: TextStyle(fontSize: 10.sp, color: themPinkColor),
                ),
                SizedBox(height: 3.h,),
                TextFormField(
                  controller: amountController,
                    keyboardType: TextInputType.multiline,
                    maxLines: 3,
                    focusNode: FocusNode(),
                  //onFieldSubmitted: (value) => onFieldSubmitted!(value),
                  // validator: (input) => validator!(input),
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
        
                    /*hintText: "Or Other Amount",
                    hintStyle: TextStyle(color: Colors.grey.shade400),*/
                    // prefixIcon: icon,
                    //icon: const Icon(Icons.euro),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color:  Colors.black26,width: 1.5),
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: themPinkColor,width: 1.5),
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                  ),
        
                ),
                SizedBox(height: 10.h,),
                Text(
                  "Select Payment",
                  style: TextStyle(fontSize: 10.sp, color: themPinkColor),
                ),
                SizedBox(height: 3.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
        
                  SizedBox(
                    width: 60.w,
                    child: Column(
                      children: [
                        CustomButton(
                          onPressed: () {
                            setState(() {
                              if(payButton1!=true){
                                payButton1 = true;
                                payButton2 = false;
                                payButton3 = false;
                              }
                            });
                          },
                          icons: Icon(Icons.euro),
                          backGroundColor: Colors.white,
                          borderColor:
                          payButton1 ? themPinkColor : Colors.grey.shade400,
                          buttonText: "Pay",
                          buttonTextSize: 10.sp,
                          textColor: Colors.grey,
                        ),
                        Text("Google Pay",style: TextStyle(fontSize: 7.sp,color: Colors.grey),)
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 60.w,
                    child: Column(
                      children: [
                        CustomButton(
                          onPressed: () {
                            setState(() {
                              if(payButton2!=true){
                                payButton1 = false;
                                payButton2 = true;
                                payButton3 = false;
                              }
                            });
                          },
                          icons: Icon(Icons.euro),
                          backGroundColor: Colors.white,
                          borderColor:
                          payButton2 ? themPinkColor : Colors.grey.shade400,
                          buttonText: "Pay",
                          buttonTextSize: 10.sp,
                          textColor: Colors.grey,
                        ),
                        Text("Apple Pay",style: TextStyle(fontSize: 7.sp,color: Colors.grey),)
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 60.w,
                    child: Column(
                      children: [
                        CustomButton(
                          onPressed: () {
                            setState(() {
                              if(payButton3!=true){
                                payButton1 = false;
                                payButton2 = false;
                                payButton3 = true;
                              }
                            });
                          },
                          icons: Icon(Icons.euro),
                          backGroundColor: Colors.white,
                          borderColor:
                          payButton3 ? themPinkColor : Colors.grey.shade400,
                          //buttonText: "Pay",
                          buttonTextSize: 10.sp,
                          textColor: Colors.grey,
                        ),
                        Text("Credit/Debit Cart",style: TextStyle(fontSize: 7.sp,color: Colors.grey),)
                      ],
                    ),
                  ),
                ],)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
