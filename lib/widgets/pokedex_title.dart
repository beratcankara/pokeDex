import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex/constants/constants.dart';

class pokedexTitle extends StatefulWidget {
  const pokedexTitle({super.key});

  @override
  State<pokedexTitle> createState() => _pokedexTitleState();
}

class _pokedexTitleState extends State<pokedexTitle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height:
          ScreenUtil().orientation == Orientation.portrait ? 0.15.sh : 0.15.sw,
      child: Stack(
        children: [
          Positioned(
              left: ScreenUtil().orientation == Orientation.portrait
                  ? 0.03.sh
                  : 0.08.sw,
              bottom: ScreenUtil().orientation == Orientation.portrait
                  ? 0.05.sh
                  : 0.05.sw,
              child: pokeDexYazdir()),
          Padding(
            padding: EdgeInsets.only(
                right: ScreenUtil().orientation == Orientation.portrait
                    ? 12.w
                    : 35.w),
            child:
                Align(alignment: Alignment.centerRight, child: pokeResmiKoy()),
          )
        ],
      ),
    );
  }
}

class pokeDexYazdir extends StatelessWidget {
  const pokeDexYazdir({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "PokeDex",
      style: Constants.getTitleTextStyle(),
    );
  }
}

class pokeResmiKoy extends StatelessWidget {
  pokeResmiKoy({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      Constants.imgUrl,
    );
  }
}
