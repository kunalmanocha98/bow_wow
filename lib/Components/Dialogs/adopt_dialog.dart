import 'package:bow_wow/Utils/Constants/asset_constants.dart';
import 'package:bow_wow/Utils/Constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

/// Custom Dialog class to show successful adoption
class AdoptSuccessfulDialog extends StatelessWidget {
  const AdoptSuccessfulDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        height: 200,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    Strings.congratulations,
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Text(
                    Strings.youAdoptAPet,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(fontWeight: FontWeight.normal),
                  )
                ],
              ),
            ),
            // Lottie animation to show confetti
            Align(
              alignment: Alignment.center,
              child: Lottie.asset(
                AssetConstants.confettiJson,
                fit: BoxFit.contain,
                width: 150,
                height: 150,
                animate: true,
                repeat: false,
              ),
            )
          ],
        ),
      ),
    );
  }
}
