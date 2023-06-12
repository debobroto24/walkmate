import 'package:flutter/material.dart';
import 'package:walkmate/pages/check_point.dart';
import 'package:walkmate/pages/home_page.dart';
import 'package:walkmate/pages/set_limit.dart';

class RouteGenerator{ 
  static const String checkPointPage= '/checkPoint';
  static const String setLimitPage= '/setLimit';
  static const String homePage= '/homePage';
  static Route<dynamic> generateRoute(RouteSettings setting){
    switch (setting.name) {
      case checkPointPage:
        return MaterialPageRoute(builder:(_)=> CheckPoint()) ;
        break;
      case checkPointPage:
        return MaterialPageRoute(builder:(_)=> CheckPoint()) ;
        break;
      case setLimitPage:
        return MaterialPageRoute(builder:(_)=>SetLimit()) ;
        break;
      default:
        return MaterialPageRoute(builder: (_)=>HomePage());
    }
  }
}