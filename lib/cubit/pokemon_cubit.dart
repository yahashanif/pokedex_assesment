import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:pokedex_assessment/datasource/pokemon_services.dart';

import '../model/pokemon.dart';
import '../model/result.dart';

part 'pokemon_state.dart';

class PokemonCubit extends Cubit<PokemonState> {
  PokemonCubit() : super(PokemonInitial());

  void getPokemons({required int offset, required int limit}) async {
    try {
      emit(PokemonLoading());
      final result =
          await PokemonServices().getPokemons(offset: offset, limit: limit);
      emit(PokemonLoaded(result, offset));
    } catch (e) {
      print(e);
      emit(PokemonError(e.toString()));
    }
  }
}
