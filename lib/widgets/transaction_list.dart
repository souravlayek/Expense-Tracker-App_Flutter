import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  final Function deleteAction;
  TransactionList({this.transaction, this.deleteAction});
  @override
  Widget build(BuildContext context) {
    return Container(
        // height: (MediaQuery.of(context).size.height * 0.685),
        // width: 500,
        child: transaction.isEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("No transaction added yet"),
                  Container(
                    child: Image.asset(
                      'assets/image/waiting.png',
                      fit: BoxFit.cover,
                    ),
                    height: 200,
                  )
                ],
              )
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                    child: ListTile(
                      leading: CircleAvatar(
                          radius: 30,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: FittedBox(
                                child: Text("\$${transaction[index].amount}")),
                          )),
                      title: Text(
                        transaction[index].title,
                      ),
                      subtitle: Text(
                          DateFormat.yMMMd().format(transaction[index].date)),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        color: Theme.of(context).errorColor,
                        onPressed: () => deleteAction(transaction[index].id),
                      ),
                    ),
                  );
                },
                itemCount: transaction.length,
              ));
  }
}
