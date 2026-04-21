import 'package:flutter/material.dart';

class SetBudgetButton extends StatefulWidget {
  const SetBudgetButton({
    super.key,
    required this.label,
    this.onPressed,
    this.isLoading = false,
    this.isEnabled = true,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isEnabled;

  @override
  State<SetBudgetButton> createState() => _SetBudgetButtonState();
}

class _SetBudgetButtonState extends State<SetBudgetButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final canInteract =
        widget.onPressed != null && widget.isEnabled && !widget.isLoading;

    return Listener(
      onPointerDown: (_) {
        if (canInteract) {
          setState(() => _isPressed = true);
        }
      },
      onPointerUp: (_) {
        if (_isPressed) {
          setState(() => _isPressed = false);
        }
      },
      onPointerCancel: (_) {
        if (_isPressed) {
          setState(() => _isPressed = false);
        }
      },
      child: AnimatedScale(
        duration: const Duration(milliseconds: 120),
        curve: Curves.easeOutCubic,
        scale: _isPressed ? 0.98 : 1,
        child: FilledButton(
          onPressed: canInteract ? widget.onPressed : null,
          child: SizedBox(
            height: 52,
            child: Center(
              child: widget.isLoading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : Text(widget.label),
            ),
          ),
        ),
      ),
    );
  }
}
