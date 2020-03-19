import 'dart:math';

import 'package:app/page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp2());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirstRoute(),
    );
  }
}

class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Flutter Sample',
      theme: ThemeData(
        primaryColor: Colors.brown,
      ),
      routes: {
        '/': (context) => FirstRoute(),
        '/second_route': (context) => SecondRoute(),
        '/second_route3': (context) => SecondRoute3(),
        '/second_route4':(context)=> SecondRoute4('Arg HELLO'),
      },
      onGenerateRoute: (settings){
        if(settings.name == '/second_route4') {
          var arg = settings.arguments;
          return MaterialPageRoute(builder: (context)=> SecondRoute4(arg),settings:settings);
        }
      },
      initialRoute: '/',
    );
  }
}

class SimpleGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("SimpleGridView"),
      ),
      body: GridView(
        children: <Widget>[
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.yellow,
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.yellow,
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.yellow,
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.yellow,
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.yellow,
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.yellow,
          ),
        ],
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, childAspectRatio: 1.0),
      ),
    );
  }
}

class SimpleListView4 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SimpleListView4State();
  }
}

class _SimpleListView4State extends State<SimpleListView4> {
  List<String> _words = <String>[''];

  void _loadWords() {
    Future.delayed(Duration(milliseconds: 3000)).then((e) {
      _words.insertAll(_words.length - 1,
          generateWordPairs().take(20).map((e) => e.asPascalCase).toList());
      setState(() {});
    });
  }

  @override
  void initState() {
    _loadWords();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple"),
      ),
      body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            if (index == _words.length - 1) {
              if (_words.length - 1 < 100) {
                _loadWords();
                return Container(
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(),
                );
              } else {
                return Container(
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.center,
                  child: Text("没有更多了"),
                );
              }

              return Container(
                padding: EdgeInsets.all(20),
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              );
            }
            return ListTile(
              title: Text(_words[index]),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              height: 0.0,
            );
          },
          itemCount: _words.length),
    );
  }
}

class SimpleListView2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SimpleListView2"),
      ),
      body: ListView.builder(
          itemCount: 25,
          itemBuilder: (BuildContext context, int index) {
            return index % 2 == 0
                ? Container(
                    height: 150,
                    color: Colors.green,
                  )
                : Container(
                    height: 190,
                    color: Colors.blue,
                  );
          }),
    );
  }
}

class SimpleListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SimpleListView"),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        itemExtent: 50,
        children: <Widget>[
          Container(
            height: 150,
            color: Colors.red,
          ),
          Container(
            height: 150,
            color: Colors.cyan,
          ),
          Container(
            height: 150,
            color: Colors.yellow,
          ),
          Container(
            height: 150,
            color: Colors.blue,
          ),
          Container(
            height: 150,
            color: Colors.black38,
          ),
          Container(
            height: 150,
            color: Colors.black26,
          ),
        ],
      ),
    );
  }
}

class SimpleRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SimpleRow"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
//            textDirection: TextDirection.rtl,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                "Hello",
                style: TextStyle(color: Colors.red, fontSize: 35),
              ),
              Text(
                " world",
                style: TextStyle(fontSize: 35),
              )
            ],
          ),
          Row(
//            textDirection: TextDirection.rtl,
            textDirection: TextDirection.ltr,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                "Hello",
                style: TextStyle(color: Colors.red, fontSize: 35),
              ),
              Text(
                " world",
                style: TextStyle(fontSize: 35),
              )
            ],
          ),
          Row(
            verticalDirection: VerticalDirection.up,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                "Hello",
                style: TextStyle(color: Colors.red, fontSize: 65),
              ),
              Text(
                " world",
                style: TextStyle(fontSize: 35),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class SimpleColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SimpleColum")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
//        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "HELLO",
            style: TextStyle(color: Colors.blue, fontSize: 55),
          ),
          Text(
            "Flutter",
            style: TextStyle(color: Colors.blue, fontSize: 25),
          )
        ],
      ),
    );
  }
}

class SimpleFlex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Simple"),
        ),
        body: Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Container(
                  color: Colors.red,
                  height: 50,
                )),
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.blue,
                height: 99,
              ),
            )
          ],
        ));
  }
}

class SimpleStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("SimpleStack"),
      ),
      body: Stack(
//        alignment: Alignment.topCenter,
        children: <Widget>[
          Container(
            color: Colors.blue,
          ),
          Positioned(
            left: 100,
            top: 100,
            child: Container(
              color: Colors.cyan,
              width: 100,
              height: 100,
            ),
          ),
          Container(
            width: 50,
            height: 50,
            color: Colors.yellow,
          )
        ],
      ),
    );
  }
}
