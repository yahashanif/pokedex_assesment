import 'package:pokedex_assessment/model/spesies.dart';
import 'package:pokedex_assessment/model/stats.dart';
import 'package:pokedex_assessment/model/type.dart';

import 'ability.dart';

class Pokemon {
  List<Ability>? abilities;
  int? baseExperience;
  List<Species>? forms;
  int? height;
  int? id;
  bool? isDefault;
  String? locationAreaEncounters;
  String? name;
  int? order;
  Species? species;
  List<Stats>? stats;
  List<Tipe>? types;
  int? weight;
  String? imageUrl;

  Pokemon(
      {this.abilities,
      this.baseExperience,
      this.forms,
      this.height,
      this.id,
      this.isDefault,
      this.locationAreaEncounters,
      this.name,
      this.order,
      this.species,
      this.stats,
      this.types,
      this.weight,
      this.imageUrl});

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    int id = json['id'];
    return Pokemon(
        abilities: List<Ability>.from(
            json["abilities"].map((x) => Ability.fromJson(x))),
        baseExperience: json["base_experience"],
        forms:
            List<Species>.from(json["forms"].map((x) => Species.fromJson(x))),
        height: json["height"],
        id: json["id"],
        isDefault: json["is_default"],
        locationAreaEncounters: json["location_area_encounters"],
        name: json["name"],
        order: json["order"],
        species: Species.fromJson(json["species"]),
        stats: List<Stats>.from(json["stats"].map((x) => Stats.fromJson(x))),
        types: List<Tipe>.from(json["types"].map((x) => Tipe.fromJson(x))),
        weight: json["weight"],
        imageUrl:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png");
  }

  Map<String, dynamic> toJson() => {
        "abilities": List<dynamic>.from(abilities!.map((x) => x.toJson())),
        "base_experience": baseExperience,
        "forms": List<dynamic>.from(forms!.map((x) => x.toJson())),
        "height": height,
        "id": id,
        "is_default": isDefault,
        "location_area_encounters": locationAreaEncounters,
        "name": name,
        "order": order,
        "species": species!.toJson(),
        "stats": List<dynamic>.from(stats!.map((x) => x.toJson())),
        "types": List<dynamic>.from(types!.map((x) => x.toJson())),
        "weight": weight,
      };
}
