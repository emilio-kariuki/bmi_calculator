import 'package:bmi_calculator/controller/bmiController.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _controller = BmiController();
  @override
  Widget build(BuildContext context) {
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
                  GestureDetector(
                    onTap: () {
                      _controller.selectedColor = Colors.purple;
                    },
                    child: Container(
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
                      child: Column(
                        children: [
                          const SizedBox(height: 30),
                          Image.asset(
                            _controller.gender[0].image!,
                            height: MediaQuery.of(context).size.height * 0.06,
                            color: Colors.orange,
                          ),
                          const SizedBox(height: 15),
                          Text(
                            _controller.gender[0].gender!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _controller.selectedColor = Colors.purple;
                    },
                    child: Container(
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
                      child: Column(
                        children: [
                          const SizedBox(height: 30),
                          Image.asset(
                            _controller.gender[1].image!,
                            height: MediaQuery.of(context).size.height * 0.07,
                            color: Colors.pink,
                          ),
                          const SizedBox(height: 15),
                          Text(
                            _controller.gender[1].gender!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ]),
      ),
    );
  }
}
