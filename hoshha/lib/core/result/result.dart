import '../errors/app_failure.dart';

sealed class Result<T> {
  const Result();

  bool get isSuccess => this is Success<T>;
  bool get isFailure => this is Failure<T>;

  R when<R>({
    required R Function(T value) success,
    required R Function(AppFailure failure) failure,
  }) {
    final current = this;
    if (current is Success<T>) {
      return success(current.value);
    }

    return failure((current as Failure<T>).error);
  }
}

class Success<T> extends Result<T> {
  const Success(this.value);

  final T value;
}

class Failure<T> extends Result<T> {
  const Failure(this.error);

  final AppFailure error;
}
