import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator Vr.2',
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userInput = '';
  var result = '';
  final List<String> buttons = [
    'C',
    '+/-',
    '%',
    'DEL',
    '7',
    '8',
    '9',
    '/',
    '4',
    '5',
    '6',
    '*',
    '1',
    '2',
    '3',
    '-',
    '0',
    '.',
    '=',
    '+',
  ];

  bool isOperator(String x) {
    if (x == '/' || x == '-' || x == '+' || x == '*') return true;
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Calculator', style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.centerRight,
                  child: Text(userInput, style: TextStyle(fontSize: 20),),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.centerRight,
                  child: Text(result, style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: GridView.builder(
                itemCount: buttons.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return Button(
                      color: Colors.blue[100],
                      textColor: Colors.black,
                      buttonText: buttons[index],
                      buttonTapped: () {
                        setState(() {
                          userInput = '';
                          result = '0';
                        });
                      },
                    );
                  } else if (index == 1) {
                    return Button(
                      buttonText: buttons[index],
                      color: Colors.blue[100],
                      textColor: Colors.black,
                    );
                  } else if (index == 2) {
                    return Button(
                      buttonText: buttons[index],
                      color: Colors.blue[100],
                      textColor: Colors.black,
                      buttonTapped: () {
                        setState(() {
                          userInput += buttons[index];
                        });
                      },
                    );
                  } else if (index == 3) {
                    return Button(
                      buttonText: buttons[index],
                      color: Colors.blue[100],
                      textColor: Colors.black,
                      buttonTapped: () {
                        setState(() {
                          userInput = userInput.substring(
                            0,
                            userInput.length - 1,
                          );
                        });
                      },
                    );
                  } else if (index == 18) {
                    return Button(
                      buttonText: buttons[index],
                      color: Colors.orange,
                      textColor: Colors.white,
                      buttonTapped: () {
                        setState(() {
                          printResult();
                        });
                      },
                    );
                  } else {
                    return Button(
                      buttonText: buttons[index],
                      textColor: isOperator(buttons[index])
                          ? Colors.white
                          : Colors.black,
                      color: isOperator(buttons[index])
                          ? Colors.blue
                          : Colors.white,
                      buttonTapped: (){
                        setState(() {
                          userInput += buttons[index];
                        });
                      },
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void printResult() {
    String finalUserInput = userInput;
    ShuntingYardParser p = ShuntingYardParser();
    Expression exp = p.parse(finalUserInput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    result = eval.toString();
  }
}

class Button extends StatelessWidget {
  final color;
  final textColor;
  final buttonTapped;
  final String buttonText;

  const Button({
    super.key,
    this.color,
    this.textColor,
    this.buttonTapped,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTapped,
      child: ClipRRect(
        child: Container(
          color: color,
          child: Center(
            child: Text(
              buttonText,
              style: TextStyle(
                color: textColor,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
