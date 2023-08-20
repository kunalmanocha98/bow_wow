import 'package:bow_wow/UI/HomePage/home_page.dart';
import 'package:bow_wow/UI/OnboardingPage/Bloc/onboarding_state.dart';
import 'package:bow_wow/Utils/Services/navigator_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingBloc extends Cubit<OnBoardingState> {
  OnBoardingBloc(super.initialState);

  void openHomePage(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      NavigatorService().pushAndRemove(context, const HomePage());
    });
  }
}
