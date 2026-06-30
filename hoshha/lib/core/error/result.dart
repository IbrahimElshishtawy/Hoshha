import 'failure.dart';

sealed class Result<S, E extends Failure> {
  const Result();

  bool get isSuccess => this is Success<S, E>;
  bool get isError => this is Error<S, E>;

  S? get successValue => (this is Success<S, E>) ? (this as Success<S, E>).value : null;
  E? get errorValue => (this is Error<S, E>) ? (this as Error<S, E>).exception : null;
}

class Success<S, E extends Failure> extends Result<S, E> {
  final S value;
  const Success(this.value);
}

class Error<S, E extends Failure> extends Result<S, E> {
  final E exception;
  const Error(this.exception);
}
