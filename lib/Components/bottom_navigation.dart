import 'package:bow_wow/Components/HelperClasses/shadows.dart';
import 'package:bow_wow/Theme/colors.dart';
import 'package:bow_wow/Utils/Constants/asset_constants.dart';
import 'package:bow_wow/Utils/typedefs/components_typedef.dart';
import 'package:flutter/material.dart';

/// Bottom NavigationBar made with custom UI
class CustomBottomNavigationBar extends StatelessWidget {
  /// used by the widgets to the highlighted Icon
  final int currentIndex;

  /// Callback function to set action on each selection
  final BottomNavigationClick onSelection;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onSelection,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(45),
            boxShadow: [CustomShadows.shadow_3_3],
            color: AppColors.primaryColorLight),
        margin: const EdgeInsets.only(left: 56.0, right: 56, bottom: 24),
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  onSelection(0);
                },
                child: Center(
                  child: Image.asset(AssetConstants.allIcon,
                      width: 24,
                      height: 24,
                      color: currentIndex == 0
                          ? AppColors.primaryColorDark
                          : AppColors.appColorWhite),
                ),
              ),
            ),
            _divider,
            Expanded(
              child: GestureDetector(
                onTap: () {
                  onSelection(1);
                },
                child: Center(
                    child: Image.asset(AssetConstants.adoptedIcon,
                        width: 24,
                        height: 24,
                        color: currentIndex == 1
                            ? AppColors.primaryColorDark
                            : AppColors.appColorWhite)),
              ),
            ),
            _divider,
            Expanded(
              child: GestureDetector(
                onTap: () {
                  onSelection(2);
                },
                child: Center(
                    child: Image.asset(AssetConstants.adoptedIcon,
                        width: 24,
                        height: 24,
                        color: currentIndex == 2
                            ? AppColors.primaryColorDark
                            : AppColors.appColorWhite)),
              ),
            ),
          ],
        ));
  }


  // Divider Widget
  Widget get _divider => SizedBox(
        height: 40,
        width: 1,
        child: Container(
          color: AppColors.appColorWhite,
        ),
      );
}
