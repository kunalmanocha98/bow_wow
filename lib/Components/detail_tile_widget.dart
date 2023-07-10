import 'package:bow_wow/Theme/colors.dart';
import 'package:flutter/material.dart';

class DetailTileWidget extends StatelessWidget {
  final Color color;
  final String title;
  final String value;

  const DetailTileWidget(
      {super.key, required this.color, required this.title, required this.value,});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
          color: color,
        borderRadius: BorderRadius.circular(12)
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(value,style: Theme.of(context).textTheme.headline6!.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.appColorBlack85
            ),),
            const SizedBox(height: 12,),
            Text(title,style: Theme.of(context).textTheme.bodyText1!.copyWith(
              color: AppColors.appColorBlack85
            ),)
          ],
        ),
      ),
    );
  }

}