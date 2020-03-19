import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'animate.dart';

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
          onPressed: ()  {
//            var result = await Navigator.push(
//                context,
//                MaterialPageRoute(
//                    builder: (context) =>
//                        SecondRoute2 ('arg from first route ')));
//
//            print(result);
//            var result = await Navigator.pushNamed(context, '/second_route4',
//                arguments: 'Arg from first Route');
//
//            print(result);

            Navigator.push(
                context,
                PageRouteBuilder(
                    transitionDuration: Duration(milliseconds: 800),
                    pageBuilder: (BuildContext context,
                        Animation<double> animation,
                        Animation<double> secondaryAnimation) {
                      return FadeTransition(
                        opacity: animation,
                        child: SecondRoute5(),
                      );
                    }));
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
                Navigator.pop(context, "result form sencond route");
              },
            )
          ],
        ),
      ),
    );
  }
}

class SecondRoute3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 获取参数
    var arguments2 = ModalRoute
        .of(context)
        .settings
        .arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('second Route3'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(arguments2),
            RaisedButton(
              child: Text('Go back'),
              onPressed: () {
                Navigator.pop(context, 'Result form second route3');
              },
            )
          ],
        ),
      ),
    );
  }
}

class SecondRoute4 extends StatelessWidget {

  String arg;


  SecondRoute4(this.arg);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(appBar: AppBar(title: Text('Second Route4'),),
      body: Center(
        child: Column(

          children: <Widget>[
            Text(arg),
            RaisedButton(

              child: Text('Go Back'),
              onPressed: () {
                Navigator.pop(context, 'Result form second route4');
              },
            )
          ],
        ),

      ),);
  }
}
