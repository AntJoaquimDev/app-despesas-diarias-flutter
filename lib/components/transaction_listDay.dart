import 'package:flutter/material.dart';
import '../models/tansaction.dart';
import 'package:intl/intl.dart';

class TransactionListDay extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  TransactionListDay(this.transactions, this.onRemove);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (ctx, index) {
        final tr = transactions[index];
        return Card(
          elevation: 5,
          margin: EdgeInsets.symmetric(
            vertical: 2,
            horizontal: 5,
          ),
          child: ListTile(
            leading: CircleAvatar(
              radius: 30,
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: FittedBox(
                  child: Text(
                    'R\$${tr.value}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            title: Text(
              tr.title,
              style: Theme.of(context).textTheme.headline6,
            ),
            subtitle: Text(
              DateFormat('d MMM y').format(tr.date),
            ),
            trailing: IconButton(
              tooltip: 'Excluir Transanção',
              icon: Icon(Icons.delete),
              onPressed: () => onRemove(tr.id),
              color: Theme.of(context).errorColor,
            ),
          ),
        );
      },
    );
  }
}
