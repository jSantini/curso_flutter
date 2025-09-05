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
      height: MediaQuery.of(context).size.height * 0.7,
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
                      trailing: MediaQuery.of(context).size.width > 500
                          ? TextButton(
                              onPressed: () => onRemove(tr.id),
                              child: Row(
                                // Usamos mainAxisSize para garantir que o Row ocupe
                                // apenas o espaço necessário para seus filhos.
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  // O ícone que queremos adicionar.
                                  Icon(
                                    Icons.delete,
                                    color: Theme.of(context).colorScheme.error,
                                  ),

                                  // Adiciona um espaço entre o ícone e o texto.
                                  SizedBox(width: 8),
                                  // O widget de texto.
                                  Text(
                                    'Excluir',
                                    style: TextStyle(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.error,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : IconButton(
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
