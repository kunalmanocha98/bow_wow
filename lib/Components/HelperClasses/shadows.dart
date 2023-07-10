import 'package:bow_wow/Theme/colors.dart';
import 'package:flutter/cupertino.dart';


// Class to show shadows for cards
class CustomShadows{

  static BoxShadow get shadow_2_2 => BoxShadow(
      color: AppColors.appColorBlack35,
      blurRadius: 6,
      offset: const Offset(2,2),
      spreadRadius: 2,

  );

  static BoxShadow get shadow_3_3 => BoxShadow(
    color: AppColors.primaryColor.withOpacity(0.3),
    blurRadius: 6,
    offset: const Offset(3,3),
    spreadRadius: 2,

  );

  static BoxShadow get shadow_4_4 => BoxShadow(
      color: AppColors.appColorBlack35,
      blurRadius: 6,
      offset: const Offset(4,4),
      spreadRadius: 4,

  );

  static BoxShadow get shadow_5_5 => BoxShadow(
      color: AppColors.appColorBlack35,
      blurRadius: 6,
      offset: const Offset(5,5),
      spreadRadius: 4,

  );

}