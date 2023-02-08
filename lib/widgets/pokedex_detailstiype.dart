import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex/models/pokeModels.dart';

import '../constants/constants.dart';

class detailsType extends StatelessWidget {
  final PokeModel pokemon;
  const detailsType({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    String PokeName = pokemon.name.toString();
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  PokeName,
                  style: Constants.getTitleTextStyle(),
                ),
              ),
              Text(
                "#" + pokemon.id.toString(),
                style: Constants.getNameTextStyle(pokemon.id.toString()),
              )
            ],
          ),
          SizedBox(height: 10),
          Chip(
            label: Text(
              pokemon.type!.join(", "),
              style: TextStyle(fontSize: 20.w),
            ),
          ),
        ],
      ),
    );
  }
}
