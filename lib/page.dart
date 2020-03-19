import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "firstRoute",
        ),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Open Route"),
          onPressed: () async {
            var result = Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        SecondRoute2('arg from first route ')));

            print(result);

          },


        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('go back'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

class SecondRoute2 extends StatelessWidget {
  // 接收参数
  final String arg;

  SecondRoute2(this.arg);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SecondRoute2"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(arg),
            RaisedButton(
              child: Text('go back'),
              onPressed: () {

                Navigator.pop(context,"result form sencond route");
              },
            )
          ],
        ),
      ),
    );
  }
}
