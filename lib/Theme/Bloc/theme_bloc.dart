import 'package:bow_wow/Theme/Bloc/theme_state.dart';
import 'package:bow_wow/Theme/colors.dart';
import 'package:bow_wow/Utils/prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeBloc extends Cubit<ThemeState> {
  ThemeBloc(super.initialState);

  static bool _isDarkTheme = false;

  ThemeMode get currentTheme {
    if(Prefs.containsKey(Prefs.themeKey)){
      return Prefs.getBool(Prefs.themeKey)! ? ThemeMode.dark : ThemeMode.light;
    }else{
      return _isDarkTheme ? ThemeMode.dark : ThemeMode.light;
    }
  }

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    Prefs.setBool(Prefs.themeKey, _isDarkTheme);
    emit(ThemeChangeState());
  }

  ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.appColorWhite,
      fontFamily: 'Raleway',
      useMaterial3: false,
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.primaryColor,
        onPrimary: AppColors.appColorWhite,
        secondary: AppColors.primaryColorDark,
        onSecondary: AppColors.appColorWhite,
        error: AppColors.appColorRed,
        onError: AppColors.appColorWhite,
        background: AppColors.appColorWhite,
        onBackground: AppColors.appColorBlack85,
        surface: AppColors.appColorWhite,
        onSurface: AppColors.appColorBlack85,
      ),
      dialogTheme: DialogTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)
        )
      ),
      cardTheme: CardTheme(
          color: AppColors.appColorWhite,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          shadowColor: AppColors.primaryColor.withOpacity(0.4),
          elevation: 12,
          margin:
              const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8)),
      appBarTheme: AppBarTheme(
          color: AppColors.appColorWhite,
          iconTheme: IconThemeData(color: AppColors.appColorBlack85),
          elevation: 0,
          titleTextStyle: TextStyle(
              fontSize: 24,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.bold,
              color: AppColors.appColorBlack85)),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
            padding: const EdgeInsets.all(12),
            backgroundColor: AppColors.primaryColor,
            foregroundColor: AppColors.appColorWhite,
            shape: const StadiumBorder(),
            textStyle: const TextStyle(
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold,
                fontSize: 14)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: TextButton.styleFrom(
            padding: const EdgeInsets.all(12),
            backgroundColor: AppColors.primaryColor,
            foregroundColor: AppColors.appColorWhite,
            shape: const StadiumBorder(),
            textStyle: const TextStyle(
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold,
                fontSize: 14)),
      ),
    );
  }

  ThemeData get darkTheme {
    return ThemeData(
      primaryColor: AppColors.primaryColorDark,
      scaffoldBackgroundColor: AppColors.primaryColorDark,
      fontFamily: 'Raleway',
      useMaterial3: false,
      unselectedWidgetColor: Colors.white,
      colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: AppColors.primaryColorDark,
        onPrimary: AppColors.appColorWhite,
        secondary: AppColors.primaryColorDark,
        onSecondary: AppColors.appColorWhite,
        error: AppColors.appColorRed,
        onError: AppColors.appColorWhite,
        background: AppColors.primaryColorDark,
        onBackground: AppColors.appColorWhite,
        surface: AppColors.primaryColorDark,
        onSurface: AppColors.appColorWhite,
      ),
      dialogTheme: DialogTheme(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)
          )
      ),
      cardTheme: CardTheme(
          color: AppColors.primaryColorDark,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          shadowColor: AppColors.primaryColor.withOpacity(0.4),
          elevation: 12,
          margin:
              const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8)),
      appBarTheme: AppBarTheme(
          color: AppColors.primaryColorDark,
          iconTheme: IconThemeData(color: AppColors.appColorWhite),
          elevation: 0,
          titleTextStyle: TextStyle(
              fontSize: 24,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.bold,
              color: AppColors.appColorWhite)),
      textTheme: ThemeData.dark().textTheme,
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.all(12),
              backgroundColor: AppColors.primaryColor,
              foregroundColor: Colors.white,
              shape: const StadiumBorder(),
              textStyle: const TextStyle(
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.bold,
                  fontSize: 14))),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(12),
              backgroundColor: AppColors.primaryColor,
              foregroundColor: Colors.white,
              shape: const StadiumBorder(),
              textStyle: const TextStyle(
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.bold,
                  fontSize: 14))),
    );
  }
}
