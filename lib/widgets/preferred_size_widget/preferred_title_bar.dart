import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PreferredTitleBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  State<StatefulWidget> createState() => _PreferredTitleBar();
  @override
  Size get preferredSize {
    return Size.fromHeight(50.0);
  }


}


class _PreferredTitleBar extends State<PreferredTitleBar> {

  String _leftTitle = "left title";
  String _rightTitle = "right title";

  PreferredSizeWidget PlatformWidget(BuildContext context) {
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      return CupertinoNavigationBar();
    }
    return AppBar();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(10.0),
                child: Text(_leftTitle,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0
                  ),
                ),
              )
            ],
          ),
          Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(10.0),
                child: Text(_rightTitle,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}