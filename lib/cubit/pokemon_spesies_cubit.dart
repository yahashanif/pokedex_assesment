import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pokedex_assessment/datasource/pokemon_services.dart';

import '../model/pokemon.dart';

part 'pokemon_spesies_state.dart';

class PokemonSpesiesCubit extends Cubit<PokemonSpesiesState> {
  PokemonSpesiesCubit() : super(PokemonSpesiesInitial());
  void getPokemon({required int id}) async {
    try {
      emit(PokemonSpesiesLoading());
      Pokemon pokemon = await PokemonServices().getPokemon(id: id);
      emit(PokemonSpesiesLoaded(pokemon));
    } catch (e) {
      print(e.toString());
      emit(PokemonSpesiesError(e.toString()));
    }
  }
}
