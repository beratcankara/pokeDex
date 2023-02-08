import 'package:flutter/material.dart';
import 'package:pokedex/widgets/pokedex_cards.dart';
import '../models/pokeModels.dart';
import '../services/pokedexapi.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class pokedexListBuilder extends StatefulWidget {
  const pokedexListBuilder({super.key});

  @override
  State<pokedexListBuilder> createState() => _pokedexListBuilderState();
}

class _pokedexListBuilderState extends State<pokedexListBuilder> {
  late final Future<List<PokeModel>> _pokeList;
  @override
  void initState() {
    _pokeList = PokeApi.getPokeData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PokeModel>>(
      future: _pokeList,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          List<PokeModel> pokeListesi = snapshot.data;
          return Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    ScreenUtil().orientation == Orientation.portrait ? 2 : 3,
              ),
              itemCount: pokeListesi.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                var oAnkiPoke = pokeListesi[index];
                return pokeDexCards(pokemon: oAnkiPoke);
              },
            ),
          );
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
