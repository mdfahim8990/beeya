import 'package:beeya/components/custom_button.dart';
import 'package:beeya/components/custom_text_field.dart';
import 'package:beeya/config/them_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class WeddingPlannerPage extends StatefulWidget {
  const WeddingPlannerPage({Key? key}) : super(key: key);

  @override
  State<WeddingPlannerPage> createState() => _WeddingPlannerPageState();
}

class _WeddingPlannerPageState extends State<WeddingPlannerPage> {
  //Bride
  TextEditingController brideFirstNameController = TextEditingController();
  TextEditingController brideLastNameController = TextEditingController();

  //Groom
  TextEditingController groomFirstNameController = TextEditingController();
  TextEditingController groomLastNameController = TextEditingController();

  TextEditingController weddingDateController = TextEditingController();
  TextEditingController weddingVenueController = TextEditingController();
  TextEditingController guestNumberController = TextEditingController();
  TextEditingController weddingBudgetController = TextEditingController();

  //Connect Your Wedding Party
  TextEditingController nameController = TextEditingController();
  TextEditingController roleController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  bool button1 = false;
  bool button2 = false;
  bool button3 = false;
  bool button4 = false;
  bool button5 = false;

  int guestNumber = 0;
  final _formKeyGlobal = GlobalKey<FormState>();
  final _formKeyParty = GlobalKey<FormState>();

