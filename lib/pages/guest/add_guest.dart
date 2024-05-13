import 'package:beeya/components/custom_button.dart';
import 'package:beeya/components/custom_text_field.dart';
import 'package:beeya/config/them_config.dart';
import 'package:beeya/pages/guest/guest_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddGuest extends StatefulWidget {
  const AddGuest({Key? key}) : super(key: key);

  @override
  State<AddGuest> createState() => _AddGuestState();
}

class _AddGuestState extends State<AddGuest> {

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController groupController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    double height = MediaQuery.of(context).size.height;
    return  Scaffold(
      backgroundColor: themBackGround,
      appBar: AppBar(
        title: const Text("Add Guest"),
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
        actions: [
          CustomButton(
            onPressed: () async {

            },
            backGroundColor: themPinkColor,
            textColor: Colors.white,
            buttonText: "Import",
            buttonTextSize: 11.sp,

            icons:  Padding(
              padding: EdgeInsets.only(right: 3.w),
              child: const Icon(Icons.document_scanner_sharp),
            ),
          ),
          SizedBox(width: 10.w,)
        ],
      ),
      body:  SingleChildScrollView(
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
        
                SizedBox(
                  height: height * 0.01,
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const GuestListPage()),
                    );
                  },
                  backGroundColor: themPinkColor,
                  buttonText: 'Add',
                  icons:Padding(
                    padding:  EdgeInsets.only(right: 3.0.w),
                    child: const Icon( Icons.person_add_alt_outlined),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
