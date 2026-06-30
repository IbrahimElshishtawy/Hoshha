import '../../../../core/error/failure.dart';
import '../../../../core/error/result.dart';
import '../entities/home_data.dart';

abstract class HomeRepository {
  Future<Result<HomeData, Failure>> getHomeData();
}
