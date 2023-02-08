import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex/models/pokeModels.dart';

class pokeInfoC {
  String name;
  String info;

  pokeInfoC(this.name, this.info);

  @override
  String toString() {
    return '{ ${this.name}, ${this.info} }';
  }
}

class Constants {
  Constants._(); // obje üretilmeyen bir sınıf oldugunu belli eder. - Sabit değişkenler bu sınıfta tutulur.

  static String title = "PokeDex";
  static String imgUrl =
      "https://assets.stickpng.com/thumbs/580b57fcd9996e24bc43c31f.png";
  static String apiUrl =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";

  static TextStyle getTitleTextStyle() {
    return TextStyle(
        fontFamily: "PressStart2P", fontSize: _calculateFontSize(0.048));
  }

  static TextStyle getInfoTextStyle() {
    return TextStyle(
        fontSize: _calculateFontSize(0.03),
        color: Colors.black,
        fontWeight: FontWeight.bold);
  }

  static TextStyle getLabelTextStyle() {
    return TextStyle(
      fontSize: _calculateFontSize(0.03),
      color: Colors.black,
    );
  }

  static TextStyle getNameTextStyle(String text) {
    if (text.length > 10) {
      return TextStyle(
          fontFamily: "PokeHollow", fontSize: _calculateFontSize(0.03));
    } else {
      return TextStyle(
          fontFamily: "PokeHollow", fontSize: _calculateFontSize(0.04));
    }
  }

  static _calculateFontSize(double size) {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return size.sp.sh.w;
    } else {
      return (size * 1.02).sp.sh.w;
    }
  }

  static final Map<String, Color> _typeColorMap = {
    "Grass": Colors.green,
    "Fire": Colors.redAccent.shade700,
    "Water": Colors.blueAccent,
    "Electric": Colors.yellowAccent.shade700,
    "Rock": Colors.grey,
    "Ground": Colors.brown,
    "Bug": Colors.deepOrange.shade600,
    "Pyschic": Colors.indigo,
    "Fighthing": Colors.deepPurple.shade600,
    "Ghost": Colors.white24,
    "Normal": Colors.black26,
    "Poison": Colors.purple.shade900
  };

  static Color getBgColor(String type) {
    debugPrint(type);
    return _typeColorMap[type] ?? Colors.pink.shade400;
  }

  static getInfo(PokeModel pokemon) {
    final Map<String, String> _infoMap = {
      "Name": pokemon.name.toString(),
      "Height": pokemon.height.toString(),
      "Weight": pokemon.weight.toString(),
      "Spawn Time": pokemon.spawnTime.toString(),
      "Weakness": pokemon.weaknesses!.join(", ").toString(),
      "Pro Evolution": pokemon.prevEvolution.toString() == "[]"
          ? "Not avaliable"
          : pokemon.prevEvolution!.join(",").toString(),
      "Next Evolution": pokemon.nextEvolution.toString() == "[]"
          ? "Not avaliable"
          : pokemon.nextEvolution!.join().toString()
    };
    return getPokeList(_infoMap);
  }

  static getPokeList(Map<String, String> infomap) {
    List<pokeInfoC> pokeInfoList = [];
    infomap.forEach((key, value) => pokeInfoList.add(pokeInfoC(key, value)));
    return pokeInfoList;
  }
}
