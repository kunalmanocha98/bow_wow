import 'package:bow_wow/Components/bottom_navigation.dart';
import 'package:bow_wow/Theme/Bloc/theme_bloc.dart';
import 'package:bow_wow/UI/HomePage/Bloc/home_bloc.dart';
import 'package:bow_wow/UI/HomePage/Bloc/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late HomeBloc homeBloc;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // homeBloc.addImage();
    });
  }

  @override
  Widget build(BuildContext context) {
    homeBloc = BlocProvider.of<HomeBloc>(context);
    
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (BuildContext context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(homeBloc.pageTitles[homeBloc.currentIndex]),
            actions: [
              IconButton(
                onPressed: () {
                  BlocProvider.of<ThemeBloc>(context).toggleTheme();
                },
                icon: Icon(
                    context.watch<ThemeBloc>().currentTheme == ThemeMode.dark
                        ? Icons.light_mode_outlined
                        : Icons.dark_mode_outlined),
              )
            ],
          ),
          body: Stack(
            children: [
              homeBloc.pages.elementAt(homeBloc.currentIndex),
              Align(
                alignment: Alignment.bottomLeft,
                child: _getBottomNavigationBar(),
              )
            ],
          ),
        );
      },
    );
  }

  _getBottomNavigationBar() {
    return CustomBottomNavigationBar(
        currentIndex: homeBloc.currentIndex,
        onSelection: onSelection);
  }

  void onSelection(int? index) {
    homeBloc.makeSelection(index);
  }
}
