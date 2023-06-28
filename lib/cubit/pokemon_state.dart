// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'pokemon_cubit.dart';

@immutable
abstract class PokemonState {}

class PokemonInitial extends PokemonState {}

class PokemonLoading extends PokemonState {}

class PokemonLoaded extends PokemonState {
  final List<Result> pokemons;
  final int offset;

  PokemonLoaded(
    this.pokemons,
    this.offset,
  );
}

class PokemonError extends PokemonState {
  final String error;

  PokemonError(this.error);
}
