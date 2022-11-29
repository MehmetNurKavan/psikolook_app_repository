import 'package:flutter/material.dart';

class StateData extends ChangeNotifier {
  String adSoyad = 'Neriman Alaş';
  int seans = 4;
  void newSeans(int senasAdedi) {
    seans = senasAdedi;
    notifyListeners();
  }
}
