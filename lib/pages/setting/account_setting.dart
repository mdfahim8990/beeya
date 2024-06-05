import 'package:beeya/components/custom_button.dart';
import 'package:beeya/components/custom_text_field.dart';
import 'package:beeya/config/them_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountSettingPage extends StatefulWidget {
  const AccountSettingPage({Key? key}) : super(key: key);

  @override
  State<AccountSettingPage> createState() => _AccountSettingPageState();
}

class _AccountSettingPageState extends State<AccountSettingPage> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController reTypePasswordController = TextEditingController();

  // Bank Details
  TextEditingController bFirstNameController = TextEditingController();
  TextEditingController bLastNameController = TextEditingController();
  TextEditingController bankNameController = TextEditingController();
  TextEditingController accountNumberController = TextEditingController();
  TextEditingController shotCodeController = TextEditingController();
  bool isChecked = false;
  bool isActive = false;
  bool oldPassView = false;
  bool newPassView = false;
  bool rePassView = false;
  List<String> imageUrls = [
    'assets/images/bangladesh.png',
    'assets/images/united-states.png',
    // Add more image URLs as needed
  ];
  String selectedImage = 'assets/images/bangladesh.png';

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      backgroundColor: themBackGround,
      appBar: AppBar(
        title: const Text("Account Setting"),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
            onPressed: () {
              //Navigator.pop(context);
            },
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15.sp,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Name',style: TextStyle(fontSize: 14,color:themPinkColor ),),
                          CustomTextField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter First Name';
                              }
                              return null;
                            },
                            controller: firstNameController,
                            hintText: 'First Name',
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.text,
                            //maxLength: 19,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 5.sp,
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('',style: TextStyle(fontSize: 14,color: themPinkColor),),
                          CustomTextField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter Last Name';
                              }
                              return null;
                            },
                            controller: lastNameController,

                            levelColor: Colors.grey,

                            hintText: "Last Name",
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.text,
                            //maxLength: 19,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.sp,
                ),
                const Text('Email',style: TextStyle(fontSize: 14,color: themPinkColor),),
                CustomTextField(
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Email Address';
                    }
                    return null;
                  },

                  hintText: 'fahim@gmail.com',
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 12.sp,
                ),
                const Text(
                  "Mobile Number",
                  style: TextStyle(fontSize: 14, color: themPinkColor),
                ),
                Wrap(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            // Border properties
                            borderRadius: BorderRadius.circular(
                                5), // Optional: Border radius
                          ),
                          child: PopupMenuButton<String>(
                            icon: Row(
                              children: [
                                Image(
                                    height: 30,
                                    image: AssetImage("$selectedImage")),
                                const Icon(Icons.keyboard_arrow_down),
                              ],
                            ),
                            itemBuilder: (BuildContext context) {
                              return imageUrls.map((imageUrl) {
                                return PopupMenuItem<String>(
                                  value: imageUrl,
                                  child: SizedBox(
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          imageUrl,
                                          width: 24,
                                          // Adjust the width of the image if needed
                                          height:
                                              24, // Adjust the height of the image if needed
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        const Text("Country")
                                      ],
                                    ),
                                  ),
                                );
                              }).toList();
                            },
                            onSelected: (String selectedImageUrl) {
                              // Handle selection of image URL
                              setState(() {
                                selectedImage = selectedImageUrl;
                              });
                            },
                          ),
                        ),
                        Flexible(
                          child: CustomTextField(
                            controller: phoneNumberController,
                            //levelText: "Email",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter Phone Number';
                              }
                              return null;
                            },
                            onTap: () {
                              setState(() {
                                isActive = true;
                              });
                            },
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.number,
                            enabledBorderColor: Colors.transparent,
                            focusedBorderColors: Colors.transparent,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Divider(
                  color: isActive ? themPinkColor : Colors.black26,
                  thickness: 1.5,
                ),
                SizedBox(
                  height: 5.sp,
                ),
                const Text('Old Password',style: TextStyle(fontSize: 14,color: themPinkColor),),
                CustomTextField(
                  controller: oldPasswordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter  Old Password';
                    }
                    return null;
                  },
                  levelColor: themPinkColor,
                  obscureText: oldPassView ? false : true,
                  suffixIcon: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      setState(() {
                        if (!oldPassView) {
                          oldPassView = true;
                        } else {
                          oldPassView = false;
                        }
                      });
                    },
                    icon: oldPassView
                        ? const Icon(
                            Icons.visibility_outlined,
                            color: themPinkColor,
                          )
                        : const Icon(
                            Icons.visibility_off_outlined,
                            color: themPinkColor,
                          ),
                  ),
                ),
                SizedBox(
                  height: 5.sp,
                ),
                const Text('New Password',style: TextStyle(fontSize: 14,color: themPinkColor),),
                CustomTextField(
                  controller: newPasswordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please New Password';
                    }
                    return null;
                  },
                  obscureText: newPassView ? false : true,
                  suffixIcon: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      setState(() {
                        if (!newPassView) {
                          newPassView = true;
                        } else {
                          newPassView = false;
                        }
                      });
                    },
                    icon: newPassView
                        ? const Icon(
                            Icons.visibility_outlined,
                            color: themPinkColor,
                          )
                        : const Icon(
                            Icons.visibility_off_outlined,
                            color: themPinkColor,
                          ),
                  ),

                ),
                SizedBox(
                  height: 5.sp,
                ),
                const Text('Retype Password',style: TextStyle(fontSize: 14,color: themPinkColor),),
                CustomTextField(
                  controller: reTypePasswordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Re-Type Password';
                    }
                    return null;
                  },
                  obscureText: rePassView ? false : true,
                  suffixIcon: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      setState(() {
                        if (!rePassView) {
                          rePassView = true;
                        } else {
                          rePassView = false;
                        }
                      });
                    },
                    icon: rePassView
                        ? const Icon(
                            Icons.visibility_outlined,
                            color: themPinkColor,
                          )
                        : const Icon(
                            Icons.visibility_off_outlined,
                            color: themPinkColor,
                          ),
                  ),

                ),
                SizedBox(
                  height: 10.sp,
                ),
          
                //              *********** Bank Details ************
          
                Container(
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
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Bank Details",style: TextStyle(fontFamily: 'Cormorant',fontSize: 30,),),
                          Icon(Icons.lock_outline_sharp,size: 30,)
                        ],
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
                              controller: bFirstNameController,
                              levelText: "Name",
                              hintText: 'First Name',
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
                                  return 'Please enter Last Name';
                                }
                                return null;
                              },
                              controller: bLastNameController,
                              levelText: 'Last Name',
                              levelColor: Colors.grey,
          
                              //hintText: "Last Name",
                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.text,
                              //maxLength: 19,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.sp,
                      ),
                      CustomTextField(
                        controller: bankNameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Bank Name';
                          }
                          return null;
                        },
                        levelText: "Bank Name",
                        hintText: 'Your Bank Name',
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.text,
                      ),
                      SizedBox(
                        height: 5.sp,
                      ),
                      CustomTextField(
                        controller: accountNumberController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Bank Account Number';
                          }
                          return null;
                        },
                        levelText: "Account No.",
                        hintText: '234567890765',
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(
                        height: 5.sp,
                      ),
                      CustomTextField(
                        controller: shotCodeController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Shot Code';
                          }
                          return null;
                        },
                        levelText: "Short Code",
                        hintText: '23-34-56',
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.number,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.sp,
                ),
                SizedBox(
                  height: 40,
                  child: Padding(
                    padding:  const EdgeInsets.symmetric(horizontal: 14),
                    child: CustomButton(
                      onPressed: () {},
                      backGroundColor: themPinkColor,
                      buttonText: 'Sign UP',
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.sp,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
