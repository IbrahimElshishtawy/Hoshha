import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/usecase/usecase.dart';
import '../../domain/usecases/get_home_data_usecase.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetHomeDataUseCase _getHomeDataUseCase;

  HomeCubit({
    required GetHomeDataUseCase getHomeDataUseCase,
  })  : _getHomeDataUseCase = getHomeDataUseCase,
        super(HomeInitial());

  Future<void> loadHomeData() async {
    emit(HomeLoading());
    final result = await _getHomeDataUseCase(NoParams());

    if (result.isSuccess) {
      emit(HomeLoaded(result.successValue!));
    } else {
      emit(HomeFailure(result.errorValue!.message));
    }
  }
}
