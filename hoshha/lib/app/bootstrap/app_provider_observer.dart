import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/logging/app_logger.dart';

final class AppProviderObserver extends ProviderObserver {
  AppProviderObserver(this._logger);

  final AppLogger _logger;

  @override
  void providerDidFail(
    ProviderObserverContext context,
    Object error,
    StackTrace stackTrace,
  ) {
    _logger.error(
      'Provider failed: ${context.provider.name ?? context.provider.runtimeType}',
      error,
      stackTrace,
    );
  }
}
