import 'dart:async';
import 'package:flutter/cupertino.dart';
import '../Model/data_model.dart';

class AppState extends ChangeNotifier {
  int temp = 50;

  void updateValue(int temp) {
    this.temp += temp;
    notifyListeners();
  }

  //Timer Function
  int start = 0;

  void updateTime(int start) {
    this.start = start;
    notifyListeners();
  }

  void getTime() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      updateTime(timer.tick);
    });
  }

  //Provider with Async
  String name = "JG";

  void updateName(String name) {
    this.name = name;
    notifyListeners();
  }

  Future<void> getName(String name) async {
    Future.delayed(Duration(seconds: 4), () {
      updateName(name);
    });
  }

  // Provider Working With Rest Api
  List<DataModel> dataList = [];

  void updataModelData(List<DataModel> dataList) {
    this.dataList = dataList;
    startLoader(false);
    notifyListeners();
  }

  bool loader = false;

  void startLoader(bool loader) {
    this.loader = loader;
    notifyListeners();
  }
}
