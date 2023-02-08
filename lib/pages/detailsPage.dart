import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex/constants/constants.dart';
import 'package:pokedex/models/pokeModels.dart';
import 'package:pokedex/widgets/pokedex_detailslist.dart';
import 'package:pokedex/widgets/pokedex_detailstiype.dart';

class detailsPage extends StatelessWidget {
  final PokeModel pokemon;
  const detailsPage({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Constants.getBgColor(pokemon.type!.first.toString()),
        body: Container(
          color: Constants.getBgColor(pokemon.type!.first.toString()),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.arrow_back)),
              detailsType(pokemon: pokemon),
              Expanded(
                flex: 1,
                child: Stack(
                  children: [
                    Positioned(
                        top: 0.12.sh,
                        bottom: 0,
                        right: 0,
                        left: 0,
                        child: detailsList(pokemon: pokemon)),
                    Align(
                      alignment: Alignment.topCenter,
                      child: CachedNetworkImage(
                        imageUrl: pokemon.img.toString(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
