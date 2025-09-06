import 'package:expenses/components/transaction_item.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  final Function(String) onRemove;

  const TransactionList(this.transactions, this.onRemove, {super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return SizedBox(
      height: mediaQuery.size.height * 0.7,
      child: transactions.isEmpty
          ? LayoutBuilder(
              builder: (ctx, constraints) {
                return Column(
                  children: [
                    SizedBox(height: 20),
                    Text(
                      'Nenhuma Transação Cadastrada!',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      height: constraints.maxHeight * 0.6,
                      child: Image.asset(
                        './assets/images/waiting.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                );
              },
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (ctx, index) {
                final tr = transactions[index];

                return Padding(
                  padding: const EdgeInsets.all(5),
                  child: TransactionItem(
                    tr: tr,
                    mediaQuery: mediaQuery,
                    onRemove: onRemove,
                  ),
                );
              },
            ),
    );
  }
}
