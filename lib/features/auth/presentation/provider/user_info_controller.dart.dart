import 'package:flutter/material.dart';

class UserInfoController extends ChangeNotifier {
  String _fullName = '';
  String _email = '';
  String _phone = '';
  String _gender = 'Male';

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController dobController = TextEditingController();

  UserInfoController() {
    nameController.addListener(() {
      _fullName = nameController.text;
    });
    emailController.addListener(() {
      _email = emailController.text;
    });
    phoneController.addListener(() {
      _phone = phoneController.text;
    });
  }
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Email is required';
    if (!value.contains('@')) return 'Invalid email';
    return null;
  }

  String? validatePhone(String? value) {
    if (value == null || value.length < 10) return 'Invalid phone';
    return null;
  }

  void setDOB(String dob) {
    dobController.text = dob;
    notifyListeners();
  }

  void setGender(String? gender) {
    if (gender != null) {
      _gender = gender;
      notifyListeners();
    }
  }

  String get fullName => _fullName;
  String get email => _email;
  String get phone => _phone;
  String get gender => _gender;

  bool validateFields(GlobalKey<FormState> formKey) {
    return formKey.currentState?.validate() ?? false;
  }
}
