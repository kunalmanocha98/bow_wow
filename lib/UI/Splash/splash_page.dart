
import 'package:bow_wow/UI/Splash/Bloc/splash_bloc.dart';
import 'package:bow_wow/UI/Splash/Bloc/splash_state.dart';
import 'package:bow_wow/Utils/Constants/asset_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<StatefulWidget> createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  late SplashBloc splashBloc;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      splashBloc.startTimer(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    splashBloc = BlocProvider.of<SplashBloc>(context);
    return Scaffold(
      body: BlocBuilder<SplashBloc,SplashState>(
        builder: (BuildContext context, state) {
          return Center(
            child: Image.asset(AssetConstants.appIcon,width: 100,height: 100,),
          );
        },
      ),
    );
  }
}
