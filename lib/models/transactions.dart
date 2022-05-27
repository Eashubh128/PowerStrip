import 'dart:ffi';

class TransactionModel {
  static final items = [
    Transaction(
        name: "Powerstrip 41",
        date: "19/02/22",
        Paymethod: "Upi",
        ammount: 41.34,
        is_debit: true)
  ];
}

class Transaction {
  final String name;
  final String date;
  final String Paymethod;
  final num ammount;
  bool is_debit;
  Transaction({
    required this.name,
    required this.date,
    required this.Paymethod,
    required this.ammount,
    required this.is_debit,
  });
}
