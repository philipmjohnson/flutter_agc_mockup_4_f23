import 'package:flutter/material.dart';
import 'package:flutter_agc_mockup/pages/gardens/form-fields/field_padding.dart';

class ResetButton extends StatelessWidget {
  const ResetButton({super.key, required this.onReset});

  final void Function() onReset;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FieldPadding(
        child: OutlinedButton(
          onPressed: onReset,
          child: Text('Reset',
              style: TextStyle(color: Theme.of(context).colorScheme.secondary)),
        ),
      ),
    );
  }
}
