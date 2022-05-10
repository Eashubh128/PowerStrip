import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  late Razorpay razorpay;
  TextEditingController textEditingController = new TextEditingController();

  @override
  void initState() {
    super.initState();

    razorpay = new Razorpay();

    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlerPaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlerErrorFailure);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handlerExternalWallet);
  }

  //@override
  //void dispose() {
  // TODO: implement dispose
  //   super.dispose();
  //   razorpay.clear();
  //}

  void openCheckout() {
    var options = {
      "key": "rzp_test_M9Z2dqY0Xc5VO6",
      "amount": num.parse(textEditingController.text) * 100,
      "name": "Ride Payment",
      "description": "Payment for the ride",
      "prefill": {
        "contact": "7500537051",
        "email": "thapliyaleashubh@gmail.com"
      },
      "external": {
        "wallets": ["paytm", "gpay"]
      }
    };

    try {
      razorpay.open(options);
    } catch (e) {
      print(e.toString());
    }
  }

  void _handlerPaymentSuccess(PaymentSuccessResponse response) {
    print("Payment success");
    Fluttertoast.showToast(
        msg: "SUCCESS: " + response.paymentId!,
        toastLength: Toast.LENGTH_SHORT);
  }

  void _handlerErrorFailure(PaymentFailureResponse response) {
    print("Payment error");
    Fluttertoast.showToast(
        msg: "ERROR: " + response.code.toString() + " - " + response.message!,
        toastLength: Toast.LENGTH_SHORT);
  }

  void _handlerExternalWallet(ExternalWalletResponse response) {
    print("External Wallet");
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName!,
        toastLength: Toast.LENGTH_SHORT);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            TextField(
              controller: textEditingController,
              decoration: InputDecoration(hintText: "amount to pay"),
            ),
            SizedBox(
              height: 12,
            ),
            RaisedButton(
                color: Colors.blue,
                child: Text(
                  "Open payments page",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  openCheckout();
                } /*async {
                  await LaunchApp.openApp(
                    openStore: true,
                    androidPackageName:
                        "com.google.android.apps.nbu.paisa.user",
                  );
                  print("opened google pay");*/
                //open checkout()
                )
          ],
        ),
      ),
    );
  }
}
