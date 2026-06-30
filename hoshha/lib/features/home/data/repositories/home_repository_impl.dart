import '../../../../core/error/failure.dart';
import '../../../../core/error/result.dart';
import '../../domain/entities/home_data.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_remote_data_source.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Result<HomeData, Failure>> getHomeData() async {
    try {
      final data = await remoteDataSource.getHomeData();
      return Success(data);
    } catch (e) {
      return Error(ServerFailure(e.toString()));
    }
  }
}
