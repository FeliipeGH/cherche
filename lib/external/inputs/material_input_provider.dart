import 'package:flutter/cupertino.dart';

class MaterialInputProvider with ChangeNotifier {
  bool _makeValidation = false;

  bool get makeValidation => _makeValidation;

  void setMakeValidation() {
    _makeValidation = true;
    notifyListeners();
  }

  void setNotMakeValidation(){
    _makeValidation=false;
  }
}
