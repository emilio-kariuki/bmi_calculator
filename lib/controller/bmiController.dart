import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/genderModel.dart';

class BmiController extends GetxController {
  var selectedColor = Colors.grey.obs();
  var values = 0.0.obs();
  var age = 0.obs();
  var bmi = "normal".obs();
  var bmis = 0.0.obs();
  var descrition = "loading".obs();
  List<GenderModel> gender = [
    GenderModel("Male", "assets/male.png"),
    GenderModel("Female", "assets/female.png")
  ];
  List<SelectModel> select = [
    SelectModel("Weight(in kg)", "Age"),
  ];
}
