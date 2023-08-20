import 'package:bow_wow/Theme/colors.dart';
import 'package:bow_wow/UI/OnboardingPage/Bloc/onboarding_bloc.dart';
import 'package:bow_wow/Utils/Constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  OnBoardingPageState createState() => OnBoardingPageState();
}

class OnBoardingPageState extends State<OnBoardingPage> {
  late OnBoardingBloc onBoardingBloc;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      onBoardingBloc.openHomePage(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    onBoardingBloc = BlocProvider.of<OnBoardingBloc>(context);
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(width: double.infinity,),
          Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
              color: AppColors.primaryColorLight,
              shape: BoxShape.circle,
            ),
            child: Image.asset('assets/images/dog_onboard.png'),
          ),
          Text(
            Strings.appName,
            style: GoogleFonts.pacifico(
              color: AppColors.appColorWhite,
                textStyle: Theme.of(context).textTheme.headline2),

          ),
          // const Spacer(),
          // const LargeButtonPrimary(),
        ],
      ),
    );
  }
}
