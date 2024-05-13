import 'package:beeya/components/custom_button.dart';
import 'package:beeya/components/custom_text_field.dart';
import 'package:beeya/config/them_config.dart';
import 'package:beeya/pages/gift/send_gift.dart';
import 'package:beeya/pages/guest/guest_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GuestDetails extends StatefulWidget {
  const GuestDetails({Key? key}) : super(key: key);

  @override
  State<GuestDetails> createState() => _GuestDetailsState();
}

TextEditingController nameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController phoneController = TextEditingController();
TextEditingController groupController = TextEditingController();

final List<String> checkboxItems = ['Item 1', 'Item 2', 'Item 3'];
List<bool> checkedItems = [];
int selectedCheckBox = -1;
int guestNumber = 0;

@override
void initState() {
  initState();
  // Initialize the checked state of each checkbox to false
  checkedItems = List<bool>.filled(checkboxItems.length, false);
}

class _GuestDetailsState extends State<GuestDetails> {
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
        title: const Text("Guest Details"),
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
              //mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextField(
                  controller: nameController,
                  levelText: "Name",
                  hintText: 'Full Name',
                  enabledBorderColor: Colors.black26,
                  keyboardType: TextInputType.text,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Text(
                  "RSVP",
                  style: TextStyle(fontSize: 12.sp, color: themPinkColor),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    buildCheckBox(0, 'Yes'),
                    buildCheckBox(1, 'No'),
                    buildCheckBox(2, 'Not Sure'),
                  ],
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Text(
                  "Additional Guest",
                  style: TextStyle(fontSize: 12.sp, color: themPinkColor),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (guestNumber != 0) {
                            guestNumber--;
                          }
                        });
                      },
                      icon: Icon(
                        Icons.remove,
                        size: 23.h,
                        color: themBlack,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8),
                      child: Text(
                        "$guestNumber",
                        style: TextStyle(
                            fontSize: 12.sp, fontWeight: FontWeight.w600),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          guestNumber++;
                        });
                      },
                      icon: Icon(
                        Icons.add,
                        size: 23.h,
                        color: themBlack,
                      ),
                    )
                  ],
                ),
                const Divider(
                  thickness: 1.5,
                  color: Colors.grey,
                ),
                CustomTextField(
                  controller: emailController,
                  levelText: "Contact Info",
                  hintText: 'Email',
                  enabledBorderColor: Colors.black26,
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                CustomTextField(
                  controller: phoneController,
                  levelText: "Phone No",
                  levelColor: Colors.black,
                  hintText: '01XXXXXXXXX',
                  enabledBorderColor: Colors.black26,
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                CustomTextField(
                  controller: groupController,
                  levelText: "Group",
                  hintText: 'Family',
                  enabledBorderColor: Colors.black26,
                  keyboardType: TextInputType.text,
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                CustomButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SendGiftPage(),
                      ),
                    );
                  },
                  backGroundColor: themPinkColor,
                  buttonText: 'Update',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCheckBox(int index, String fieldName) {
    return Row(
      children: [
        Checkbox(
          checkColor: Colors.black,
          activeColor: Colors.transparent,
          side:
              MaterialStateBorderSide.resolveWith((states) => const BorderSide(
                    color: Colors.black,
                    width: 1.5,
                  )),
          value: selectedCheckBox == index,
          onChanged: (newValue) {
            setState(() {
              if (newValue != null && newValue) {
                selectedCheckBox = index;
                print(selectedCheckBox);
              } else {
                selectedCheckBox = -1;
              }
            });
          },
        ),
        Text(fieldName)
      ],
    );
  }
}
