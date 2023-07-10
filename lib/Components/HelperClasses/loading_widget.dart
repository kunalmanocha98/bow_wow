import 'package:bow_wow/Theme/colors.dart';
import 'package:flutter/material.dart';
/// Loading Widget Class
class LoadingWidget{

  // Circular Loader
  static Widget get circularLoader =>  Center(
    child: CircularProgressIndicator(color: AppColors.primaryColor,),
  );
}