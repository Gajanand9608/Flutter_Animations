// import 'dart:ffi';

import 'package:flutter/material.dart';

class BouncingBallAnimation extends StatefulWidget {
  const BouncingBallAnimation({super.key});

  @override
  State<BouncingBallAnimation> createState() => _BouncingBallAnimationState();
}

class _BouncingBallAnimationState extends State<BouncingBallAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> yDirectionAnimation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    yDirectionAnimation = Tween<double>(begin: 0, end: 1).animate(controller);
    yDirectionAnimation.addListener(() {
      if (yDirectionAnimation.isCompleted) {
        controller.reverse();
      } else if (yDirectionAnimation.isDismissed) {
        controller.forward();
      }
    });
    controller.forward(); // to trigger animation for first time
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Need Ball
            AnimatedBuilder(
              animation: yDirectionAnimation,
              builder: (context, child) => CustomPaint(
                size: const Size(200, 300), // if we comment this line, the ball will be at left bottm corner, 200 & 300 are distnce from left and bottom
                painter: MyBouncingBall(yDirectionAnimation.value),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyBouncingBall extends CustomPainter {
  final double animationValue;

  MyBouncingBall(this.animationValue);
  @override
  void paint(Canvas canvas, Size size) {
    // var paint = Paint();
    //   paint.color = Colors.blue;
    canvas.drawCircle(
      Offset(size.width / 2, size.height - (size.height * animationValue)),
      20,
      Paint()..color = Colors.blue,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
