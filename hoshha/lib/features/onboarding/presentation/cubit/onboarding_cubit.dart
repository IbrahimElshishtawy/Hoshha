import 'package:flutter_bloc/flutter_bloc.dart';
import 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(const OnboardingPageChanged(currentPage: 0));

  void setPage(int index) {
    emit(OnboardingPageChanged(currentPage: index));
  }
}
