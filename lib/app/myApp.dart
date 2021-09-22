import 'package:app_lunch/app/view/burguer_form.dart';
import 'package:app_lunch/app/view/menu_burguer.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  
  static const HOME = '/';
  static const BURGUER_FORM = 'burguer-form';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red
      ),
      routes: {
        HOME: (context) => MenuBurguer(),
        BURGUER_FORM:(context) => BurguerForm()
      },
    );
  }
}