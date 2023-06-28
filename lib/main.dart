import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_assessment/Splashscreen.dart';
import 'package:pokedex_assessment/cubit/pokemon_cubit.dart';
import 'package:pokedex_assessment/favorite_screen.dart';

import 'cubit/pokemon_spesies_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PokemonCubit(),
        ),
        BlocProvider(
          create: (context) => PokemonSpesiesCubit(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Splashscreen(),
      ),
    );
  }
}
