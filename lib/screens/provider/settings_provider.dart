import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/firebase/firebasefunctions.dart';
import 'package:todo/screens/models/usermodel.dart';

class settingsprovider extends ChangeNotifier{
  UserModel? user;
  User ? firebaseUser;
  ThemeMode currentmode = ThemeMode.light;
settingsprovider(){
  firebaseUser = FirebaseAuth.instance.currentUser;
  if (firebaseUser != null)
    {
      initUser();
    }
}
  setmode(mode)
  {
    currentmode = mode;
    notifyListeners();
  }
  initUser() async{
    firebaseUser = FirebaseAuth.instance.currentUser;
    user =await FirebaseFunctions.readUser(firebaseUser!.uid);
notifyListeners();
  }
}