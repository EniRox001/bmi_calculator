import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/build_gender.dart';
import 'components/build_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

var weight = 50;
var height = 162;
var age = 29;
List<String> weightCategory = [
  'kg',
  'lbs',
];
List<String> heightCategory = [
  'cm',
  'in',
];
String weightDropdownValue = 'kg';
String heightDropdownValue = 'cm';

class _HomeState extends State<Home> {
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
                Expanded(
                  //AppBar
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Icon(
                        Icons.sort,
                        color: Colors.white,
                        size: 30.0,
                      ),
                      Icon(
                        Icons.notifications,
                        color: Colors.white,
                        size: 30.0,
                      ),
                    ],
                  ),
                ),
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
                  height: 25.0,
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
                    children: const [
                      BuildGender(icon: FontAwesomeIcons.mars, gender: 'Male'),
                      SizedBox(
                        width: 20.0,
                      ),
                      BuildGender(
                          icon: FontAwesomeIcons.venus, gender: 'Female')
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
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 35.0),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        child: Expanded(
                          child: DropdownButton<String>(
                            value: weightDropdownValue,
                            icon: const Icon(
                              Icons.expand_more,
                            ),
                            underline: Container(),
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0),
                            onChanged: (String? newValue) {
                              setState(() {
                                weightDropdownValue = newValue!;
                              });
                            },
                            items: weightCategory
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25.0,
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
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 35.0),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        child: Expanded(
                          child: DropdownButton<String>(
                            value: heightDropdownValue,
                            icon: const Icon(
                              Icons.expand_more,
                            ),
                            underline: Container(),
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0),
                            onChanged: (String? newValue) {
                              setState(() {
                                heightDropdownValue = newValue!;
                              });
                            },
                            items: heightCategory
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25.0,
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
                SizedBox(
                  height: 25.0,
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
                      onPressed: () {},
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
