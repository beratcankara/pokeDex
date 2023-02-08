import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex/constants/constants.dart';
import 'package:pokedex/models/pokeModels.dart';
import 'package:pokedex/pages/detailsPage.dart';

class pokeDexCards extends StatelessWidget {
  final PokeModel pokemon;

  const pokeDexCards({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.w),
        ),
        elevation: 3.w,
        shadowColor: Colors.white70,
        color: Constants.getBgColor(pokemon.type!.first.toString()),
        child: InkWell(
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => detailsPage(pokemon: pokemon))),
          child: Padding(
            padding: EdgeInsets.all(2.0.w),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(pokemon.name.toString(),
                      style:
                          Constants.getNameTextStyle(pokemon.name.toString())),
                ),
                Chip(label: Text(pokemon.type![0])),
                Expanded(
                  child: CachedNetworkImage(
                    imageUrl: pokemon.img.toString(),
                    placeholder: (context, url) => CircularProgressIndicator(),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
