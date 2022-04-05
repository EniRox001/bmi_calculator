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
    return Expanded(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xFF000000),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
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
              const Expanded(
                child: Text(
                  'BMI Calculator',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 35.0,
                      fontWeight: FontWeight.w800),
                ),
              ),
              const Expanded(
                child: Text(
                  'Gender',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Expanded(
                flex: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    BuildWidget(icon: FontAwesomeIcons.mars, gender: 'Male'),
                    SizedBox(
                      width: 20.0,
                    ),
                    BuildWidget(icon: FontAwesomeIcons.venus, gender: 'Female')
                  ],
                ),
              ),
              const Expanded(
                child: Text(
                  'Weight',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.orange,
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.purple,
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.black,
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.amber,
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.grey,
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.deepOrangeAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BuildWidget extends StatelessWidget {
  const BuildWidget({
    Key? key,
    required this.icon,
    required this.gender,
  }) : super(key: key);

  final IconData icon;
  final String gender;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: const Color(
            0xFF333335,
          ),
          border: Border.all(
            width: 3.0,
            color: Colors.green,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                FaIcon(
                  icon,
                  color: Colors.white,
                  size: 50.0,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  gender,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
