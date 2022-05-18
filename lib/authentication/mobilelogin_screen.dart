import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:users_app/assistants/assistant_methods.dart';
import 'package:users_app/authentication/verify.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:users_app/global/global.dart';

class MobileLoginScreen extends StatefulWidget {
  const MobileLoginScreen({Key? key}) : super(key: key);

  @override
  State<MobileLoginScreen> createState() => _MobileLoginScreenState();
}

class _MobileLoginScreenState extends State<MobileLoginScreen> {
  String verId = "";
  bool isAPICallProcess = false;
  String mobileNo = "";
  TextEditingController controller = TextEditingController();
  TextEditingController phonecodecontroller =
      TextEditingController(text: "+91");

  void getPermission() async {
    var status = await Permission.location.status;
    if (status.isGranted) {
      print("permission is granted");
    } else if (status.isDenied) {
      Map<Permission, PermissionStatus> status =
          await [Permission.locationWhenInUse].request();
    }
  }

  Future<void> verifyPhone() async {
    await fAuth.verifyPhoneNumber(
        phoneNumber: mobileNo,
        verificationCompleted: (PhoneAuthCredential
            credential) {} /*(PhoneAuthCredential credential) async {
          await fAuth.signInWithCredential(credential);
          final snackBar = SnackBar(content: Text("Login Success"));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }*/
        ,
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
          final snackBar = SnackBar(content: Text("${e.message}"));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        codeSent: (String verficationId, int? resendToken) {
          verId = verficationId;
          print("verification Id login screen is :");
          print(verId);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((context) => VerifyOtp(
                        mobilenum: mobileNo,
                        verificationID: verId,
                      ))));
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          //
        },
        timeout: Duration(seconds: 60));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: Color(0xff1B1D20),
        resizeToAvoidBottomInset: false,
        body: ProgressHUD(
          inAsyncCall: isAPICallProcess,
          opacity: .3,
          key: UniqueKey(),
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
                      Row(children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          width: 30,
                          height: 55,
                          child: Center(
                            child: TextField(
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w800),
                              controller: phonecodecontroller,
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  fillColor: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: TextField(
                            controller: controller,
                            decoration: InputDecoration(
                                hintText: "Enter Mobile Number",
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15))),
                            keyboardType: TextInputType.phone,
                            onChanged: (String value) {
                              if (value.length > 9) {
                                mobileNo = value;
                              }
                            },
                          ),
                        )
                      ]),
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
                            // for ui flow testing directly navigating to verify page else execute the below code
                            verifyPhone();
                            print(mobileNo);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => VerifyOtp(
                                          mobilenum: mobileNo,
                                          verificationID: verId,
                                        ))));
                            /*
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) =>
                                        VerifyOtp(mobilenum: mobileNo))));
                            
                          for ui flow testing directly navigating to verify page else execute the below code
                            if (mobileNo.length > 9) {
                              setState(() {
                                isAPICallProcess = true;
                              });

                              AssistantMethods.otplogin(mobileNo).then(
                                (response) async {
                                  setState(() {
                                    isAPICallProcess = false;
                                  });
                                  print("response data");
                                  print(response?.status);
                                  if (response?.status != null ||
                                      response?.status == "success") {
                                    print("coming here");
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                VerifyOtp(mobilenum: mobileNo)),
                                        (route) => false);
                                  }
                                },
                              );
                            }
                            */
                          },
                          child: const Text(
                            "Request OTP",
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
