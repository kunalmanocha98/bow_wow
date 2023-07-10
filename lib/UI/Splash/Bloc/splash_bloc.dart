import 'package:bow_wow/UI/HomePage/home_page.dart';
import 'package:bow_wow/UI/Splash/Bloc/splash_state.dart';
import 'package:bow_wow/Utils/Services/navigator_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashBloc extends Cubit<SplashState>{
  SplashBloc(super.initialState);

  void startTimer(BuildContext context){
    Future.delayed(const Duration(seconds: 3),(){
      NavigatorService().pushAndRemove(context, const HomePage());
    });
  }
}