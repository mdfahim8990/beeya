import 'package:beeya/components/custom_button.dart';
import 'package:beeya/components/custom_text_field.dart';
import 'package:beeya/config/them_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController reTypePasswordController = TextEditingController();
  bool isChecked = false;
  bool isActive = false;
  bool viewPassword1 = false;
  bool viewPassword2 = false;
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
      appBar: AppBar(
        title: const Text("Sign UP"),
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
                    child: CustomTextField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter First Name';
                        }
                        return null;
                      },
                      controller: firstNameController,
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
                      controller: lastNameController,
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
                controller: emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Email Address';
                  }
                  return null;
                },
                levelText: "Email",
                hintText: 'fahim@gmail.com',
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 12.sp,
              ),
              Text(
                "Mobile Number",
                style: TextStyle(fontSize: 12.sp, color: themPinkColor),
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
              CustomTextField(
                controller: passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Password';
                  }
                  return null;
                },
                levelText: 'Password',
                levelColor: themPinkColor,
                obscureText: viewPassword1 ? false : true,
                suffixIcon: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    setState(() {
                      if (!viewPassword1) {
                        viewPassword1 = true;
                      } else {
                        viewPassword1 = false;
                      }
                    });
                  },
                  icon: viewPassword1
                      ? const Icon(Icons.visibility_outlined,color: themPinkColor,)
                      : const Icon(Icons.visibility_off_outlined,color: themPinkColor,),
                ),
              ),
              SizedBox(
                height: 5.sp,
              ),
              CustomTextField(
                controller: reTypePasswordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Re-Type Password';
                  }
                  return null;
                },
                obscureText: viewPassword2 ? false : true,
                suffixIcon: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    setState(() {
                      if (!viewPassword2) {
                        viewPassword2 = true;
                      } else {
                        viewPassword2 = false;
                      }
                    });
                  },
                  icon: viewPassword2
                      ? const Icon(Icons.visibility_outlined,color: themPinkColor,)
                      : const Icon(Icons.visibility_off_outlined,color: themPinkColor,),
                ),
                levelText: 'Retype Password',
                levelColor: themPinkColor,
              ),
              SizedBox(height: 5.sp,),
              Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    activeColor: Colors.green,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                    // materialTapTargetSize: MaterialTapTargetSize.padded,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50), // Adjust the radius as needed
                    ),
                  ),
                  Text("I agree to the Terms of Service",style: TextStyle(fontSize: 9.sp),),
                ],
              ),
              SizedBox(height: 8.sp,),
              CustomButton(onPressed: (){}, backGroundColor: themPinkColor,buttonText: 'Sign UP',)
            ],
          ),
        ),
      ),
    );
  }
}
