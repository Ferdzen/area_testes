import 'package:app_lunch/injection.dart';
import 'package:flutter/material.dart';

import 'app/MyApp.dart';

void main() {
  setupInjection();
  runApp(MyApp());
}