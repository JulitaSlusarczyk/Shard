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
                            left: isRight ? 0 : screenWidth / 12
                        ),
                        child: Text(
                          title,
                          textAlign: !isRight
                              ? TextAlign.left
                              : TextAlign.right,
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
  MyClipper({required this.isRight});

  bool isRight;

  @override
  Path getClip(Size size) {
    final x = size.width;
    final y = size.height;

    Path right = Path()
      ..moveTo(0, 10)
      ..lineTo(0, y - 10)
      ..quadraticBezierTo(0, y, 10, y)
      ..lineTo(x - 10, y)
      ..quadraticBezierTo(x, y, x - 3, y - 10)
      ..lineTo(x * 7 / 8, 10)
      ..quadraticBezierTo((x * 7 / 8) - 4, 0, (x * 7 / 8) - 10, 0)
      ..lineTo(10, 0)
      ..quadraticBezierTo(0, 0, 0, 10)
      ..close();

    Path left = Path()
      ..moveTo(x, y - 10)
      ..lineTo(x, 10)
      ..quadraticBezierTo(x, 0, x - 10, 0)
      ..lineTo(13, 0)
      ..quadraticBezierTo(0, 0, 3, 10)
      ..lineTo(x / 8, y - 10)
      ..quadraticBezierTo(x / 8 + 4, y, x / 8 + 10, y)
      ..lineTo(x - 10, y)
      ..quadraticBezierTo(x, y, x, y - 10)
      ..close();

    return isRight ? right : left;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
