
import 'package:flutter/material.dart';

class NavigatorService{

  Future<dynamic> push(BuildContext context, Widget child){
    return Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return child;
    }));
  }

  Future<Object?> pushAndRemove(BuildContext context, Widget child){
    return Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context) {
      return child;
    }),(_)=>false);
  }

}