import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'view/Home.dart';

void main() {
  runApp(const GetMaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}
