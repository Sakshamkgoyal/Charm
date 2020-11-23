import 'package:flutter/material.dart';
import 'dart:math';
import 'package:charm/widget/clipper_widget.dart';

class WaveWidget extends StatefulWidget {

  final Size size;
  final double yoffset;
  final Color color;

  const WaveWidget({this.size, this.yoffset, this.color});

  @override
  _WaveWidgetState createState() => _WaveWidgetState();
}

class _WaveWidgetState extends State<WaveWidget> with TickerProviderStateMixin {

  AnimationController animationController;
  List<Offset> wavePoints = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    animationController = AnimationController( vsync: this, duration: Duration(milliseconds: 5000))
        ..addListener(() {
          wavePoints.clear();
      final double waveSpeed = animationController.value *1000;
      final double fullSphere = animationController.value*pi*2;
      final double normalizer = cos(fullSphere);
      final double waveWidth = pi/270;
      final double waveHeight = 20.0;

      for (int i = 0; i<= widget.size.width.toInt(); ++i){
        double calc = sin((waveSpeed-i)*waveWidth);
        wavePoints.add(
          Offset(i.toDouble(),
          calc*waveHeight*normalizer+widget.yoffset,

          )
        );
      }
    });
    animationController.repeat();

  }

  @override
  void dispose(){
    super.dispose();
    animationController.dispose();
  }


  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context,_){
        return ClipPath(
          clipper: ClipperWidget(
            waveList: wavePoints,
          ),
          child: Container(
            width: widget.size.width,
            height: widget.size.height,
            color: widget.color,
          ),
        );
      },
    );
  }
}
