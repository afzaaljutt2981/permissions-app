import 'package:flutter/material.dart';
import 'package:permissions_app/core/enums/data_source_enum.dart';


class DataSourceController extends ChangeNotifier {
  DataSourceEnum? _selectedSource;

  DataSourceEnum? get selectedSource => _selectedSource;

  void selectSource(DataSourceEnum source) {
    _selectedSource = source;
    notifyListeners();
  }

  bool isSelected(DataSourceEnum source) => _selectedSource == source;
}
