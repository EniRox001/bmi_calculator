import 'package:flutter/material.dart';

class BuildButton extends StatelessWidget {
  const BuildButton({
    Key? key,
    required this.measure,
    required this.onSubtract,
    required this.onAdd,
  }) : super(key: key);

  final int measure;
  final Function() onSubtract;
  final Function() onAdd;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.black, shape: const CircleBorder()),
              onPressed: onSubtract,
              child: const Icon(
                Icons.remove,
                color: Colors.white,
              ),
            ),
            Text(
              measure.toString(),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.black, shape: const CircleBorder()),
              onPressed: onAdd,
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
