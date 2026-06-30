import 'package:equatable/equatable.dart';
import '../error/failure.dart';
import '../error/result.dart';

abstract class UseCase<Type, Params> {
  Future<Result<Type, Failure>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
