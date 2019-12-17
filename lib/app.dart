import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterbooks/widgets/structural_widgets/scaffold_example.dart';

import 'widgets/preferred_size_widget/preferred_title_bar.dart';

class FlutterBooksApp extends StatefulWidget {
  @override
  State createState() {
    return _FlutterBooksAppState();
  }
}

class _FlutterBooksAppState extends State<FlutterBooksApp> with WidgetsBindingObserver {

  Timer _timerLink;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    if (_timerLink != null) {
      _timerLink.cancel();
    }
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print("didChangeAppLifecycleState :: " + state.toString());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FLUTTER BOOKS',
      theme: ThemeData(
        primaryColor: const Color(0xFFF2BF3F),
        primaryColorLight: const Color(0xFFF7E0AA),
      ),
      home: HomePage(),
      routes: <String, WidgetBuilder> {
        '/PreferredSizeWidget': (BuildContext context) => PreferredTitleBar(),
        '/ScaffoldExample': (BuildContext context) => ScaffoldExample(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  final String title = 'Flutter Widget';
  @override
  State createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

  static const List<String> _products = const [
    '/PreferredSizeWidget',
    '/ScaffoldExample'
  ];

  Widget _buildProductItem(BuildContext context, int index) {
    return Container(
      child: FlatButton(
        onPressed: () {
          print("_buildProductItem >> _products > index.toString() :: " + index.toString() + " , _products[index] : " + _products[index]);
          Navigator.of(context).pushNamed(_products[index]);
        },
        child: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: EdgeInsets.only(top: 22, bottom: 22, right: 22),
            child: Row(children: [
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: _products[index],
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                        fontStyle: FontStyle.normal,
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: "FLUTTER WIDGET",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.grey,
                    fontStyle: FontStyle.normal,
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Container(
          child: ListView.builder(
            itemBuilder: _buildProductItem,
            itemCount: _products.length,
          ),
        ),
      ),
    );
  }

}