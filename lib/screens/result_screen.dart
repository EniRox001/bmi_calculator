import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {Key? key,
      required this.bmiResult,
      required this.resultText,
      required this.interpretation})
      : super(key: key);

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Scaffold(
          backgroundColor: const Color(0xFF000000),
          appBar: AppBar(
            backgroundColor: const Color(0xFF000000),
          ),
          body: Column(
            children: [
              const Text(
                'Result',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: sizedBoxHeight,
              ),
              Expanded(
                flex: 6,
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(
                      0xFF333335,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        10.0,
                      ),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Your current BMI',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        bmiResult,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 50.0,
                          fontWeight: FontWeight.w800,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: sizedBoxHeight,
              ),
              RichText(
                text: TextSpan(
                  text: 'Your current BMI is ',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: bmiResult,
                      style: TextStyle(
                        color: resultText == 'OVERWEIGHT'
                            ? Colors.red
                            : resultText == 'NORMAL'
                                ? Colors.green
                                : Colors.yellow,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const TextSpan(text: ' indicating your weight is in the '),
                    TextSpan(
                      text: resultText,
                      style: TextStyle(
                        color: resultText == 'OVERWEIGHT'
                            ? Colors.red
                            : resultText == 'NORMAL'
                                ? Colors.green
                                : Colors.yellow,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const TextSpan(text: ' category for adults of your height.')
                  ],
                ),
              ),
              const SizedBox(
                height: sizedBoxHeight,
              ),
              Text(
                interpretation,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
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
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Recalculate BMI',
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
    );
  }
}
