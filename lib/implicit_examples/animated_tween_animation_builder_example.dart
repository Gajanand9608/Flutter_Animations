import 'package:flutter/material.dart';

class PulsatingCircleAnimation extends StatelessWidget {
  const PulsatingCircleAnimation({super.key});

  final double size = 200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pulsating Circle Animation'),
      ),
      body: Center(
        child: TweenAnimationBuilder(
          tween: Tween(begin: 0.0, end: 200.0),
          duration: const Duration(milliseconds: 1500),
          builder: (context, size, widget) {
            return Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.5),
                    blurRadius: size,
                    spreadRadius: size / 2,
                  ),
                ],
              ),
              // child:
              // widget, // this child will build the widget created under the builder's child which has no dependency on animation
              // so it won't be built for changinf value of Tween
            );
          },
          // child: const Text("dsfdsf"),
        ),
      ),
    );
  }
}
