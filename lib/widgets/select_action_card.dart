import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectActionCard extends ConsumerWidget {
  const SelectActionCard({
    super.key,
    required this.isRight,
    required this.onPressed,
    required this.imagePath,
    required this.title,
  });

  final bool isRight;
  final VoidCallback onPressed;
  final String imagePath;
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;
    final cardHeight = screenHeight / 10;
    final filterHeight = cardHeight / 3;
    return Expanded(
      child: ClipPath(
        clipper: MyClipper(isRight: isRight),
        child: InkWell(
          onTap: onPressed,
          child: Card(
            margin: EdgeInsets.zero,
            elevation: 0,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: cardHeight,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          imagePath,
                        ),
                        alignment: isRight
                            ? Alignment.centerLeft
                            : Alignment.centerRight,
                        fit: BoxFit.fitHeight,
                        opacity: 0.5),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(0),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 10.0,
                      sigmaY: 10.0,
                    ),
                    child: SizedBox(
                      height: filterHeight,
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.only(
                            right: screenWidth / 30,
                            left: isRight ? 0 : screenWidth / 12),
                        child: Text(
                          title,
                          textAlign:
                              !isRight ? TextAlign.left : TextAlign.right,
                          style: TextStyle(
                            fontSize: filterHeight * 3 / 5,
                            fontFamily: 'Rubik',
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  MyClipper({
    required this.isRight,
    this.roundFactorLeft = 7 / 8,
    this.roundFactorRight = 1 / 8,
    this.customRounded
  });

  bool isRight;
  double roundFactorLeft;
  double roundFactorRight;
  double? customRounded;

  @override
  Path getClip(Size size) {
    final x = size.width;
    final y = size.height;

    final rounded = customRounded ?? x / 20;

    Path right = Path()
      ..moveTo(0, rounded)
      ..lineTo(0, y - rounded)
      ..quadraticBezierTo(0, y, rounded, y)
      ..lineTo(x - rounded, y)
      ..quadraticBezierTo(x, y, x - (rounded * 0.3), y - rounded)
      ..lineTo(x * roundFactorLeft, 10)
      ..quadraticBezierTo((x * roundFactorLeft) - (rounded * 0.3), 0,
          (x * roundFactorLeft) - rounded, 0)
      ..lineTo(rounded, 0)
      ..quadraticBezierTo(0, 0, 0, rounded)
      ..close();

    Path left = Path()
      ..moveTo(x, y - rounded)
      ..lineTo(x, rounded)
      ..quadraticBezierTo(x, 0, x - rounded, 0)
      ..lineTo(rounded * 1.3, 0)
      ..quadraticBezierTo(0, 0, rounded * 0.3, rounded)
      ..lineTo(x * roundFactorRight, y - rounded)
      ..quadraticBezierTo(x * roundFactorRight + (rounded * 0.3), y,
          x * roundFactorRight + rounded, y)
      ..lineTo(x - rounded, y)
      ..quadraticBezierTo(x, y, x, y - rounded)
      ..close();

    return isRight ? right : left;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
