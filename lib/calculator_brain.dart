import 'dart:math';

class CalculatorBrain {
  String weightDropdownValue;
  String heightDropdownValue;
  int height;
  int weight;

  late double _bmi;

  CalculatorBrain({
    required this.weightDropdownValue,
    required this.heightDropdownValue,
    required this.weight,
    required this.height,
  });

  String calculateBMI() {
    if (weightDropdownValue == 'kg' && heightDropdownValue == 'cm') {
      _bmi = weight / pow(height / 100, 2);
      return _bmi.toStringAsFixed(1);
    } else if (weightDropdownValue == 'kg' && heightDropdownValue == 'in') {
      _bmi = weight / pow((height ~/ 0.3937) / 100, 2);
      return _bmi.toStringAsFixed(1);
    } else if (weightDropdownValue == 'lbs' && heightDropdownValue == 'cm') {
      _bmi = (weight ~/ 2.205) / pow(height / 100, 2);
      return _bmi.toStringAsFixed(1);
    } else {
      _bmi = (weight ~/ 2.205) / pow((height ~/ 0.3937) / 100, 2);
      return _bmi.toStringAsFixed(1);
    }
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'OVERWEIGHT';
    } else if (_bmi >= 18.5) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You\'re a bit heavy right now. Eat less, and exercise more.';
    } else if (_bmi >= 18.5) {
      return 'You\'re got yourself a great BMI, you sexy devil.';
    } else {
      return 'You\'re a bit underweight, you gotta eat more.';
    }
  }
}
