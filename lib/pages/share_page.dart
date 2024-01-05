import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shard/consts.dart';
import 'package:shard/widgets/select_action_card.dart';

class SharePage extends ConsumerWidget {
  const SharePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).height;
    final buttonPadding = screenWidth / 10;
    final subtitleHeight = screenHeight / 35;
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColorApp,
        appBar: AppBar(
          title: Text("Wypożycz"),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            shrinkWrap: true,
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
              Text(
                "Kto pożycza?",
                style: TextStyle(fontSize: subtitleHeight),
              ),
              Row(
                children: [
                  //TODO dropdownButton
                  Text("Dodaj")
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: buttonPadding),
                child: OutlinedButton(
                    onPressed: () {},
                    child: Text("Zapisz"),
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

