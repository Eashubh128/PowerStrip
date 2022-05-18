import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:users_app/global/global.dart';
import 'package:users_app/widgets/progress_dialog.dart';

class Userdetailsdialog extends StatefulWidget {
  Userdetailsdialog({Key? key}) : super(key: key);

  @override
  State<Userdetailsdialog> createState() => _UserdetailsdialogState();
}

class _UserdetailsdialogState extends State<Userdetailsdialog> {
  var namecontroller = TextEditingController();
  var phonecontroller = TextEditingController();

  var emailcontroller = TextEditingController();

  var controller = TextEditingController();

  void submit(String name, String email, String phoneNumber) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext c) {
          return ProgressDialog(
            message: "Processing, Please wait...",
          );
        });

    if (currentFirebaseUser != null) {
      Map userMap = {
        "id": currentFirebaseUser!.uid,
        "name": namecontroller.text.trim(),
        "email": emailcontroller.text.trim(),
        "phone": phonecontroller.text.trim(),
      };

      DatabaseReference reference =
          FirebaseDatabase.instance.ref().child("users");
      reference.child(currentFirebaseUser!.uid).set(userMap);

      setState(() {
        userModelCurrentInfo?.name = namecontroller.text.trim();
        userModelCurrentInfo?.email = emailcontroller.text.trim();
      });

      Fluttertoast.showToast(msg: "Details Have Been Saved");

      Navigator.pop(context);
    } else {
      Navigator.pop(context);
      Fluttertoast.showToast(msg: "Couldnt Save Details");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: const Color(0xff1B1D20),
          child: Dialog(
            elevation: 10,
            backgroundColor: Colors.grey,
            child: Column(children: [
              const Text(
                "Seems like We dont know you !!",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
              const Divider(
                thickness: 5,
                color: Color(0xff1B1D20),
              ),
              TextField(
                controller: namecontroller,
                decoration: const InputDecoration(
                    label: Text("Enter name",
                        style: TextStyle(fontWeight: FontWeight.w800)),
                    border: InputBorder.none),
              ),
              const Divider(
                thickness: 5,
                color: Color(0xff1B1D20),
              ),
              TextField(
                controller: emailcontroller,
                decoration: const InputDecoration(
                    focusColor: Colors.black,
                    label: Text("Enter Email",
                        style: TextStyle(fontWeight: FontWeight.w800)),
                    border: InputBorder.none),
              ),
              const Divider(
                thickness: 5,
                color: Color(0xff1B1D20),
              ),
              TextField(
                enabled: true,
                controller: phonecontroller,
                decoration: const InputDecoration(
                    label: Text(
                      "Enter Phone Number",
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                    ),
                    border: InputBorder.none),
              ),
              const Divider(
                thickness: 5,
                color: Color(0xff1B1D20),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green),
                ),
                onPressed: () {
                  if (emailcontroller.text.length == 0) {
                    userModelCurrentInfo?.phone;
                  }
                  print(currentFirebaseUser!.uid);
                  submit(namecontroller.text, emailcontroller.text,
                      phonecontroller.text);
                  Navigator.pop(context);
                },
                child: Text("Submit Details"),
              ),
            ]),
          )),
    );
  }
}
