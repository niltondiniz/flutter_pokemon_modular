import 'package:dio/dio.dart';
import 'package:modular_teste/app/shared/models/pokemon_model.dart';

class PokemonRepository {
  final Dio dio;

  PokemonRepository(this.dio);

  Future<List<PokemonModel>> getAllPokemons() async {
    //https://pokeres.bastionbot.org/images/pokemon/1.png
    //?limit=151'
    int contador = 1;

    List<PokemonModel> list = [];
    var response = await dio.get('/pokemon?limit=151');

    for (var json in response.data['results'] as List) {
      PokemonModel pokemon = new PokemonModel(
          json['name'],
          'https://pokeres.bastionbot.org/images/pokemon/${contador++}.png',
          json['url']);
      list.add(pokemon);
    }

    return list;
  }
}
