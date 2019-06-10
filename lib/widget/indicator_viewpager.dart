import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math';

class DotsIndicator extends AnimatedWidget {
  DotsIndicator(
      {this.controller, this.itemCount, this.color, this.onPageSelected})
      : super(listenable: controller);

  final PageController controller;
  final int itemCount;
  final ValueChanged<int> onPageSelected;
  final Color color;
  static const double _kDotSize = 5.0;
  static const double _kMaxZoom = 2.0;
  static const double _kDotSpacing = 2.0;

  Widget _buildDot(int index) {
    if (controller == null) {
      return Container(
        width: 0,
        height: 0,
      );
    }
    double zoom;
    try {
      double selectedness = Curves.easeOut.transform(max(
          0.0,
          1.0 -
              ((controller.page % itemCount ?? controller.initialPage) - index)
                  .abs()));
      zoom = 1.0 + (_kMaxZoom - 1) * selectedness;
    } catch (except) {
      if (index == 0)
        zoom = 2;
      else
        zoom = 1;
    }

    return Container(
      margin: EdgeInsets.only(left: _kDotSpacing),
      child: Material(
        color: color,
        type: MaterialType.circle,
        child: Container(
          width: _kDotSize * zoom,
          height: _kDotSize * zoom,
          child: InkWell(
            onTap: () {
              onPageSelected(index);
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(itemCount, _buildDot),
    );
  }
}

class IndicatorViewPager extends StatefulWidget {
  final List<Widget> pages;

  IndicatorViewPager(this.pages);

  @override
  _IndicatorViewPagerState createState() => _IndicatorViewPagerState();
}

class _IndicatorViewPagerState extends State<IndicatorViewPager> {
  final _controller = PageController();
  static const _kDuration = Duration(milliseconds: 500);
  static const _kCurve = Curves.ease;
  final _kArrowColor = Colors.grey;
  final _kPeriod = Duration(seconds: 3);
  Timer _timer;

  @override
  void initState() {
    super.initState();
//    _timer = Timer.periodic(_kPeriod, (timer){
//      _controller.nextPage(duration: _kDuration, curve: _kCurve);
//    });
  }

  @override
  void dispose() {
    if (_timer != null) _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('buildDot:itemcount${widget.pages.length}');
    return Scaffold(
      body: IconTheme(
          data: IconThemeData(
            color: _kArrowColor,
          ),
          child: Stack(
            children: <Widget>[
              PageView.builder(
                physics: AlwaysScrollableScrollPhysics(), //无线循环
                controller: _controller,
                itemBuilder: (context, index) {
                  return widget.pages[index % widget.pages.length];
                },
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  padding: EdgeInsets.all(15),
                  child: DotsIndicator(
                    controller: _controller,
                    color: _kArrowColor,
                    itemCount: widget.pages.length,
                    onPageSelected: (page) {
                      _controller.animateToPage(page,
                          duration: _kDuration, curve: _kCurve);
                    },
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
