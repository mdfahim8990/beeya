import 'package:beeya/components/custom_button.dart';
import 'package:beeya/components/custom_text_field.dart';
import 'package:beeya/config/them_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: themBackGround,
        appBar: AppBar(
          title: const Text("Sign In"),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          backgroundColor: Colors.white,
          elevation: 1,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                /*  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Sign Up",
                        style: GoogleFonts.bodoniModa(
                          textStyle:
                              TextStyle(color: Colors.black, fontSize: height / 14),
                        ),
                      ),

                    ],
                  ),*/
                  SizedBox(height: 40.sp,),
                  CustomTextField(controller:mailController ,levelText: 'Email',levelColor: Colors.grey,),
                  SizedBox(height: 18.sp,),
                  CustomTextField(controller:passwordController ,levelText: 'Password',levelColor: Colors.grey,obscureText: true,),
                  TextButton(
                    onPressed: (){},
                    child: Text("Forgot Password?",style: TextStyle(fontSize: 11.sp,color: Colors.grey,fontWeight: FontWeight.w400),),
                  ),
                  SizedBox(height: 70.sp,),
                  CustomButton(onPressed: (){}, backGroundColor: themPinkColor,buttonText: 'Sign In',),
                  SizedBox(height: 40.sp,),
                  Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text('Don’t have an account?',style: TextStyle(fontSize: 11.sp,color: Colors.grey)),
                    TextButton(onPressed: (){}, child:  Text('Sign Up',
                        style: TextStyle(fontWeight: FontWeight.w500,fontSize: 11.sp,color: themBlack),),),

                  ],)

                  ),

                ],
              ),
            ),
          ),
        ));
  }
}
