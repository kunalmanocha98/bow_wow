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
import 'package:bow_wow/Utils/Constants/string_constants.dart';
import 'package:bow_wow/Utils/prefs.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Prefs.init();
  runApp(MultiBlocProvider(
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
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeBloc bloc = BlocProvider.of<ThemeBloc>(context);
    return BlocBuilder<ThemeBloc,ThemeState>(
      builder: (BuildContext context, state) {
        return MaterialApp(
          title: Strings.appName,
          debugShowCheckedModeBanner: false,
          theme: bloc.lightTheme,
          darkTheme: bloc.darkTheme,
          themeMode: bloc.currentTheme,
          home: const SplashPage(),
        );
      },
    );
  }
}
