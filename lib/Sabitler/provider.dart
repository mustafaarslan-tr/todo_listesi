import 'package:flutter/material.dart';
import 'package:todo_list/Modeller/to_to_model.dart';

class ProviderData with ChangeNotifier {
  List<ToDoModel> gorevler = [];

  void YeniGorevEkleme(ToDoModel _gorev) {
    gorevler.add(_gorev);
    notifyListeners();
  }

  void ListedenGorevSilme(ToDoModel _gorev) {
    gorevler.remove(_gorev);
    notifyListeners();
  }
}
