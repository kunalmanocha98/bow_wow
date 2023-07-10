import 'package:bow_wow/Utils/Constants/asset_constants.dart';
import 'package:bow_wow/Utils/Constants/string_constants.dart';
import 'package:flutter/material.dart';

class NotFoundWidget extends StatelessWidget{
  const NotFoundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(AssetConstants.notFoundIcon,
          width: 120,
          height: 120,),
          const SizedBox(height: 24,),
          Text(Strings.nothingFound)
        ],
      ),
    );
  }

}