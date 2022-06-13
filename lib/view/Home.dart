import 'dart:io';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:bmi_calculator/controller/bmiController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _controller = BmiController();
  int currentTab = 0;
  final weight = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(25, 35, 0, 0),
                    child: Text("BMI Calculator",
                        style: TextStyle(
                            fontSize: 27, fontWeight: FontWeight.w500)),
                  ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          border: Border.all(
                            color: const Color.fromARGB(255, 215, 215, 215),
                            width: 1,
                          ),
                        ),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.resolveWith<Color?>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed))
                                  return Colors.orangeAccent; //<-- SEE HERE
                                return null; // Defer to the widget's default.
                              },
                            ),
                            elevation: MaterialStateProperty.all(0),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            // MaterialStateProperty<Color?>?
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                          ),
                          child: Column(
                            children: [
                              const SizedBox(height: 30),
                              Image.asset(
                                _controller.gender[0].image!,
                                height:
                                    MediaQuery.of(context).size.height * 0.055,
                                color: Colors.orange,
                              ),
                              const SizedBox(height: 15),
                              Text(
                                _controller.gender[0].gender!,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                          onPressed: () {},
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          border: Border.all(
                            color: const Color.fromARGB(255, 215, 215, 215),
                            width: 1,
                          ),
                        ),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.resolveWith<Color?>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed))
                                  return Colors.redAccent; //<-- SEE HERE
                                return null; // Defer to the widget's default.
                              },
                            ),
                            elevation: MaterialStateProperty.all(0),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            // MaterialStateProperty<Color?>?
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                          ),
                          child: Column(
                            children: [
                              const SizedBox(height: 30),
                              Image.asset(
                                _controller.gender[1].image!,
                                height:
                                    MediaQuery.of(context).size.height * 0.055,
                                color: Colors.pink,
                              ),
                              const SizedBox(height: 15),
                              Text(
                                _controller.gender[1].gender!,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      border: Border.all(
                        color: const Color.fromARGB(255, 215, 215, 215),
                        width: 1,
                      ),
                    ),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text('Height(in cm)',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500)),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          child: SfSlider(
                              showTicks: true,
                              shouldAlwaysShowTooltip: true,
                              showLabels: true,
                              enableTooltip: true,
                              minorTicksPerInterval: 3,
                              tooltipShape: const SfPaddleTooltipShape(),
                              min: 0,
                              max: 200,
                              interval: 30,
                              value: _controller.values,
                              onChanged: (dynamic value) {
                                setState(() {
                                  _controller.values = value;
                                });
                              }),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          border: Border.all(
                            color: const Color.fromARGB(255, 215, 215, 215),
                            width: 1,
                          ),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 20),
                            Text(
                              _controller.select[0].weight!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 30),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 2),
                                    filled: true,
                                    focusColor: Colors.red,
                                    fillColor: Colors.white),
                                controller: weight,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          border: Border.all(
                            color: const Color.fromARGB(255, 215, 215, 215),
                            width: 1,
                          ),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 20),
                            Text(
                              _controller.select[0].age!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: Text(
                                _controller.age.toString(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  width:
                                      MediaQuery.of(context).size.width * 0.13,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.blue[800],
                                    border: Border.all(
                                      color: const Color.fromARGB(
                                          255, 102, 101, 101),
                                      width: 1,
                                    ),
                                  ),
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      overlayColor: MaterialStateProperty
                                          .resolveWith<Color?>(
                                        (Set<MaterialState> states) {
                                          if (states
                                              .contains(MaterialState.pressed))
                                            return Colors
                                                .orangeAccent; //<-- SEE HERE
                                          return null; // Defer to the widget's default.
                                        },
                                      ),
                                      elevation: MaterialStateProperty.all(0),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.blue[800]),
                                      // MaterialStateProperty<Color?>?
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                      ),
                                    ),
                                    child: const Icon(
                                      CupertinoIcons.minus,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _controller.age--;
                                      });
                                    },
                                  ),
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  width:
                                      MediaQuery.of(context).size.width * 0.13,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.blue[800],
                                    border: Border.all(
                                      color: const Color.fromARGB(
                                          255, 102, 101, 101),
                                      width: 1,
                                    ),
                                  ),
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      overlayColor: MaterialStateProperty
                                          .resolveWith<Color?>(
                                        (Set<MaterialState> states) {
                                          if (states
                                              .contains(MaterialState.pressed))
                                            return Colors
                                                .orangeAccent; //<-- SEE HERE
                                          return null; // Defer to the widget's default.
                                        },
                                      ),
                                      elevation: MaterialStateProperty.all(0),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.blue[800]),
                                      // MaterialStateProperty<Color?>?
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                      ),
                                    ),
                                    child: const Icon(
                                      CupertinoIcons.add,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _controller.age++;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ]),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          child: BottomAppBar(
            clipBehavior: Clip.antiAlias,
            color: Colors.blue[800],
            elevation: 0,
            shape: const CircularNotchedRectangle(),
            notchMargin: 10,
            child: SizedBox(
              height: 75,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      MaterialButton(
                        minWidth: 40,
                        onPressed: () {
                          setState(() {
                            // currentScreen =
                            //     MapLocation(); // if user taps on this dashboard tab will be active
                            currentTab = 0;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                CupertinoIcons.tuningfork,
                                size: 30,
                                color: Colors.white,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 5),
                                child: Text(
                                  'Activity',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Right Tab bar icons
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      MaterialButton(
                        minWidth: 40,
                        onPressed: () {
                          setState(() {
                            // currentScreen =
                            //     const Items(); // if user taps on this dashboard tab will be active
                            currentTab = 2;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.person_outline_sharp,
                                size: 30,
                                color: Colors.white,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 5),
                                child: Text(
                                  'Profile',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 5, 5, 50),
          child: const Text(
            'BMI',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          onPressed: () {
            var weights = int.parse(weight.text);
            var heights = _controller.values;
            _controller.bmis = (weights / (heights * heights)) * 703;

            if (_controller.bmis < 18.5) {
              _controller.bmi = 'Underweight';
              _controller.descrition =
                  'A BMI of 18.5 is considered underweight.By maintaining a healthy weight, you can reduce your risk of developing serious health problems.';
            } else if (_controller.bmis < 25) {
              _controller.bmi = 'Normal';
              _controller.descrition =
                  'A BMI of 18.5 - 24.9 is considered Normal.By maintaining a healthy weight, you can reduce your risk of developing serious health problems.';
            } else if (_controller.bmis < 30) {
              _controller.bmi = 'Overweight';
              _controller.descrition =
                  'A BMI of 25.1 - 29.9  is considered overweight.By maintaining a healthy weight, you can reduce your risk of developing serious health problems.';
            } else {
              _controller.bmi = 'Obese';
              _controller.descrition =
                  'A BMI of more than 30 is considered obese.By maintaining a healthy weight, you can reduce your risk of developing serious health problems.';
            }

            _showBottomSheet(context);
          },
        ),
      ),
    );
  }

  _showBottomSheet(
    BuildContext context,
  ) {
    Get.bottomSheet(
      Container(
        decoration: BoxDecoration(
            color: Colors.blue[800],
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(30))),
        height: MediaQuery.of(context).size.height * 0.3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Your BMI is:',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "${_controller.bmis.toStringAsFixed(1)} kg/m2",
              style: const TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "(${_controller.bmi})",
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "${_controller.descrition}",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
