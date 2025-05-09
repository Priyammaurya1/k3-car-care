import 'package:flutter/material.dart';
import 'package:k3carcare/screens/car_selection.dart';
// Import your car model classes

class SelectedCarProvider extends ChangeNotifier {
  CarBrand? _selectedBrand;
  CarModel? _selectedModel;

  CarBrand? get selectedBrand => _selectedBrand;
  CarModel? get selectedModel => _selectedModel;

  void selectCar(CarBrand brand, CarModel model) {
    _selectedBrand = brand;
    _selectedModel = model;
    notifyListeners();
  }

  void clearSelection() {
    _selectedBrand = null;
    _selectedModel = null;
    notifyListeners();
  }
}