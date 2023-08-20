import 'package:bow_wow/Theme/colors.dart';
import 'package:bow_wow/Utils/Constants/string_constants.dart';
import 'package:flutter/material.dart';

class LargeButtonPrimary extends StatelessWidget{
  final void Function()? onClick;
  const LargeButtonPrimary({super.key,this.onClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(16),
      child:  TextButton(
          onPressed: onClick,
          style: TextButton.styleFrom(backgroundColor: AppColors.appColorWhite),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              Strings.getStarted,
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          )),
    );
  }

}

class LargeButtonSecondary extends StatelessWidget{
  final void Function()? onClick;
  const LargeButtonSecondary({super.key,this.onClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(16),
      child:  TextButton(
          onPressed: onClick,
          style: TextButton.styleFrom(backgroundColor: AppColors.primaryColorLight),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              Strings.getStarted,
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          )),
    );
  }

}