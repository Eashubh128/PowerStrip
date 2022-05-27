import 'package:flutter/material.dart';
import 'package:users_app/models/transactions.dart';

class TransactionView extends StatelessWidget {
  final Transaction item;
  const TransactionView({Key? key, required this.item})
      : assert(item != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      onTap: () => print("Pressed"),
      title: Text(
        item.name,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      subtitle: Row(
        children: [
          Text(
            item.date,
            style: TextStyle(color: Colors.grey, fontSize: 9),
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            item.Paymethod,
            style: TextStyle(color: Colors.grey, fontSize: 9),
          ),
        ],
      ),
      trailing: Text(
        "${item.is_debit ? "+" : "-"} ₹${item.ammount.toString()}",
        style: TextStyle(color: item.is_debit ? Colors.green : Colors.red),
      ),
    );
  }
}