  Future<void> customDatePick() async {
    DateTime? pickedDate = await showDatePicker(
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              splashFactory: NoSplash.splashFactory,
              colorScheme: const ColorScheme.light(
                primary: Color(0xFFfcf8f2), // header background color
                onPrimary: themPinkColor, // header text color
                onSurface: Colors.black, // body text color
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: themPinkColor, // button text color
                ),
              ),
            ),
            child: child!,
          );
        },
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime(2050));
    if (pickedDate != null) {
      final String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
      weddingDateController.text = formattedDate;
      if (mounted) {
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      backgroundColor: themBackGround,
      appBar: AppBar(
        title: const Text('Create A Wedding Planner'),
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
            padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 20.sp),
            child: Form(
              key: _formKeyGlobal,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Wedding Couple's Names",
                    style: TextStyle(fontSize: 14.sp, color: themPinkColor),
                  ),
                  //Bride
                  SizedBox(
                    height: 8.sp,
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        left: 10.0, right: 10, top: 5, bottom: 5),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.5,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                    child: Text(
                      "Bride Name",
                      style: TextStyle(fontSize: 10.sp, color: Colors.grey),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: CustomTextField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter First Name';
                            }
                            return null;
                          },
                          controller: brideFirstNameController,
                          levelText: "First Name",
                          levelColor: Colors.black,
                          // hintText: 'First Name',
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.text,
                          //maxLength: 19,
                        ),
                      ),
                      SizedBox(
                        width: 5.sp,
                      ),
                      Expanded(
                        flex: 2,
                        child: CustomTextField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Surname';
                            }
                            return null;
                          },
                          controller: brideLastNameController,
                          levelText: 'Surname',
                          levelColor: Colors.black,
                          //hintText: "Last Name",
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.text,
                          //maxLength: 19,
                        ),
                      ),
                    ],
                  ),

                  //Groom
                  SizedBox(
                    height: 10.sp,
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        left: 10.0, right: 10, top: 5, bottom: 5),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.5,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                    child: Text(
                      "Bride Name",
                      style: TextStyle(fontSize: 10.sp, color: Colors.grey),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: CustomTextField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter First Name';
                            }
                            return null;
                          },
                          controller: brideFirstNameController,
                          levelText: "First Name",
                          levelColor: Colors.black,
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.text,
                          //maxLength: 19,
                        ),
                      ),
                      SizedBox(
                        width: 5.sp,
                      ),
                      Expanded(
                        flex: 2,
                        child: CustomTextField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Surname';
                            }
                            return null;
                          },
                          controller: brideLastNameController,
                          levelText: 'Surname',
                          levelColor: Colors.black,
                          //hintText: "Last Name",
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.text,
                          //maxLength: 19,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.sp,
                  ),
                  Text(
                    "and I'm",
                    style: TextStyle(fontSize: 14.sp, color: themPinkColor),
                  ),
                  SizedBox(
                    height: 5.sp,
                  ),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    alignment: WrapAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              if (button1 != true) {
                                button1 = true;
                                button2 = false;
                                button3 = false;
                                button4 = false;
                                button5 = false;
                              }
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 120,
                            padding: const EdgeInsets.only(
                                left: 10.0, right: 10, top: 5, bottom: 5),
                            decoration: BoxDecoration(
                              color: button1
                                  ? themPinkColor
                                  : Colors.transparent,
                              border: Border.all(
                                color: themPinkColor,
                                width: 1.5,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(50),
                              ),
                            ),
                            child: Text(
                              "Bride",
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  color: button1
                                      ? Colors.white
                                      : themPinkColor),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              if (button2 != true) {
                                button1 = false;
                                button2 = true;
                                button3 = false;
                                button4 = false;
                                button5 = false;
                              }
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 120,
                            padding: const EdgeInsets.only(
                                left: 10.0, right: 10, top: 5, bottom: 5),
                            decoration: BoxDecoration(
                              color: button2
                                  ? themPinkColor
                                  : Colors.transparent,
                              border: Border.all(
                                color: themPinkColor,
                                width: 1.5,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(50),
                              ),
                            ),
                            child: Text(
                              "Groom",
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  color: button2
                                      ? Colors.white
                                      : themPinkColor),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              if (button3 != true) {
                                button1 = false;
                                button2 = false;
                                button3 = true;
                                button4 = false;
                                button5 = false;
                              }
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 120,
                            padding: const EdgeInsets.only(
                                left: 10.0, right: 10, top: 5, bottom: 5),
                            decoration: BoxDecoration(
                              color: button3
                                  ? themPinkColor
                                  : Colors.transparent,
                              border: Border.all(
                                color: themPinkColor,
                                width: 1.5,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(50),
                              ),
                            ),
                            child: Text(
                              "Mother",
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  color: button3
                                      ? Colors.white
                                      : themPinkColor),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              if (button4 != true) {
                                button1 = false;
                                button2 = false;
                                button3 = false;
                                button4 = true;
                                button5 = false;
                              }
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 120,
                            padding: const EdgeInsets.only(
                                left: 10.0, right: 10, top: 5, bottom: 5),
                            decoration: BoxDecoration(
                              color: button4
                                  ? themPinkColor
                                  : Colors.transparent,
                              border: Border.all(
                                color: themPinkColor,
                                width: 1.5,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(50),
                              ),
                            ),
                            child: Text(
                              "Father",
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  color: button4
                                      ? Colors.white
                                      : themPinkColor),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              if (button5 != true) {
                                button1 = false;
                                button2 = false;
                                button3 = false;
                                button4 = false;
                                button5 = true;
                              }
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 120,
                            padding: const EdgeInsets.only(
                                left: 10.0, right: 10, top: 5, bottom: 5),
                            decoration: BoxDecoration(
                              color: button5
                                  ? themPinkColor
                                  : Colors.transparent,
                              border: Border.all(
                                color: themPinkColor,
                                width: 1.5,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(50),
                              ),
                            ),
                            child: Text(
                              "Other",
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  color: button5
                                      ? Colors.white
                                      : themPinkColor),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  CustomTextField(
                    controller: weddingDateController,
                    levelText: 'Wedding Date',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Wedding Date';
                      }
                      return null;
                    },
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          customDatePick();
                        });
                      },
                      child: const Icon(
                        Icons.calendar_month,
                        color: themPinkColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.sp,
                  ),
                  CustomTextField(
                    controller: weddingVenueController,
                    levelText: 'Wedding Venue',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Wedding Venue';
                      }
                      return null;
                    },
                    suffixIcon: const Icon(
                      Icons.pin_drop,
                      color: themPinkColor,
                    ),
                  ),
                  SizedBox(
                    height: 8.sp,
                  ),
                  CustomTextField(
                    controller: guestNumberController,
                    levelText: 'Number Of Guest',
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Guest Number';
                      }
                      return null;
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    suffixIcon: Column(
                      children: [
                        InkWell(
                            onTap: () {
                              if (guestNumberController.text.isNotEmpty) {
                                //int.parse(guestNumberController.text)  = guestNumber ;
                                guestNumber =
                                    int.parse(guestNumberController.text);

                                guestNumber++;
                                setState(() {
                                  guestNumberController.text =
                                      '$guestNumber';
                                });
                              } else {
                                guestNumber++;
                                setState(() {
                                  guestNumberController.text =
                                      '$guestNumber';
                                });
                              }
                            },
                            child: const Icon(
                              Icons.keyboard_arrow_up,
                              color: themPinkColor,
                            )),
                        InkWell(
                          onTap: () {
                            if (guestNumberController.text.isNotEmpty) {
                              //int.parse(guestNumberController.text)  = guestNumber ;
                              guestNumber =
                                  int.parse(guestNumberController.text);
                              if (guestNumber >= 1) {
                                guestNumber--;
                                setState(() {
                                  guestNumberController.text =
                                      '$guestNumber';
                                });
                              }
                            } else {
                              if (guestNumber >= 1) {
                                guestNumber--;
                                setState(() {
                                  guestNumberController.text =
                                      '$guestNumber';
                                });
                              }
                            }
                          },
                          child: const Icon(
                            Icons.keyboard_arrow_down,
                            color: themPinkColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5.sp,
                  ),
                  CustomTextField(
                    controller: weddingBudgetController,
                    levelText: 'Wedding Budget',
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Wedding Budget';
                      }
                      return null;
                    },
                    suffixIcon: const Icon(
                      Icons.adb,
                      color: themPinkColor,
                    ),
                  ),
                  SizedBox(
                    height: 10.sp,
                  ),
                  Form(
                    key: _formKeyParty,
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      // height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Connect Your Wedding Party",
                            style:
                                TextStyle(fontSize: 14.sp, color: themPinkColor),
                          ),
                          SizedBox(
                            height: 10.sp,
                          ),
                          CustomTextField(
                            controller: nameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter Name';
                              }
                              return null;
                            },
                            levelText: "Name",
                            levelColor: Colors.black,
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.text,
                          ),
                          SizedBox(
                            height: 5.sp,
                          ),
                          CustomTextField(
                            controller: roleController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter Role';
                              }
                              return null;
                            },
                            levelText: "Role",
                            levelColor: Colors.black,
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.text,
                            suffixIcon: Icon(
                              Icons.keyboard_arrow_down,
                              size: 18.sp,
                              color: themPinkColor,
                            ),
                          ),
                          SizedBox(
                            height: 5.sp,
                          ),
                          CustomTextField(
                            controller: phoneNumberController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter Phone Number';
                              }
                              return null;
                            },
                            levelText: "Phone Number",
                            levelColor: Colors.black,
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.text,
                            suffixIcon: const Icon(
                              Icons.phone_sharp,
                              color: themPinkColor,
                            ),
                          ),
                          SizedBox(
                            height: 8.sp,
                          ),
                          CustomButton(
                            onPressed: () {
                              if (_formKeyParty.currentState!.validate()) {

                              }
                            },
                            backGroundColor: Colors.white,
                            borderColor: themPinkColor,
                            buttonText: 'Add More',
                            buttonTextSize: 14.sp,
                            textColor: themPinkColor,
                          )
                        ],
                      ),
                    ),
                  ),
              SizedBox(height: 15.sp,),
                  CustomButton(onPressed: (){
                    if (_formKeyGlobal.currentState!.validate()) {

                    }
                  }, backGroundColor: themPinkColor , buttonText: 'Create',)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
