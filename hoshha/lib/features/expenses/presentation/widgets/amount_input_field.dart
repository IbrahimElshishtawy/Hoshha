import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../theme/theme_extensions.dart';

class AmountInputField extends StatelessWidget {
  const AmountInputField({
    super.key,
    required this.controller,
    required this.validator,
    this.onChanged,
    this.enabled = true,
    this.inputFormatters = const <TextInputFormatter>[],
  });

  final TextEditingController controller;
  final String? Function(String?) validator;
  final ValueChanged<String>? onChanged;
  final bool enabled;
  final List<TextInputFormatter> inputFormatters;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = context.appColors;

    return TextFormField(
      controller: controller,
      enabled: enabled,
      validator: validator,
      onChanged: onChanged,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      textInputAction: TextInputAction.next,
      textDirection: TextDirection.ltr,
      style: theme.textTheme.headlineMedium?.copyWith(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: colors.primary,
      ),
      inputFormatters: inputFormatters,
      decoration: const InputDecoration(
        labelText: 'المبلغ',
        hintText: '0.00',
        prefixIcon: Icon(Icons.payments_outlined),
      ),
    );
  }
}
