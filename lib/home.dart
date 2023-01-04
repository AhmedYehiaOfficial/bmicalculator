//import 'package:bmi_calculator/result.dart';
import 'package:flutter/material.dart';
import 'result.dart';
import 'dart:math';

class MyHomePage extends StatefulWidget {
  const MyHomePage();

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isMale = true;
  double heighval = 170;
  int weight = 55;
  int age = 15;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    genderExpanded(context, 'Male'),
                    const SizedBox(
                      width: 15,
                    ),
                    genderExpanded(context, 'Female'),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.brown),
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Text('Height',
                          style: Theme.of(context).textTheme.headline2),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            heighval.toStringAsFixed(1),
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          Text(
                            'CM',
                            style: Theme.of(context).textTheme.bodyText1,

                          ),
                        ],
                      ),
                      Slider(
                          inactiveColor: Colors.blueGrey,
                          activeColor: Colors.black,
                          value: heighval,
                          onChanged: (newValue) {
                            setState(() {
                              heighval=newValue;
                            });
                          },
                          min: 90,
                          max: 220),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    bodyInfoExpanded(
                      context,
                      'Weight',
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    bodyInfoExpanded(
                      context,
                      'Age',
                    ),
                  ],
                ),
              ),
            ),
            Container(
                color: Colors.brown,
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 16,
                child: TextButton(
                    onPressed: () {
                      var result = weight / pow(heighval / 100, 2);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return ResultScreen(
                              age: age,
                              isMale: isMale,
                              result: result,
                            );
                          }));
                    },
                    child: Text(
                      'Calculate',
                      style: Theme.of(context).textTheme.headline2,
                    ))),
          ],
        ),
      ),
    );
  }

  Expanded genderExpanded(BuildContext context, String type) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isMale = (type == 'Male') ? true : false;
          });
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: (isMale && type == 'Male') || (!isMale && type == 'Female')
                  ? Colors.brown
                  : Colors.blueGrey),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                type == 'Male' ? Icons.male : Icons.female,
                size: 90,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                type,
                style: Theme.of(context).textTheme.headline2,
              )
            ],
          ),
        ),
      ),
    );
  }

  Expanded bodyInfoExpanded(
      BuildContext,
      String type,
      ) {
    {
      return Expanded(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.blueGrey),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                type == 'Age' ? 'Age' : 'Weight',
                style: Theme.of(context).textTheme.headline2,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                type == 'Age' ? '$age' : '$weight',
                style: Theme.of(context).textTheme.headline1,
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    heroTag: type == 'Age' ? 'Age--' : 'Weight--',
                    onPressed: () {
                      setState(() {
                        type == 'Age' ? age++ : weight++;
                      });
                    },
                    mini: true,
                    child: const Icon(Icons.add),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  FloatingActionButton(
                    heroTag: type == 'Age' ? 'Age++' : 'Weight++',
                    onPressed: () {
                      setState(() {
                        type == 'Age' ? age-- : weight--;
                      });
                    },
                    mini: true,
                    child: const Icon(Icons.remove),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    }
  }
}
