import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TileCard extends ConsumerWidget {
  const TileCard({
    super.key,
    required this.onPressed,
    required this.title,
    required this.imagePath,
    this.backgroundColorEnabled = false
  });

  final String title;
  final String imagePath;
  final bool backgroundColorEnabled;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final containerHeight = MediaQuery.sizeOf(context).height / 8;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: InkWell(
          onTap: onPressed,
          child: Card(
            color: Colors.white,
            child: Stack(
              children: [
                const Center(child: SizedBox()),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Opacity(
                    opacity: 0.5,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(13.0),
                      child: Image.asset(
                        imagePath,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                ),
                if(backgroundColorEnabled)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(13.0),
                    child: Container(
                      height: containerHeight,
                      width: double.infinity,
                      color: Colors.white70,
                    ),
                  ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(13.0),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 25.0,
                      sigmaY: 25.0,
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      height: containerHeight,
                      child: Text(
                        title,
                        style: TextStyle(
                          fontFamily: 'Rubik',
                          color: Color(0xFF623B1D),
                          fontWeight: FontWeight.w500,
                          fontSize: containerHeight / 5,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
