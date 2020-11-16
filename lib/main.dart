import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: '中年男性のおなか'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isSlimMan = true;
  int _count = 0;

  void changeBody() {
    setState(() {
      _isSlimMan = !_isSlimMan;
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('中年男性の状態変化回数：$_count'),
              Icon(Icons.save),
              _isSlimMan
                  ? Image.asset('assets/fat.PNG')
                  : Image.asset('assets/slim.PNG'),
              ElevatedButton(
                onPressed: changeBody,
                child: _isSlimMan ? Text('ダイエットする') : Text('リバウンドする'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
