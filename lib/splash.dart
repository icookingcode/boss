import 'dart:async';
import 'package:flutter/material.dart';
import 'boss_app.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  BuildContext context;
  final timeout = const Duration(seconds: 3);
  final ms = const Duration(milliseconds: 1);
  Timer _timer;

  startTimeout(int microseconds) {
    var duration = microseconds == null ? timeout : ms * microseconds;
    _timer = Timer(duration, handleTimeout);
    return _timer;
  }

  void handleTimeout() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => BossApp()),
            (route) => route == null);
  }

  @override
  void dispose() {
    super.dispose();
    if(_timer !=null)
    _timer.cancel();
  }
  @override
  Widget build(BuildContext context) {
    this.context = context;
    startTimeout(1500);
    return Material(
      color: Theme.of(context).primaryColor,
      child: Padding(
        padding: EdgeInsets.only(top: 150),
        child: Column(
          children: <Widget>[
            Text(
              'BOSS直聘',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
