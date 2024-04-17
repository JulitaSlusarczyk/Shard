import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shard/widgets/select_action_card.dart';

class SelectGames extends ConsumerWidget {
  const SelectGames({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final subtitleHeight = screenHeight / 35;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Wybierz grę",
          style: TextStyle(fontSize: subtitleHeight),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Row(children: [
            SelectActionCard(
                isRight: true,
                title: "Lista",
                onPressed: () {},
                imagePath: 'assets/images/select.png'),
            SelectActionCard(
                isRight: false,
                title: "Skanuj",
                onPressed: () {},
                imagePath: 'assets/images/scanner.png')
          ]),
        ),
      ],
    );
  }
}