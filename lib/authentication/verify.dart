import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:users_app/assistants/assistant_methods.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

import '../mainScreens/ourservices_screen.dart';

class VerifyOtp extends StatefulWidget {
  final String? mobilenum;
  const VerifyOtp({Key? key, required this.mobilenum}) : super(key: key);

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  bool isAPICallProcess = false;
  String enteredotp = "";
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("hello");
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: Color(0xff1B1D20),
        resizeToAvoidBottomInset: false,
        body: ProgressHUD(
          inAsyncCall: isAPICallProcess,
          key: UniqueKey(),
          opacity: .3,
          child: Container(
            padding: EdgeInsets.only(top: 140),
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image:
                  DecorationImage(image: AssetImage("images/Background.png")),
              gradient: LinearGradient(
                colors: [
                  Color(0xff292E37),
                  Color(0xff090A0C),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              children: [
                const Text(
                  "Welcome",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 13,
                ),
                const Text(
                  "Yay! one step closer to greenery",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.only(
                      top: 42, bottom: 42, left: 16, right: 16),
                  height: 376,
                  width: 315,
                  decoration: BoxDecoration(
                      backgroundBlendMode: BlendMode.dstOut,
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 1,
                            blurRadius: 3,
                            blurStyle: BlurStyle.outer),
                      ],
                      color: const Color(0xff1B1D20),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      PinFieldAutoFill(
                        keyboardType: TextInputType.number,
                        decoration: UnderlineDecoration(
                          textStyle:
                              TextStyle(fontSize: 20, color: Colors.white),
                          colorBuilder: FixedColorBuilder(
                            Colors.white.withOpacity(.6),
                          ),
                        ),
                        currentCode: enteredotp,
                        codeLength: 6,
                        onCodeChanged: (code) {
                          if (code!.length == 6) {
                            enteredotp = code;
                            print(enteredotp);
                            FocusManager.instance.primaryFocus?.unfocus();
                          }
                        },
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Container(
                        height: 58,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color(0xffB6F2CF),
                        ),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OurServices()));
                            /*//for ui testing navigating to our services page 
                            setState(() {
                              isAPICallProcess = true;
                            });

                            AssistantMethods.otpverify(
                                    widget.mobilenum!, enteredotp)
                                .then(
                              (response) async {
                                setState(() {
                                  isAPICallProcess = false;
                                });
                                print("response data");
                                print(response?.status);
                                if (response?.status != null ||
                                    response?.status == "success") {
                                  /////do something on sucessful verification
                                  print("coming here");
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => OurServices()),
                                      (route) => false);
                                  ; /////do something on sucessful verification
                                }
                              },
                            );
                            */
                          }, // verify here!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                          child: const Text(
                            "Sign In",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(children: const <Widget>[
                        Expanded(
                            child: Divider(
                          color: Colors.grey,
                          thickness: 1,
                        )),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          "OR",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Expanded(
                            child: Divider(
                          color: Colors.grey,
                          thickness: 1,
                        )),
                      ]),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          height: 58,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                          ),
                          child: TextButton(
                            onPressed: () {},
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.white,
                                    backgroundImage: AssetImage(
                                      "images/googleicon.png",
                                    ),
                                  ),
                                  SizedBox(
                                    width: 13,
                                  ),
                                  Text(
                                    "Login using Google",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  )
                                ]),
                          )),
                    ],
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
