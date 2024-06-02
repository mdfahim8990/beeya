import 'package:flutter/material.dart';

class ThankYouPage extends StatefulWidget {
  const ThankYouPage({Key? key}) : super(key: key);

  @override
  State<ThankYouPage> createState() => _ThankYouPageState();
}

class _ThankYouPageState extends State<ThankYouPage> {
  bool _isSignedUp = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return  Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            color: Colors.orangeAccent,
            width: width > 600 ? 400  : null,
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 80,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'THANK YOU',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Payment Successful',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      '£150',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    RichText(
                      text: TextSpan(
                        text: 'eGift to ',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black54,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Sonia & Peter',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.redAccent,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
            SizedBox(height: 20),
                    Row(
                      children: [
                        Checkbox(
                          value: _isSignedUp,
                          onChanged: (bool? newValue) {
                            setState(() {
                              _isSignedUp = newValue ?? false;
                            });
                          },
                        ),
                        Text(
                          'Sign up to Bvaah App',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
