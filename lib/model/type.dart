// To parse this JSON data, do
//
//     final type = typeFromJson(jsonString);

import 'dart:convert';

Tipe typeFromJson(String str) => Tipe.fromJson(json.decode(str));

String typeToJson(Tipe data) => json.encode(data.toJson());

class Tipe {
  int? slot;
  TypeClass? type;

  Tipe({
    this.slot,
    this.type,
  });

  factory Tipe.fromJson(Map<String, dynamic> json) => Tipe(
        slot: json["slot"],
        type: TypeClass.fromJson(json["type"]),
      );

  Map<String, dynamic> toJson() => {
        "slot": slot,
        "type": type!.toJson(),
      };
}

class TypeClass {
  String? name;
  String? url;

  TypeClass({
    this.name,
    this.url,
  });

  factory TypeClass.fromJson(Map<String, dynamic> json) => TypeClass(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
