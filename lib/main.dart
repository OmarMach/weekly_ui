import 'package:flutter/material.dart';
import 'package:weekly_ui/activation_code-ui.dart';

void main() => runApp(
      const MyApp(),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: ActivationCodeUI(),
    );
  }
}
