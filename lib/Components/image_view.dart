import 'dart:math';

import 'package:bow_wow/Theme/colors.dart';
import 'package:bow_wow/Utils/Constants/string_constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AppImageView {
  Widget appListImageView(
      BuildContext context, String imageUrl, bool isAdopted) {
    return isAdopted
        ? ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: ColorFiltered(
              colorFilter: const ColorFilter.mode(
                Colors.grey,
                BlendMode.saturation,
              ),
              child: _listImage(context, imageUrl, isAdopted),
            ),
          )
        : _listImage(context, imageUrl, isAdopted);
  }

  Widget _listImage(BuildContext context, String imageUrl, bool isAdopted) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
              image: CachedNetworkImageProvider(imageUrl ?? ""),
              fit: BoxFit.cover)),
      child: isAdopted
          ? Center(
              child: Transform.rotate(
                  angle: -pi / 7,
                  child: Text(
                    Strings.adopted.toUpperCase(),
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                        color: AppColors.appColorWhite, letterSpacing: 1),
                  )),
            )
          : null,
    );
  }

  Widget appDetailImageView(BuildContext context, String imageUrl, bool isAdopted) {
    return isAdopted
        ? ColorFiltered(
          colorFilter: const ColorFilter.mode(
            Colors.grey,
            BlendMode.saturation,
          ),
          child: _detailImageView(context, imageUrl, isAdopted),
        )
        : _detailImageView(context, imageUrl, isAdopted);
  }

  Widget _detailImageView(BuildContext context, String imageUrl, bool isAdopted){
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
        image: DecorationImage(
          image: CachedNetworkImageProvider(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: isAdopted
          ? Center(
        child: Transform.rotate(
            angle: -pi / 7,
            child: Text(
              Strings.adopted.toUpperCase(),
              style: Theme.of(context).textTheme.headline2!.copyWith(
                  color: AppColors.appColorWhite, letterSpacing: 1),
            )),
      )
          : null,
    );
  }
}
