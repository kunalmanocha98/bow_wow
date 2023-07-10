import 'package:bow_wow/Components/HelperClasses/loading_widget.dart';
import 'package:bow_wow/Utils/Constants/string_constants.dart';
import 'package:flutter/material.dart';


/// Adopt Button to show at the bottom of details page
class AdoptButton extends StatelessWidget{
  final bool isAdopted;
  final void Function()? onClick;
  final bool isLoading;
  const AdoptButton({super.key,required this.isAdopted,this.onClick,required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: TextButton(
            onPressed: isAdopted ? null : onClick,
            style:  isAdopted ?TextButton.styleFrom(backgroundColor: Colors.grey):null,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: isLoading?
                  SizedBox(height:36,child: LoadingWidget.circularLoader)
                  :Text(
                isAdopted?Strings.youAdoptThisPet:Strings.adopt,
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            )));
  }

}