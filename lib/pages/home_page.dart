import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shard/pages/collection_page.dart';
import 'package:shard/widgets/tile_card.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color(0xFF87E6FA),
          body: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    TileCard(
                      onPressed: () {},
                      title: 'Wypożycz',
                      imagePath: 'assets/images/share.png',
                    ),
                    TileCard(
                      onPressed: () {},
                      title: 'Oddaj',
                      imagePath: 'assets/images/return.png',
                    ),
                  ],
                ),
              ),
              TileCard(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CollectionPage(),
                    ),
                  );
                },
                title: 'Moja Planszoteka',
                imagePath: 'assets/images/shelf.jpg',
                backgroundColorEnabled: true,
              )
            ],
          )),
    );
  }
}
