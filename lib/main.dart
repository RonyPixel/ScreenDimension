import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Screen Size',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Screen Dimensions'),
        ),
        body: Center(
          child: Dimension(),
        ),
      ),
    );
  }
}

class Dimension extends StatefulWidget {
  GetDimension createState() => GetDimension();
}

class GetDimension extends State {
  double heightHolder = 00.00;
  double widthHolder = 00.00;

  getHeightWidth(context) {
    var padding = MediaQuery.of(context).padding;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double respHeight = height - padding.top - padding.bottom;

    setState(() {
      heightHolder = respHeight.roundToDouble();
      widthHolder = width.roundToDouble();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
          Container(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
              child: Text('Your Device Height = ' + '$heightHolder',
                  style: TextStyle(fontSize: 21))),
          Container(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Text('Your Device Width = ' + '$widthHolder',
                  style: TextStyle(fontSize: 21))),
          RaisedButton(
              onPressed: () => getHeightWidth(context),
              child: Text('Click To Get Device Height Width'),
              textColor: Colors.white,
              color: Colors.black,
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0),
              )),
        ])));
  }
}
