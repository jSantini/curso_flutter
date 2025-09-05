import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  final Function(String) onRemove;

  const TransactionList(this.transactions, this.onRemove, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 590,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  'Nenhuma Transação Cadastrada!',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 200,
                  child: Image.asset(
                    './assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (ctx, index) {
                final tr = transactions[index];

                return Padding(
                  padding: const EdgeInsets.all(5),
                  child: Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: FittedBox(child: Text('R\$ ${tr.value}')),
                        ),
                      ),
                      title: Text(
                        tr.title,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      subtitle: Text(DateFormat('d MMM y').format(tr.date)),
                      trailing: IconButton(
                        onPressed: () => onRemove(tr.id),
                        icon: Icon(Icons.delete),
                        color: Theme.of(context).colorScheme.error,
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
