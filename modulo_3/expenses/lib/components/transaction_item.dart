import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    super.key,
    required this.tr,
    required this.mediaQuery,
    required this.onRemove,
  });

  final Transaction tr;
  final MediaQueryData mediaQuery;
  final Function(String p1) onRemove;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: FittedBox(child: Text('R\$ ${tr.value}')),
          ),
        ),
        title: Text(tr.title, style: Theme.of(context).textTheme.titleLarge),
        subtitle: Text(DateFormat('d MMM y').format(tr.date)),
        trailing: mediaQuery.size.width > 500
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
                        color: Theme.of(context).colorScheme.error,
                      ),
                    ),
                  ],
                ),
              )
            : IconButton(
                onPressed: () => onRemove(tr.id),
                icon: const Icon(Icons.delete),
                color: Theme.of(context).colorScheme.error,
              ),
      ),
    );
  }
}
