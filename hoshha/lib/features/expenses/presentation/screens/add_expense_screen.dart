import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/errors/app_failure.dart';
import '../../../../theme/theme_extensions.dart';
import '../../application/models/record_expense_result.dart';
import '../controllers/add_expense_controller.dart';
import '../widgets/add_expense_form.dart';

class AddExpenseScreen extends ConsumerWidget {
  const AddExpenseScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<RecordExpenseResult?>>(addExpenseControllerProvider, (
      previous,
      next,
    ) {
      final wasSubmitting = previous?.isLoading ?? false;
      if (!wasSubmitting || !context.mounted) {
        return;
      }

      next.whenOrNull(
        data: (result) {
          if (result == null) {
            return;
          }

          final messenger = ScaffoldMessenger.of(context);
          messenger
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('تم حفظ المصروف بنجاح')),
            );
          context.pop(result);
        },
        error: (error, _) {
          final messenger = ScaffoldMessenger.of(context);
          messenger
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text(_errorMessage(error))));
        },
      );
    });

    final spacing = context.appSpacing;

    return Scaffold(
      appBar: AppBar(title: const Text('إضافة مصروف')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsetsDirectional.all(spacing.lg),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: const AddExpenseForm(),
            ),
          ),
        ),
      ),
    );
  }

  String _errorMessage(Object error) {
    if (error is AppFailure) {
      return error.message;
    }

    return 'تعذر حفظ المصروف حالياً';
  }
}
