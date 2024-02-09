import 'package:base_starter/src/core/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';

/// `FailureBody` is a widget that displays a message when an error occurs.
class FailureBody extends StatelessWidget {
  final String message;
  const FailureBody({required this.message, super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(16),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: context.colors.error.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  message,
                  style: context.theme.textTheme.bodyMedium?.copyWith(
                    color: context.colors.error,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
