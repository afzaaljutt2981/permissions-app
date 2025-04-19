import 'package:flutter/material.dart';

class PrivacyPolicyProvider extends ChangeNotifier {
  bool _agreed = false;
  bool get agreed => _agreed;

  void toggleAgreement(bool value) {
    _agreed = value;
    notifyListeners();
  }
}
