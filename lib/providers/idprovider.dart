import 'package:flutter/cupertino.dart';

class IdProvider extends ChangeNotifier{
  String? id;
  setValue(String a){
    id=a;
    notifyListeners();
  }
}