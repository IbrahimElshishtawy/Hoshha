import 'package:flutter/material.dart';

class SaveExpenseButton extends StatelessWidget {
  const SaveExpenseButton({
    super.key,
    required this.isEnabled,
    required this.isLoading,
    this.onPressed,
  });

  final bool isEnabled;
  final bool isLoading;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: isEnabled && !isLoading ? onPressed : null,
      child: SizedBox(
        height: 52,
        child: Center(
          child: isLoading
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Text('حفظ المصروف'),
        ),
      ),
    );
  }
}
