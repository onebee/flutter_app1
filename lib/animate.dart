import 'package:flutter/material.dart';

class SecondRoute5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('SecondRoute5'),
      ),
      body: Container(
        color: Colors.red,
        child: Center(
          child: RaisedButton(
            child: Text('Go back'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}
