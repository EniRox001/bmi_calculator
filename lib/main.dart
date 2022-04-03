import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000000),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //AppBar
            Padding(
              padding: const EdgeInsets.all(16.0),
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
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'BMI Calculator',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 35.0,
                        fontWeight: FontWeight.w800),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(
                      0.0,
                      40.0,
                      0.0,
                      10.0,
                    ),
                    child: Text(
                      'Gender',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      BuildGender(
                        icon: FontAwesomeIcons.mars,
                        gender: 'Male',
                      ),
                      BuildGender(
                        icon: FontAwesomeIcons.venus,
                        gender: 'Female',
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 35.0, 0.0, 10.0),
                    child: Text(
                      'Weight',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      WeightButton(),
                      SizedBox(
                        width: 15.0,
                      ),
                      DropDownList(),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 35.0, 0.0, 10.0),
                    child: Text(
                      'Height',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      WeightButton(),
                      SizedBox(
                        width: 16.0,
                      ),
                      DropDownList(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BuildGender extends StatelessWidget {
  const BuildGender({Key? key, required this.icon, required this.gender})
      : super(key: key);

  final IconData icon;
  final String gender;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Expanded(
        child: Container(
          padding: EdgeInsets.all(55.0),
          decoration: BoxDecoration(
            color: const Color(
              0xFF333335,
            ),
            border: Border.all(width: 3, color: Colors.green),
            borderRadius: const BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(
                icon,
                color: Colors.white,
                size: 40.0,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                gender,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WeightButton extends StatelessWidget {
  const WeightButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Button(icon: Icons.remove),
            Text(
              '56',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Button(icon: Icons.add)
          ],
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  const Button({Key? key, required this.icon}) : super(key: key);

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          primary: const Color(0xFF000000), shape: const CircleBorder()),
      child: Icon(icon),
    );
  }
}

class DropDownList extends StatefulWidget {
  const DropDownList({Key? key}) : super(key: key);

  @override
  State<DropDownList> createState() => _DropDownListState();
}

class _DropDownListState extends State<DropDownList> {
  String dropdownValue = 'Kg';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 28.0,
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
        color: Colors.white,
      ),
      child: DropdownButton<String>(
        value: dropdownValue,
        icon: const Icon(Icons.expand_more),
        elevation: 16,
        underline: Container(),
        style: const TextStyle(color: Colors.black),
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
          });
        },
        items: <String>[
          'Kg',
          'lbs',
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
