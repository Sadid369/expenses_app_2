import 'package:expense_app_2/models/transaction.dart';
import 'package:expense_app_2/widgets/transactions_item.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList({this.transactions, this.deleteTx});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      child: transactions.isEmpty
          ? LayoutBuilder(builder: (ctx, constrains) {
              return Column(
                children: [
                  Text('No Transaction'),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      height: constrains.maxHeight * 0.60,
                      child: Image.asset('assets/images/waiting.png')),
                ],
              );
            })
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return TransactionItem(
                    transactions: transactions[index], deleteTx: deleteTx);
              },
              itemCount: transactions.length,
            ),
    );
  }
}
