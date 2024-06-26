import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:forlearning/screen/component/animation_btn.dart';
import 'package:rive/rive.dart';

class OnboardAnimation extends StatefulWidget {
  const OnboardAnimation({super.key});

  @override
  State<OnboardAnimation> createState() => _OnboardAnimationState();
}

class _OnboardAnimationState extends State<OnboardAnimation> {
  late RiveAnimationController _btnAnimationController;

  @override
  void initState() {
    _btnAnimationController = OneShotAnimation('Active', autoplay: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              width: MediaQuery.of(context).size.width * 1.7,
              left: 100,
              bottom: 100,
              child: Image.asset("assets/backgrounds/Spline.png")),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
              child: const SizedBox(),
            ),
          ),
          const RiveAnimation.asset('assets/riveassets/shapes.riv'),
          Positioned.fill(
              child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 30,
              sigmaY: 30,
            ),
            child: const SizedBox(),
          )),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                SizedBox(
                  width: 260,
                  child:  Column(
                     children: [
                      Text(
                        'Learn design & code',
                        style: TextStyle(
                            fontSize: 60, fontFamily: 'Poppins', height: 1.2),
                      ),
                      SizedBox(height: 16),
                      Text(
                        "Don’t skip design. Learn design and code, by building real apps with Flutter and Swift. Complete courses about the best tools.",
                      ),
                    ],
                  ),
                ),
                const Spacer(flex: 2,),
                AnimationBtn(
                    btnAnimationController: _btnAnimationController,
                    press: () {
                      _btnAnimationController.isActive = true;
                    }),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Text('Purchase includes access to 30+ courses, 240+ premium tutorials, 120+ hours of videos, source files and certificates.'),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}

