// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on HomeControllerBase, Store {
  final _$actualAtom = Atom(name: 'HomeControllerBase.actual');

  @override
  PokemonModel get actual {
    _$actualAtom.reportRead();
    return super.actual;
  }

  @override
  set actual(PokemonModel value) {
    _$actualAtom.reportWrite(value, super.actual, () {
      super.actual = value;
    });
  }

  final _$pokemonsAtom = Atom(name: 'HomeControllerBase.pokemons');

  @override
  ObservableFuture<dynamic> get pokemons {
    _$pokemonsAtom.reportRead();
    return super.pokemons;
  }

  @override
  set pokemons(ObservableFuture<dynamic> value) {
    _$pokemonsAtom.reportWrite(value, super.pokemons, () {
      super.pokemons = value;
    });
  }

  @override
  String toString() {
    return '''
actual: ${actual},
pokemons: ${pokemons}
    ''';
  }
}
