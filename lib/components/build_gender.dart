import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BuildGender extends StatelessWidget {
  const BuildGender({
    Key? key,
    required this.onPress,
    required this.icon,
    required this.gender,
    required this.colour,
  }) : super(key: key);

  final Function() onPress;
  final IconData icon;
  final String gender;
  final Color colour;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onPress,
        child: Container(
          decoration: BoxDecoration(
            color: const Color(
              0xFF333335,
            ),
            border: Border.all(
              width: 3.0,
              color: colour,
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
      ),
    );
  }
}
