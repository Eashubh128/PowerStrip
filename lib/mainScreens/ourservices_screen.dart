import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:users_app/assistants/assistant_methods.dart';
import 'package:users_app/authentication/login_screen.dart';
import 'package:users_app/global/global.dart';
import 'package:users_app/mainScreens/main_screen.dart';

class OurServices extends StatefulWidget {
  const OurServices({Key? key}) : super(key: key);

  @override
  State<OurServices> createState() => _OurServicesState();
}

class _OurServicesState extends State<OurServices> {
  String url = "https://app.powerstrip.in";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color(0xff292E37),
            Color(0xff090A0C),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const Text(
              "Our Services",
              style: TextStyle(
                color: Colors.white,
                fontSize: 50,
              ),
            ),
            Container(
              width: 200,
              height: 190,
              decoration: BoxDecoration(
                color: Color(0xffbac1B1D20),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextButton(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Image.asset(
                      "images/charger.png",
                      scale: .6,
                    ),
                    const Text(
                      "Charge",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "Charge where you park",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                onPressed: () {
                  AssistantMethods.launchURL(url);
                },
              ),
            ),
            Container(
              width: 200,
              height: 190,
              decoration: BoxDecoration(
                color: Color(0xffbac1B1D20),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextButton(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Image.asset(
                      "images/scooter.png",
                      scale: .6,
                    ),
                    const Text(
                      "Ride",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "Ride where you wish to",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                onPressed: () async {
                  print(currentFirebaseUser!.uid);
                  await Fluttertoast.showToast(msg: "To Ride app ");
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => MainScreen())));
                  //to ridehailing login page
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
