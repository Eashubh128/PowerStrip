import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:users_app/models/transactions.dart';

import '../widgets/TransactionWidget.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  final dummylist = List.generate(10, (index) => TransactionModel.items[0]);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        /* actions: [
          IconButton(
              color: Colors.white,
              onPressed: () {},
              icon: FaIcon(
                FontAwesomeIcons.fingerprint,
                size: 18,
              )),
        ],*/
      ),
      body: Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Wallet Balance",
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                  fontWeight: FontWeight.w300),
            ),
            const Text(
              "Rs140.00",
              style: TextStyle(
                fontSize: 60,
                color: Colors.white,
              ),
            ) //Todo:wallet balance comes here
            ,
            const Text(
              "Cashback Earned:  +31.00",
              style: TextStyle(
                color: Colors.green,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Wrap(
              spacing: 1,
              //mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(11),
                      primary: Color.fromRGBO(77, 88, 91, .4)),
                  child: const Icon(
                    Icons.add,
                    size: 20,
                  ),
                  onPressed: () {},
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(11),
                      primary: Color.fromRGBO(77, 88, 91, .4)),
                  child: const Icon(
                    Icons.card_giftcard,
                    size: 20,
                  ),
                  onPressed: () {},
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(11),
                      primary: Color.fromRGBO(77, 88, 91, .4)),
                  child: const Icon(
                    Icons.star,
                    size: 20,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              decoration: BoxDecoration(),
              //width: double.maxFinite,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/images/covid.png',
                    color: Colors.grey.withOpacity(.22),
                    colorBlendMode: BlendMode.plus,
                  )),
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              "Transactions",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: dummylist.length,
                itemBuilder: (context, index) {
                  return TransactionView(
                    item: dummylist[index],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
