import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/genderModel.dart';

class BmiController extends GetxController {
  var selectedColor = Colors.grey.obs();
  List<GenderModel> gender = [
    GenderModel("Male", "assets/male.png"),
    GenderModel("Female", "assets/female.png")
  ];
}
