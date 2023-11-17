import 'package:flutter/material.dart';

class TTError extends StatelessWidget {
  const TTError(this.errorMessage, this.stacktrace, {super.key});

  final String errorMessage;
  final String stacktrace;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Text('Error: $errorMessage\nStack trace: $stacktrace',
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: Colors.white)),
    );
  }
}
