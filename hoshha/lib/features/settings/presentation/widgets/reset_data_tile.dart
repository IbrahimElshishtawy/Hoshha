import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/errors/app_failure.dart';
import '../controllers/reset_data_controller.dart';
import '../settings_copy.dart';
import 'settings_section.dart';
import 'settings_tile.dart';

class ResetDataTile extends ConsumerWidget {
  const ResetDataTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final copy = SettingsCopy.of(context);
    final isLoading = ref.watch(resetDataControllerProvider).isLoading;

    return SettingsSection(
      title: copy.dangerZoneSectionTitle,
      children: [
        SettingsTile(
          title: copy.resetTileTitle,
          subtitle: copy.resetTileSubtitle,
          icon: Icons.delete_sweep_rounded,
          destructive: true,
          trailing: isLoading
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2.2),
                )
              : null,
          onTap: isLoading ? null : () => _confirmAndReset(context, ref, copy),
        ),
      ],
    );
  }

  Future<void> _confirmAndReset(
    BuildContext context,
    WidgetRef ref,
    SettingsCopy copy,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(copy.resetDialogTitle),
        content: Text(copy.resetDialogMessage),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: Text(copy.cancelLabel),
          ),
          FilledButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: Text(copy.resetConfirmLabel),
          ),
        ],
      ),
    );

    if (confirmed != true || !context.mounted) {
      return;
    }

    final result = await ref.read(resetDataControllerProvider.notifier).reset();
    if (!context.mounted) {
      return;
    }

    final messenger = ScaffoldMessenger.of(context);
    final message = result.when(
      success: (_) => copy.resetSuccessMessage,
      failure: (failure) => _errorMessage(copy, failure),
    );

    messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }

  String _errorMessage(SettingsCopy copy, AppFailure failure) {
    return switch (failure.type) {
      AppFailureType.storage => copy.resetErrorMessage,
      _ => copy.resetErrorMessage,
    };
  }
}
