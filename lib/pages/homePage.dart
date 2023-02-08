import 'package:flutter/material.dart';
import 'package:pokedex/widgets/pokedex_listbuilder.dart';
import 'package:pokedex/widgets/pokedex_title.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          return Container(
            child: SafeArea(
              child: Column(
                children: [
                  pokedexTitle(),
                  pokedexListBuilder(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
