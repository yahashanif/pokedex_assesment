import 'package:pokedex_assessment/model/stat.dart';

class Stats {
  int? baseStat;
  int? effort;
  Stat? stat;

  Stats({
    this.baseStat,
    this.effort,
    this.stat,
  });

  factory Stats.fromJson(Map<String, dynamic> json) => Stats(
        baseStat: json["base_stat"],
        effort: json["effort"],
        stat: Stat.fromJson(json["stat"]),
      );

  Map<String, dynamic> toJson() => {
        "base_stat": baseStat,
        "effort": effort,
        "stat": stat!.toJson(),
      };
}
