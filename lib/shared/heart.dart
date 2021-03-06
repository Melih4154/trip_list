import 'package:flutter/material.dart';

class Heart extends StatefulWidget {
  @override
  _HeartState createState() => _HeartState();
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin {
  bool isFav = false;

  AnimationController _controller;
  Animation<Color> _heartAnimation;
  Animation<double> _sizeAnimation;
  Animation _curve;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 750));

    _curve = CurvedAnimation(parent: _controller, curve: Curves.slowMiddle);

    _heartAnimation =
        ColorTween(begin: Colors.grey[400], end: Colors.red).animate(_curve);

    _sizeAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(tween: Tween(begin: 30, end: 50), weight: 50),
      TweenSequenceItem<double>(tween: Tween(begin: 50, end: 30), weight: 50),
    ]).animate(_curve);

    _controller.addStatusListener((status) {
      if (_controller.isCompleted) {
        setState(() {
          isFav = true;
        });
      } else if (_controller.isDismissed) {
        setState(() {
          isFav = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return IconButton(
          icon: Icon(
            Icons.favorite,
            size: _sizeAnimation.value,
            color: _heartAnimation.value,
          ),
          onPressed: () {
            isFav ? _controller.reverse() : _controller.forward();
          },
        );
      },
    );
  }
}
