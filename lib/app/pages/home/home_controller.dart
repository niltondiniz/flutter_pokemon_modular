import 'package:mobx/mobx.dart';
import 'package:modular_teste/app/shared/models/pokemon_model.dart';
import 'package:modular_teste/app/shared/repositories/pokemon_repository.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  String text = '';

  final PokemonRepository repository;

  @observable
  PokemonModel actual;

  @observable
  ObservableFuture pokemons;

  HomeControllerBase(this.repository) {
    pokemons = repository.getAllPokemons().asObservable();
  }
}
