import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class settingsprovider extends ChangeNotifier{
  ThemeMode currentmode = ThemeMode.light;
  setmode(mode)
  {
    currentmode = mode;
    notifyListeners();
  }
}