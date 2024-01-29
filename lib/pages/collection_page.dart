import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shard/consts.dart';

class CollectionPage extends ConsumerWidget {
  const CollectionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColorApp,
        appBar: AppBar(
          title: Text("Planszoteka"),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          actions: [
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {},
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const SearchFilter(),
              ListView(
                shrinkWrap: true,
                children: [
                  const AddNewGameCard(),
                  GameCard(title: "Wsiąść do pociągu"),
                  GameCard(title: "Sagrada"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchFilter extends ConsumerWidget {
  const SearchFilter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                suffixIcon: Icon(Icons.search),
                hintText: "Szukaj",
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.filter_list),
          )
        ],
      ),
    );
  }
}

class AddNewGameCard extends ConsumerWidget {
  const AddNewGameCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cardHeight = MediaQuery.sizeOf(context).height / 7;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: InkWell(
        child: Card(
          elevation: 0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(13.0),
            child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          'assets/images/shelf.jpg',
                        ),
                        fit: BoxFit.cover,
                        opacity: 0.5)),
                height: cardHeight,
                child: Center(
                    child: Icon(
                  Icons.add_circle_outline,
                  size: cardHeight * 2 / 3,
                  color: Colors.white,
                ))),
          ),
        ),
      ),
    );
  }
}

class GameCard extends ConsumerWidget {
  const GameCard({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cardHeight = MediaQuery.sizeOf(context).height / 7;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: InkWell(
        child: Card(
          elevation: 0,
          child: SizedBox(
            height: cardHeight,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                    const Color(0xFF87E6FA),
                                    Colors.white
                                  ])),
                              width: double.infinity,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                child: Text(
                                  title,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: cardHeight / 6),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Status:",
                        style: TextStyle(fontSize: cardHeight / 7),
                      ),
                      Text(
                        "Dostępne",
                        style: TextStyle(
                            fontSize: cardHeight / 7,
                            color: Colors.green,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
