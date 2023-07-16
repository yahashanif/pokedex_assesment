import 'dart:convert';

import 'package:pokedex_assessment/model/pokemon.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex_assessment/model/result.dart';

class PokemonServices {
  String APIkey = "https://pokeapi.co/api/v2/";
  Future<List<Result>> getPokemons(
      {required int offset, required int limit}) async {
    final response = await http
        .get(Uri.parse('${APIkey}pokemon/?offset=$offset&limit=$limit'));
    // Uri url = Uri.https(APIkey, 'pokemon/?offset=$offset&limit=$limit');
    // final response = await http.get(url);

    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      var data = result['results'];
      print(data);
      List<Result> pokemons = [];
      for (var item in data) {
        pokemons.add(Result.fromJson(item));
      }
      return pokemons;
    } else {
      throw Exception('Gagal get Pokemons');
    }
  }

  Future<Pokemon> getPokemon({required int id}) async {
    final response = await http.get(Uri.parse('${APIkey}pokemon/$id'));
    // Uri url = Uri.https(APIkey, 'pokemon/$id');

    // final response = await http.get(url);
    print(response.body);
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);

      Pokemon pokemon = Pokemon.fromJson(result);
      return pokemon;
    } else {
      throw Exception('Gagal get Pokemon');
    }
  }
}
