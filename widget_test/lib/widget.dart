import 'package:flutter/material.dart';

void main() {
  //runApp(const MyWidget(title: 'Hello World', message: 'Welcome to Flutter!'));
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key, required this.title, required this.message});
  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text(title)),
        body: Center(child: Text(message)),
      ),
    );
  }
}
