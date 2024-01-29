import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shard/consts.dart';
import 'package:shard/widgets/select_action_card.dart';
import 'package:shard/widgets/select_games_buttons.dart';

class SharePage extends ConsumerWidget {
  const SharePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            children: const [
              SelectGames(),
              SelectPerson(),
              SaveButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class SelectPerson extends ConsumerWidget {
  const SelectPerson({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).height;
    final subtitleHeight = screenHeight / 35;
    final dropdownHeight = screenHeight / 16;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Kto pożycza?",
          style: TextStyle(fontSize: subtitleHeight),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: SizedBox(
            height: dropdownHeight,
            child: Row(
              children: [
                Expanded(
                  child: ClipPath(
                    clipper: MyClipper(
                        isRight: true,
                        roundFactorLeft: 0.97,
                        customRounded: screenWidth / 100),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        color: Colors.white,
                        height: dropdownHeight,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: DropdownButton(
                            items: [
                              DropdownMenuItem(
                                child: Text("Jeden"),
                                value: "jeden",
                              ),
                              DropdownMenuItem(
                                child: Text("Dwa"),
                                value: "dwa",
                              ),
                            ],
                            value: "jeden",
                            onChanged: (item) {},
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                ClipPath(
                  clipper: MyClipper(
                      isRight: false,
                      roundFactorRight: 0.25,
                      customRounded: screenWidth / 100),
                  child: Container(
                      height: double.infinity,
                      width: screenHeight / 20,
                      color: Colors.white,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(0),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaX: 10.0,
                              sigmaY: 10.0,
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: screenHeight / 100,
                              ),
                              child: const Icon(
                                Icons.add,
                                color: backgroundColorApp,
                              ),
                            ),
                          ))),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class SaveButton extends ConsumerWidget {
  const SaveButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.sizeOf(context).height;
    final buttonPadding = screenWidth / 10;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: buttonPadding,
        vertical: 20.0,
      ),
      child: ElevatedButton.icon(
          onPressed: () {},
          icon: Icon(
            Icons.save,
            color: backgroundColorApp,
            // color: Colors.black38,
          ),
          label: Text(
            "Zapisz",
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Rubik',
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          )),
    );
  }
}
