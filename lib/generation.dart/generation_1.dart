import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_assessment/about/about_detail.dart';
import 'package:pokedex_assessment/bottom_nav.dart';
import 'package:pokedex_assessment/cubit/pokemon_cubit.dart';
import 'package:pokedex_assessment/cubit/pokemon_spesies_cubit.dart';
import 'package:pokedex_assessment/homes_screen.dart';

List<Map<dynamic, String>> dataPokemon = [
  {
    "angka": "1001",
    "gambar": "bulbasour.png",
    "nama": "Bulbasour",
  },
  {
    "angka": "1001",
    "gambar": "pikachu.png",
    "nama": "Pikachu",
  },
  {
    "angka": "1001",
    "gambar": "squirt.png",
    "nama": "Squritle",
  },
  {
    "angka": "1001",
    "gambar": "salmander.png",
    "nama": "Chalmander",
  },
  {
    "angka": "1001",
    "gambar": "weedle.png",
    "nama": "Weedle",
  },
];

class GenerationOne extends StatefulWidget {
  const GenerationOne({Key? key}) : super(key: key);

  @override
  State<GenerationOne> createState() => _GenerationOneState();
}

class _GenerationOneState extends State<GenerationOne> {
  // @override
  // void didChangeDependencies() {
  //   _showBottomSheet(context);
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage(
              'assets/img/pokemon-party.png',
            ),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5),
              BlendMode.darken,
            ),
          ),
        ),
        child: Center(
          child: Column(children: [
            const SizedBox(
              height: 10.5,
            ),
            SafeArea(
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(
                    width: 110,
                  ),
                  const Text(
                    "Generation 1",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 23),
                    Expanded(
                      child: Container(
                        color: Colors.white,
                        child: BlocBuilder<PokemonCubit, PokemonState>(
                          builder: (context, state) {
                            if (state is PokemonLoading) {
                              return Container(
                                  height: 50,
                                  width: 50,
                                  child: CircularProgressIndicator());
                            } else if (state is PokemonLoaded) {
                              return GridView.builder(
                                  itemCount: state.pokemons.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2),
                                  itemBuilder: ((context, index) {
                                    int i = 0;
                                    if (state.offset <= 10) {
                                      i = 0;
                                    } else {
                                      i = state.offset;
                                    }
                                    return GestureDetector(
                                        onTap: () {
                                          context
                                              .read<PokemonSpesiesCubit>()
                                              .getPokemon(
                                                  id: state.offset + index + 1);
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      AboutDetail()));
                                        },
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          elevation: 1,
                                          color: Colors.white,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                top: 16, bottom: 16),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "${state.offset + index}",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                Image(
                                                  image: NetworkImage(
                                                      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${state.offset + index + 1}.png'),
                                                  height: 120,
                                                ),
                                                Text(
                                                  "${state.pokemons[index].name}",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ));
                                  }));
                            } else {
                              return Column(
                                children: [
                                  Container(
                                    height: 30,
                                    child: ElevatedButton(
                                        onPressed: () {},
                                        child: Text(
                                            "Ada Kesalahan Silahkan Klik Untuk Refresh")),
                                  ),
                                ],
                              );
                            }
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}

// void _showBottomSheet(BuildContext context) {
//   showModalBottomSheet(
//     context: context,
//     isScrollControlled: true,
//     builder: (BuildContext context) {
//       return;
//     },
//   );
// }
