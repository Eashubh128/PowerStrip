import 'dart:async';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:users_app/assistants/assistant_methods.dart';
import 'package:users_app/authentication/login_screen.dart';
import 'package:users_app/global/global.dart';
import 'package:users_app/mainScreens/main_screen.dart';
import 'package:users_app/authentication/mobilelogin_screen.dart';
import 'package:users_app/mainScreens/ourservices_screen.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({Key? key}) : super(key: key);

  @override
  _MySplashScreenState createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  void getPermission() async {
    var status = await Permission.location.status;
    if (status.isGranted) {
      print("permission is granted");
    } else if (status.isDenied) {
      Map<Permission, PermissionStatus> status =
          await [Permission.locationWhenInUse].request();
    }
  }

  startTimer() async {
    getPermission();
    fAuth.currentUser != null
        ? AssistantMethods.readCurrentOnlineUserInfo()
        : null;
    Timer(const Duration(seconds: 4), () async {
      if (fAuth.currentUser != null) {
        currentFirebaseUser = fAuth.currentUser;
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (c) =>
                    OurServices())); // for ui flow testing sending to mobile login screen . For functional test send to MainScreen()
      } else {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (c) =>
                    MobileLoginScreen())); // for ui flow sending to mobile login else send to LoginScreen()
      }
    });
  }

  @override
  void initState() {
    super.initState();

    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.only(top: 220, bottom: 50),
        child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Image.asset("images/powerstrip1.png"),
                padding: EdgeInsets.only(left: 20),
              ),
              const SizedBox(
                height: 73,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Material(
                    elevation: 10,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    child: Container(
                      padding: const EdgeInsets.all(40),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color(0xff1B1D20),
                          image: const DecorationImage(
                            image: AssetImage("images/scooter.png"),
                          )),
                    ),
                  ),
                  SizedBox(
                    width: 65,
                  ),
                  Material(
                    elevation: 10,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    child: Container(
                      padding: const EdgeInsets.all(40),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color(0xff1B1D20),
                          image: DecorationImage(
                              image: AssetImage("images/charger.png"))),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 200,
              ),
              Container(
                child: Image.asset("images/Decarbonizing Bharat.png"),
              )
            ]),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color(0xff292E37),
            Color(0xff090A0C),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        height: double.maxFinite,
        width: double.maxFinite,
      ),
    );
  }
}
