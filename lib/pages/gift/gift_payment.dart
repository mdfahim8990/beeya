import 'dart:developer';

import 'package:beeya/components/custom_button.dart';
import 'package:beeya/components/custom_text_field.dart';
import 'package:beeya/config/them_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class GiftPaymentPage extends StatefulWidget {
  const GiftPaymentPage({Key? key}) : super(key: key);

  @override
  State<GiftPaymentPage> createState() => _GiftPaymentPageState();
}

class _GiftPaymentPageState extends State<GiftPaymentPage> {
  TextEditingController cardNumberController = TextEditingController();

  final TextEditingController _controller = TextEditingController();
  bool isChecked = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<String> imageUrls = [
    'assets/images/bangladesh.png',
    'assets/images/united-states.png',
    // Add more image URLs as needed
  ];
  bool isActive = false;
  String selectedImage = 'assets/images/bangladesh.png';

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pay With Card"),
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
            padding: EdgeInsets.only(left: 20.sp, right: 20.sp),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextField(
                  controller: cardNumberController,
                  levelText: "Card Number",
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    CardNumberFormatter(),
                  ],
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.number,
                  maxLength: 19,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Valid Exp Date';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        style: const TextStyle(color: Colors.black),
                        inputFormatters: [
                          _CreditCardExpirationInputFormatter(),
                        ],
                        onChanged: (value) {
                          CreditCardValidator.isExpirationDateValid(value);

                          if (CreditCardValidator.isExpirationDateValid(
                                  value) ==
                              false) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: Colors.redAccent,
                                content: Text("please Enter valid Date"),
                                duration: Duration(seconds: 1),
                              ),
                            );
                          }
                        },
                        decoration: InputDecoration(
                          hintText: ' MM/YY',
                          labelText: "Expiration Date (MM/YY)",
                          labelStyle:
                              TextStyle(color: themPinkColor, fontSize: 12.sp),
                          hintStyle: const TextStyle(
                              color: Colors.black45, fontSize: 12),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black26, width: 1.5),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: themPinkColor, width: 1.5),
                          ),
                        ),
                        //controller: expiryDateController,
                        //focusNode: expiryDateFocusNode,
                      ),
                    ),
                    SizedBox(
                      width: 5.sp,
                    ),
                    Expanded(
                      flex: 2,
                      child: CustomTextField(
                        controller: cardNumberController,
                        levelText: "CVV",
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.number,
                        //maxLength: 19,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.sp,
                ),
                CustomTextField(
                  controller: cardNumberController,
                  levelText: "Post Code",
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.text,
                ),
                SizedBox(
                  height: 5.sp,
                ),
                CustomTextField(
                  controller: cardNumberController,
                  levelText: "Email",
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 5.sp,
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
                            border: Border.all(color: Colors.grey), // Border properties
                            borderRadius: BorderRadius.circular(5), // Optional: Border radius
                          ),
                          child: PopupMenuButton<String>(
                            icon: Row(
                              children: [
                                Image(
                                  height: 30,
                                    image: AssetImage("$selectedImage")),
                                Icon(Icons.keyboard_arrow_down),
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
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text("Country")
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
                            controller: cardNumberController,
                            //levelText: "Email",
                            onTap: (){
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
                  color:isActive? themPinkColor : Colors.black26,
                  thickness: 1.5,
                ),
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
                    Text("I accept Terms of use and Privacy policy",style: TextStyle(fontSize: 9.sp),),
                  ],
                ),
                SizedBox(height: 5.sp,),
                CustomButton(onPressed: (){}, backGroundColor: themPinkColor,buttonText: 'Pay',)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    var inputText = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    var bufferString = StringBuffer();
    for (int i = 0; i < inputText.length; i++) {
      bufferString.write(inputText[i]);
      var nonZeroIndexValue = i + 1;
      if (nonZeroIndexValue % 4 == 0 && nonZeroIndexValue != inputText.length) {
        bufferString.write(' ');
      }
    }

    var string = bufferString.toString();
    return newValue.copyWith(
      text: string,
      selection: TextSelection.collapsed(
        offset: string.length,
      ),
    );
  }
}

class _CreditCardExpirationInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String text = newValue.text.replaceAll('/', '');
    if (newValue.selection.baseOffset < oldValue.selection.baseOffset) {
      if (text.isNotEmpty && text.endsWith('/')) {
        text = text.substring(0, text.length - 1);
      }
    }

    if (text.length <= 4) {
      if (text.length > 2) {
        final firstPart = text.substring(0, 2);
        final secondPart = text.substring(2);
        text = '$firstPart/$secondPart';
      }
      return TextEditingValue(
        text: text,
        selection: TextSelection.collapsed(offset: text.length),
      );
    }
    return oldValue;
  }
}

class CreditCardValidator {
  static bool isExpirationDateValid(String expDate) {
    //final RegExp regExp = RegExp(r'^(0[1-9]|1[0-2])\/(2[2-9]|2[0-9]\d{2}|1[8-9]\d{2})$');
    try {
      if (expDate.length == 2 || expDate.length == 5) {
        final int currentYear = DateTime.now().year % 100;
        final int currentMonth = DateTime.now().month;
        final int enteredMonth = int.parse(expDate.substring(0, 2));
        if (enteredMonth > 12) {
          return false;
        }
        print(expDate);
        final int enteredYear = int.parse(expDate.substring(3));
        print(enteredYear);
        if (enteredMonth < 1 || enteredMonth > 12) {
          return false;
        }
        final int futureYearLimit = currentYear + 30;
        final int futureYearCutoff =
            (futureYearLimit > 99) ? 99 : futureYearLimit;
        if ((enteredYear == currentYear) && (enteredMonth < currentMonth)) {
          return false;
        }
        if ((enteredYear < currentYear) || (enteredYear > futureYearCutoff)) {
          return false;
        }
        return true;
      }
    } catch (e) {
      log("ERROR::check out page::CreditCardValidator::${e.toString()}");
    }

    return true;
  }
}
