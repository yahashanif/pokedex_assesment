// To parse this JSON data, do
//
//     final stat = statFromJson(jsonString);

import 'dart:convert';

Stat statFromJson(String str) => Stat.fromJson(json.decode(str));

String statToJson(Stat data) => json.encode(data.toJson());

class Stat {
  String? name;
  String? url;

  Stat({
    this.name,
    this.url,
  });

  factory Stat.fromJson(Map<String, dynamic> json) => Stat(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
