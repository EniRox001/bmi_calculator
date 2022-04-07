import 'package:bmi_calculator/calculator_brain.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'result_screen.dart';
import '../components/build_gender.dart';
import '../components/build_button.dart';
import '../components/build_dropdown.dart';
import '../constants.dart';

enum Gender { male, female }

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Gender selectedGender = Gender.male;

  void convertWeightUnit(dropdownValue) {
    if (dropdownValue == 'lbs') {
      setState(() {
        weight = (weight * 2.205).round();
      });
    } else if (dropdownValue == 'kg') {
      setState(() {
        weight = weight ~/ 2.205;
      });
    }
  }

  void convertHeightUnit(dropdownValue) {
    if (dropdownValue == 'in') {
      setState(() {
        height = (height * 0.3937).round();
      });
    } else if (dropdownValue == 'cm') {
      setState(() {
        height = height ~/ 0.3937;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Scaffold(
            backgroundColor: const Color(0xFF000000),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  'BMI Calculator',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 35.0,
                      fontWeight: FontWeight.w800),
                ),
                const SizedBox(
                  height: sizedBoxHeight,
                ),
                const Text(
                  'Gender',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Expanded(
                  flex: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      BuildGender(
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.male;
                          });
                        },
                        icon: FontAwesomeIcons.mars,
                        gender: 'Male',
                        colour: selectedGender == Gender.male
                            ? Colors.green
                            : Colors.transparent,
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      BuildGender(
                          onPress: () {
                            setState(() {
                              selectedGender = Gender.female;
                            });
                          },
                          icon: FontAwesomeIcons.venus,
                          gender: 'Female',
                          colour: selectedGender == Gender.female
                              ? Colors.green
                              : Colors.transparent)
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25.0,
                ),
                const Text(
                  'Weight',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Expanded(
                  child: Row(
                    children: [
                      BuildButton(
                          measure: weight,
                          onSubtract: () {
                            setState(() {
                              weight--;
                            });
                          },
                          onAdd: () {
                            setState(() {
                              weight++;
                            });
                          }),
                      const SizedBox(
                        width: 20.0,
                      ),
                      BuildDropdown(
                          dropDownItems: weightCategory,
                          defaultValue: weightDropdownValue,
                          onPress: (String? newValue) {
                            setState(() {
                              weightDropdownValue = newValue!;
                              convertWeightUnit(weightDropdownValue);
                            });
                          })
                    ],
                  ),
                ),
                const SizedBox(
                  height: sizedBoxHeight,
                ),
                const Text(
                  'Height',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Expanded(
                  child: Row(
                    children: [
                      BuildButton(
                          measure: height,
                          onSubtract: () {
                            setState(() {
                              height--;
                            });
                          },
                          onAdd: () {
                            setState(() {
                              height++;
                            });
                          }),
                      const SizedBox(
                        width: 20.0,
                      ),
                      BuildDropdown(
                          dropDownItems: heightCategory,
                          defaultValue: heightDropdownValue,
                          onPress: (String? newValue) {
                            setState(() {
                              heightDropdownValue = newValue!;
                              convertHeightUnit(heightDropdownValue);
                            });
                          })
                    ],
                  ),
                ),
                const SizedBox(
                  height: sizedBoxHeight,
                ),
                const Text(
                  'Age',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                BuildButton(
                    measure: age,
                    onSubtract: () {
                      setState(() {
                        age--;
                      });
                    },
                    onAdd: () {
                      setState(() {
                        age++;
                      });
                    }),
                const SizedBox(
                  height: sizedBoxHeight,
                ),
                Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0))),
                      onPressed: () {
                        CalculatorBrain calc = CalculatorBrain(
                            weightDropdownValue: weightDropdownValue,
                            heightDropdownValue: heightDropdownValue,
                            weight: weight,
                            height: height);

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ResultScreen(
                                    bmiResult: calc.calculateBMI(),
                                    interpretation: calc.getInterpretation(),
                                    resultText: calc.getResult())));
                      },
                      child: const Text(
                        'Calculate',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
