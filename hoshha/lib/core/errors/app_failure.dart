enum AppFailureType {
  validation,
  notFound,
  storage,
  mapping,
  consistency,
  unknown,
}

class AppFailure implements Exception {
  const AppFailure({
    required this.type,
    required this.message,
    this.cause,
  });

  final AppFailureType type;
  final String message;
  final Object? cause;

  @override
  String toString() => 'AppFailure(type: $type, message: $message)';
}
