import 'package:flutter/material.dart';
import 'package:pokedex/constants/constants.dart';
import 'package:pokedex/models/pokeModels.dart';

class detailsList extends StatelessWidget {
  detailsList({super.key, required this.pokemon});
  PokeModel pokemon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        color: Colors.white,
      ),
      child: getInfoRow(),
    );
  }

  getInfoRow() {
    List<pokeInfoC> _infoMap = Constants.getInfo(pokemon);
    return Padding(
      padding: EdgeInsets.all(20),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, mainAxisExtent: 52),
        itemCount: _infoMap.length,
        itemBuilder: (BuildContext context, int index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  _infoMap[index].name,
                  style: Constants.getInfoTextStyle(),
                ),
              ),
              Expanded(
                child: Text(
                  _infoMap[index].info,
                  style: Constants.getLabelTextStyle(),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
