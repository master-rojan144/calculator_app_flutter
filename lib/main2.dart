import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator Vr.1',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.blue)),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _num1 = TextEditingController();
  final TextEditingController _num2 = TextEditingController();
  double result = 0;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Calculator',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(50, 20, 50, 10),
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            decoration: BoxDecoration(
              border: Border.all(width: 1),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: TextField(
              controller: _num1,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onTap: () => _num1.clear(),
              decoration: InputDecoration(
                hintText: 'Enter first number',
                border: InputBorder.none,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(50, 20, 50, 10),
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            decoration: BoxDecoration(
              border: Border.all(width: 1),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: TextField(
              controller: _num2,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onTap: () => _num2.clear(),
              decoration: InputDecoration(
                hintText: 'Enter second number',
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(height: 30),

          Text(
            (result == 0)
                ? 'Result: ${result.toStringAsPrecision(1)}'
                : 'Result: ${result.toStringAsFixed(2)}',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 30),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    width: screenWidth * 0.2,

                    decoration: BoxDecoration(border: Border.all(width: 0.5)),

                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          result =
                              double.parse(_num1.text) +
                              double.parse(_num2.text);
                        });
                      },
                      icon: Icon(Icons.add),
                    ),
                  ),
                  // Subract
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    width: screenWidth * 0.2,

                    decoration: BoxDecoration(border: Border.all(width: 0.5)),

                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          result =
                              double.parse(_num1.text) -
                              double.parse(_num2.text);
                        });
                      },
                      icon: Icon(Icons.remove),
                    ),
                  ),
                  //Multiply
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    width: screenWidth * 0.2,

                    decoration: BoxDecoration(border: Border.all(width: 0.5)),

                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          result =
                              double.parse(_num1.text) *
                              double.parse(_num2.text);
                        });
                      },
                      icon: Icon(Icons.clear),
                    ),
                  ),
                ],
              ),
              // Divide
              Container(
                margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                width: screenWidth * 0.2,

                decoration: BoxDecoration(border: Border.all(width: 0.5)),

                child: IconButton(
                  onPressed: () {
                    setState(() {
                      result =
                          double.parse(_num1.text) / double.parse(_num2.text);
                    });
                  },
                  icon: Icon(Icons.safety_divider),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
