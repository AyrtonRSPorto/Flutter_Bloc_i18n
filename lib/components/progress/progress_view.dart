import 'package:bytebank/components/progress/progress.dart';
import 'package:flutter/material.dart';

class ProgressView extends StatelessWidget {
  String message;

  ProgressView({String message = "Sending..."}){
    this.message = message;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Processing'),
      ),
      body: Progress(
        message: message,
      ),
    );
  }
}