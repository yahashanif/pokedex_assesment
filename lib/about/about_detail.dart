import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_assessment/cubit/pokemon_spesies_cubit.dart';
import 'package:pokedex_assessment/generation.dart/generation_1.dart';
import 'package:pokedex_assessment/model/ability.dart';
import 'package:pokedex_assessment/model/stats.dart';
import 'package:pokedex_assessment/splashscreen.dart';

class AboutDetail extends StatefulWidget {
  const AboutDetail({Key? key}) : super(key: key);

  @override
  State<AboutDetail> createState() => _AboutDetailState();
}

class _AboutDetailState extends State<AboutDetail> {
  int _selected = 0;
  @override
  Widget build(BuildContext context) {
    Widget _bar({required double value, required Color color}) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey[300], // Warna latar belakang kontainer
        ),
        width: double.infinity,
        height: 20, // Tinggi kontainer
        child: FractionallySizedBox(
          alignment: Alignment.topLeft,
          widthFactor: value, // Faktor lebar relatif (20%)
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: color, // Warna batang
            ),
          ),
        ),
      );
    }

    Widget _about({
      required int height,
      required int weight,
      required List<Ability> ability,
    }) {
      List<String> abilitys = [];
      ability.map((e) => abilitys.add(e.ability!.name!)).toList();

      return Container(
          child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Height"),
              SizedBox(
                height: 10,
              ),
              Text("Weight"),
              SizedBox(
                height: 10,
              ),
              Text("Abilities"),
            ],
          ),
          const SizedBox(
            width: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(":"),
              SizedBox(
                height: 10,
              ),
              Text(":"),
              SizedBox(
                height: 10,
              ),
              Text(":"),
            ],
          ),
          SizedBox(
            width: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("0.${height} m"),
              SizedBox(
                height: 10,
              ),
              Text("${weight} kg"),
              SizedBox(
                height: 10,
              ),
              Text(abilitys.join(',')),
            ],
          )
        ],
      ));
    }

    Widget _baseState(List<Stats> stats) {
      return Container(
          child: Column(
        children: stats.map((e) {
          Random random = Random();
          int r = random.nextInt(256);
          int g = random.nextInt(256);
          int b = random.nextInt(256);
          return Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        width: 150,
                        child: Text(e.stat!.name!),
                      ),
                      Text(":"),
                      Expanded(
                        child: _bar(
                            value: e.baseStat! / 100,
                            color: Color.fromRGBO(r, g, b, 1.0)),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        }).toList(),
      ));
      //      Row(
      //   children: [
      //     Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         Text("Hp"),
      //         SizedBox(
      //           height: 10,
      //         ),
      //         Text("Attack"),
      //         SizedBox(
      //           height: 10,
      //         ),
      //         Text("Deffense"),
      //         SizedBox(
      //           height: 10,
      //         ),
      //         Text("Special Attack"),
      //         SizedBox(
      //           height: 10,
      //         ),
      //         Text("Special Deffense"),
      //         SizedBox(
      //           height: 10,
      //         ),
      //         Text("Speed"),
      //       ],
      //     ),
      //     const SizedBox(
      //       width: 30,
      //     ),
      //     Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         Text(":"),
      //         SizedBox(
      //           height: 10,
      //         ),
      //         Text(":"),
      //         SizedBox(
      //           height: 10,
      //         ),
      //         Text(":"),
      //         SizedBox(
      //           height: 10,
      //         ),
      //         Text(":"),
      //         SizedBox(
      //           height: 10,
      //         ),
      //         Text(":"),
      //         SizedBox(
      //           height: 10,
      //         ),
      //         Text(":"),
      //       ],
      //     ),
      //     SizedBox(
      //       width: 10,
      //     ),
      //     Expanded(
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           Text("Seed Pokemon"),
      //           SizedBox(
      //             height: 10,
      //           ),
      //           _bar(value: 0.4, color: Colors.pink),
      //           SizedBox(
      //             height: 10,
      //           ),
      //           _bar(value: 0.4, color: Colors.pink),
      //           SizedBox(
      //             height: 10,
      //           ),
      //           _bar(value: 0.4, color: Colors.pink),
      //           SizedBox(
      //             height: 10,
      //           ),
      //           _bar(value: 0.4, color: Colors.pink),
      //           SizedBox(
      //             height: 10,
      //           ),
      //           _bar(value: 0.4, color: Colors.pink),
      //         ],
      //       ),
      //     )
      //   ],
      // ));
    }

    return Scaffold(
      body: BlocBuilder<PokemonSpesiesCubit, PokemonSpesiesState>(
        builder: (context, state) {
          if (state is PokemonSpesiesLoading) {
            return Container(
              height: 50,
              width: 50,
              child: CircularProgressIndicator(),
            );
          } else if (state is PokemonSpesiesLoaded) {
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(
                    'assets/img/background-generation.png',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsets.only(top: 10)),
                  SafeArea(
                    child: ListTile(
                      leading: IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        color: Color(0XFF242424),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                  Stack(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 150,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 24),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30)),
                            height: 500,
                            width: 347,
                            child: Padding(
                              padding: EdgeInsets.only(top: 70),
                              child: Column(
                                children: [
                                  // Image.asset("assets/img/bulbasour.png"),
                                  Text(
                                    state.pokemon!.name!,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: 32,
                                  ),

                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        width: 147,
                                        height: 35,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Color(0xff62C29D)),
                                            color: _selected == 0
                                                ? Color(0xff62C29D)
                                                : Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: MaterialButton(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                          // color: Color(0xFF18AA89),
                                          height: 40,
                                          onPressed: () {
                                            setState(() {
                                              _selected = 0;
                                            });
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'About',
                                                style: TextStyle(
                                                    color: _selected == 0
                                                        ? Colors.white
                                                        : Color(0xff62C29D),
                                                    fontSize: 15,
                                                    fontFamily: 'Poppins'),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 147,
                                        height: 35,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Color(0xff62C29D)),
                                            color: _selected == 1
                                                ? Color(0xff62C29D)
                                                : Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: MaterialButton(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                          // color: Color(0xFF18AA89),
                                          height: 40,
                                          onPressed: () {
                                            setState(() {
                                              _selected = 1;
                                            });
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Base State',
                                                style: TextStyle(
                                                    color: _selected == 1
                                                        ? Colors.white
                                                        : Color(0xff62C29D),
                                                    fontSize: 15,
                                                    fontFamily: 'Poppins'),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  _selected == 0
                                      ? _about(
                                          ability: state.pokemon!.abilities!,
                                          height: state.pokemon!.height!,
                                          weight: state.pokemon!.weight!)
                                      : _baseState(state.pokemon!.stats!),
                                  Spacer(),
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 40),
                                    height: 35,
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Color.fromARGB(255, 153, 222, 141),
                                            Color(0xff62C29D),
                                            Color(0xff62C29D)
                                          ], // Daftar warna gradient
                                          begin: Alignment
                                              .topLeft, // Posisi awal gradient
                                          end: Alignment
                                              .bottomRight, // Posisi akhir gradient
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: MaterialButton(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      // color: Color(0xFF18AA89),
                                      height: 40,
                                      onPressed: () {
                                        setState(() {
                                          _selected = 1;
                                        });
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'ADD TO FAVORITE',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontFamily: 'Poppins'),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        right: 0,
                        left: 0,
                        child: Container(
                          height: 225,
                          child: Image.network(
                            state.pokemon!.imageUrl!,
                            height: 225,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          }
          return SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 30,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Text("Ada Kesalahan Silahkan Klik Untuk Refresh")),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
