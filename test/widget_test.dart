// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:bow_wow/Theme/Bloc/theme_bloc.dart';
import 'package:bow_wow/Theme/Bloc/theme_state.dart';
import 'package:bow_wow/UI/DetailsPage/Bloc/detail_bloc.dart';
import 'package:bow_wow/UI/DetailsPage/Bloc/detail_state.dart';
import 'package:bow_wow/UI/HomePage/Bloc/home_bloc.dart';
import 'package:bow_wow/UI/HomePage/Bloc/home_state.dart';
import 'package:bow_wow/UI/HomePage/Pages/AdoptedPetsListPage/Bloc/adopted_pets_bloc.dart';
import 'package:bow_wow/UI/HomePage/Pages/AdoptedPetsListPage/Bloc/adopted_pets_state.dart';
import 'package:bow_wow/UI/HomePage/Pages/AllPetsListPage/Bloc/all_pets_bloc.dart';
import 'package:bow_wow/UI/HomePage/Pages/AllPetsListPage/Bloc/all_pets_state.dart';
import 'package:bow_wow/UI/HomePage/Pages/UnAdoptedPetsListPage/Bloc/unadopted_list_bloc.dart';
import 'package:bow_wow/UI/HomePage/Pages/UnAdoptedPetsListPage/Bloc/unadopted_list_state.dart';
import 'package:bow_wow/UI/Splash/Bloc/splash_bloc.dart';
import 'package:bow_wow/UI/Splash/Bloc/splash_state.dart';
import 'package:bow_wow/UI/Splash/splash_page.dart';
import 'package:bow_wow/Utils/prefs.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:bow_wow/main.dart';

void main() {
  testWidgets('Bow Wow Smoke Test', (WidgetTester tester) async {
    // Initialize the values
    await Firebase.initializeApp();
    await Prefs.init();

    // Pump the widget
    await tester.pumpWidget(MultiBlocProvider(
        providers: [
          BlocProvider(create: (BuildContext context) => ThemeBloc(ThemeChangeState()),),
          BlocProvider(create: (BuildContext context) => SplashBloc(SplashInitialState()),),
          BlocProvider(create: (BuildContext context) => HomeBloc(HomeInitialState()),),
          BlocProvider(create: (BuildContext context) => AllPetsBloc(AllPetsInitialState()),),
          BlocProvider(create: (BuildContext context) => UnAdoptedListBloc(UnAdoptedInitialState()),),
          BlocProvider(create: (BuildContext context) => AdoptedPetsBloc(AdoptedPetsInitialState()),),
          BlocProvider(create: (BuildContext context) => DetailBloc(DetailInitialState()),),
        ],
        child: const MyApp()
    ));
    expect(find.byType(MyApp), findsOneWidget);


  });
}
