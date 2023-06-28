import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_assessment/cubit/pokemon_cubit.dart';
import 'package:pokedex_assessment/generation.dart/generation_1.dart';
import 'package:pokedex_assessment/bottom_nav.dart';
import 'package:pokedex_assessment/splashscreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> generations = [
    'GENERATION 1',
    'GENERATION 2',
    'GENERATION 3',
    'GENERATION 4',
    'GENERATION 5',
    'GENERATION 6',
    'GENERATION 7',
    'GENERATION 8'
  ];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: screenHeight * 0.1,
            ),
            const Text(
              'EXPLORE POKEMON',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.05,
            ),
            ...generations.asMap().keys.map((index) {
              return GestureDetector(
                onTap: () {
                  context
                      .read<PokemonCubit>()
                      .getPokemons(offset: index * 10, limit: 10);
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: Duration(
                          milliseconds:
                              500), // Durasi animasi (misalnya, 500ms)
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          GenerationOne(), // Halaman tujuan
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        var begin =
                            Offset(0.0, 1.0); // Mulai dari luar layar kiri
                        var end = Offset.zero; // Berakhir di posisi awal
                        var tween = Tween(begin: begin, end: end);
                        var offsetAnimation = animation.drive(tween);
                        return SlideTransition(
                          position: offsetAnimation,
                          child: child,
                        );
                      },
                    ),
                  );
                },
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: generations[index] == 'GENERATION 1'
                              ? const Color(0xff62C29D)
                              : const Color(0xff62C29D),
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          generations[index],
                          style: TextStyle(
                            color: generations[index] == 'GENERATION 1'
                                ? const Color(0xff62C29D)
                                : const Color(0xff62C29D),
                          ),
                        ),
                      ),
                      height: screenHeight * 0.06,
                      width: MediaQuery.of(context).size.width * 0.75,
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                  ],
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
