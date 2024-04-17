import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shard/consts.dart';
import 'package:shard/pages/collection_page.dart';
import 'package:shard/pages/return_page.dart';
import 'package:shard/pages/share_page.dart';
import 'package:shard/widgets/tile_card.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: backgroundColorApp,
          body: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    TileCard(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SharePage(),
                          ),
                        ),
                      title: 'Wypożycz',
                      imagePath: 'assets/images/share.png',
                    ),
                    TileCard(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ReturnPage(),
                        ),
                      ),
                      title: 'Oddaj',
                      imagePath: 'assets/images/return.png',
                    ),
                  ],
                ),
              ),
              TileCard(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CollectionPage(),
                    ),
                  ),
                title: 'Moja Planszoteka',
                imagePath: 'assets/images/shelf.jpg',
                backgroundColorEnabled: true,
              )
            ],
          )),
    );
  }
}
