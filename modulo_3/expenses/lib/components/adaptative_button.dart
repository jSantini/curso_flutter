import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AdaptativeButton extends StatelessWidget {
  final String label;
  final Function() onPressed;

  const AdaptativeButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(onPressed: onPressed, child: Text(label))
        : ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              // Define a cor do texto do botão.
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
            ),
            child: Text(label),
          );
  }
}
