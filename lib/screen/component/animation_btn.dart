
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class AnimationBtn extends StatelessWidget {
  const AnimationBtn({
    super.key,
    required RiveAnimationController btnAnimationController,
    required this.press,
  }) : _btnAnimationController = btnAnimationController;

  final RiveAnimationController _btnAnimationController;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        height: 64,
        width: 260,
        child: Stack(children: [
          RiveAnimation.asset(
            'assets/riveassets/button.riv',
            controllers: [_btnAnimationController],
          ),
          Positioned.fill(
              top: 8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(CupertinoIcons.arrow_right),
                  Text(
                    'Start the course',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ))
        ]),
      ),
    );
  }
}
