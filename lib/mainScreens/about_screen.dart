import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AboutScreen extends StatefulWidget {
  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          //image
          Container(
            height: 230,
            child: Center(
              child: Image.asset(
                "images/powerstrip1.png",
                width: 260,
              ),
            ),
          ),

          Column(
            children: [
              //company name
              const Text(
                "POWERSTRIP",
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.white54,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              //about you & your company - write some info
              const Text(
                "We at powerstrip, are on a mission to make India an EV-focused nation by developing a deeply integrated network of charge points,"
                "that allow users to charge their EVs wherever they wish to park,"
                "completely eliminating the term range anxiety.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white54,
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              const Text(
                "Our aim is to make each and every public parking to be EV charging ready.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white54,
                ),
              ),

              const SizedBox(
                height: 40,
              ),

              //close
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white54,
                ),
                child: const Text(
                  "Close",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
