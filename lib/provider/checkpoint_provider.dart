import 'package:flutter/material.dart';

class CheckPointProvider extends ChangeNotifier {
  final List<double> checkPointList = [];
  late double checkPointValue ; 
  List<double> get pointList => checkPointList;
  double get checkPoint => checkPointValue;
  // set setCheckPoint(double value) {
  //   checkPointList.add(value);
  //   notifyListeners();
  // }
   void setCheckPointValue(value){
      checkPointValue = value; 
      notifyListeners();
   }
  void setCheckPointList(double value) {
     checkPointList.add(value);
    notifyListeners();
  }
}
