import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/constants/constants.dart';
import 'package:pokedex/models/pokeModels.dart';

class PokeApi {
  static Future<List<PokeModel>> getPokeData() async {
    List<PokeModel> _liste = [];
    var result = await Dio().get(Constants.apiUrl);
    var pokeList = jsonDecode(result.data)["pokemon"];
    if (pokeList is List) {
      _liste = pokeList.map((e) => PokeModel.fromJson(e)).toList();
    }
    debugPrint(_liste.length.toString());
    for (var element in _liste) {
      debugPrint(element.name);
    }
    return _liste;
  }
}
