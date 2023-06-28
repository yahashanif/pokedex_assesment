part of 'pokemon_spesies_cubit.dart';

@immutable
abstract class PokemonSpesiesState {}

class PokemonSpesiesInitial extends PokemonSpesiesState {}

class PokemonSpesiesLoading extends PokemonSpesiesState {}

class PokemonSpesiesLoaded extends PokemonSpesiesState {
  final Pokemon? pokemon;

  PokemonSpesiesLoaded(this.pokemon);
}

class PokemonSpesiesError extends PokemonSpesiesState {
  final String error;

  PokemonSpesiesError(this.error);
}
