import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:walkmate/styles/k_colors.dart';
import 'dart:math' as math;

class MyArc extends StatefulWidget {
  Color color;
  double diameter; 
  final  VoidCallback onPressed; 
   MyArc({super.key , this.diameter = 25 , required this.onPressed, required this.color} );

  @override
  State<MyArc> createState() => _MyArcState();
}

class _MyArcState extends State<MyArc> {


  @override
  Widget build(BuildContext context) {
    return InkWell( 
      onTap: widget.onPressed,
      child: Container(
        width: widget.diameter+4,
        height: widget.diameter+4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular((widget.diameter+4)/2), 
          
          border: Border.all(width: 3, color:widget.color)
        ),
        child: Stack(
          children: [
            Transform.rotate( 
              angle: -1.57,
              child: CustomPaint(
                painter: MyPainter(color: widget.color),
                size: Size(widget.diameter, widget.diameter),
              ),
            ),
            // CustomPaint(
            //     painter: MyPainter(color: Colors.yellow),
            //     size: Size(widget.diameter, widget.diameter),
            //   ),
            //    Positioned(
            //     bottom: 10,
            //      child: CustomPaint(
            //         painter: MyPainter(color: Colors.green),
            //         size: Size(widget.diameter, widget.diameter ),
            //       ),
            //    ),
            Transform.rotate(
              angle: 1.56,
              child: CustomPaint(
                  painter: MyPainter(color: Colors.transparent),
                  size: Size(widget.diameter, widget.diameter ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  Color color;
  MyPainter({ required this.color});
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color =color;
    canvas.drawArc(
        Rect.fromCenter(
            center: Offset(size.height / 2, size.width / 2),
            width: size.width,
            height: size.height),
        math.pi,
        math.pi,
        false,
        paint);
    // canvas.drawArc(
    //     Rect.fromCircle(
    //         center: Offset(size.height / 2, size.width / 2), radius: size.height),
    //     math.pi,
    //     math.pi,
    //     false,
    //     paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
    // throw UnimplementedError();
  }
}
