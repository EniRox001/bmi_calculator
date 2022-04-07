import 'package:flutter/material.dart';

class BuildDropdown extends StatelessWidget {
  const BuildDropdown({
    Key? key,
    required this.dropDownItems,
    required this.defaultValue,
    required this.onPress,
  }) : super(key: key);

  final List<String> dropDownItems;
  final String defaultValue;
  final Function(String? newValue) onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 35.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: Expanded(
        child: DropdownButton<String>(
          value: defaultValue,
          icon: const Icon(
            Icons.expand_more,
          ),
          underline: Container(),
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.0),
          onChanged: onPress,
          items: dropDownItems.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
