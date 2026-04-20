import 'package:flutter/foundation.dart';

abstract class AppLogger {
  void info(String message);

  void warning(String message);

  void error(String message, Object error, StackTrace? stackTrace);
}

class DebugAppLogger implements AppLogger {
  @override
  void error(String message, Object error, StackTrace? stackTrace) {
    debugPrint('[ERROR] $message');
    debugPrint('        $error');
    if (stackTrace != null) {
      debugPrint(stackTrace.toString());
    }
  }

  @override
  void info(String message) {
    debugPrint('[INFO] $message');
  }

  @override
  void warning(String message) {
    debugPrint('[WARN] $message');
  }
}
