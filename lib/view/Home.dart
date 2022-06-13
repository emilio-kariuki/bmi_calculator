import 'dart:io';

import 'package:bmi_calculator/controller/bmiController.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _controller = BmiController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text("BMI Calculator",
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.w500)),
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      border: Border.all(
                        color: _controller.selectedColor,
                        width: 1,
                      ),
                    ),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        // MaterialStateProperty<Color?>?
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 30),
                          Image.asset(
                            _controller.gender[0].image!,
                            height: MediaQuery.of(context).size.height * 0.055,
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
                      onPressed: () => exit(0),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      border: Border.all(
                        color: _controller.selectedColor,
                        width: 1,
                      ),
                    ),
                    child: ElevatedButton(
                      onHover: (value) {
                        if (value) {
                          _controller.selectedColor = Colors.amber;
                        } else {
                          _controller.selectedColor = Colors.grey;
                        }
                      },
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        // MaterialStateProperty<Color?>?
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 30),
                          Image.asset(
                            _controller.gender[1].image!,
                            height: MediaQuery.of(context).size.height * 0.055,
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
                      onPressed: () => exit(0),
                    ),
                  ),
                ],
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Height(in cm)',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.w500)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: SfSlider(
                          showTicks: true,
                          shouldAlwaysShowTooltip: true,
                          showLabels: true,
                          enableTooltip: true,
                          minorTicksPerInterval: 1,
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
            ]),
      ),
    );
  }
}
