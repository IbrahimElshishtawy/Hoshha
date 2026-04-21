import 'package:flutter/material.dart';

class NoteInputField extends StatelessWidget {
  const NoteInputField({
    super.key,
    required this.controller,
    this.enabled = true,
  });

  final TextEditingController controller;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      enabled: enabled,
      maxLines: 4,
      minLines: 3,
      textInputAction: TextInputAction.done,
      decoration: const InputDecoration(
        labelText: 'ملاحظة',
        hintText: 'أضف وصفاً مختصراً للمصروف',
        alignLabelWithHint: true,
      ),
    );
  }
}
